from flask import Flask, render_template, request, url_for, redirect
from flask_sqlalchemy import SQLAlchemy
import json
from datetime import datetime
from flask_mail import Mail

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

app = Flask(__name__)

local_server = True

if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)


class Notes(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(25), nullable=False)
    subtitle = db.Column(db.String(30), nullable=True)
    content = db.Column(db.String(300), nullable=False)
    date = db.Column(db.String(12), nullable=True)


@app.route('/', methods=['GET', 'POST'])
def index():
    return render_template("index.html")


@app.route('/notes', methods=['GET', 'POST'])
def note():
    notes = Notes.query.all()
    return render_template("Notes.html", notes=notes)


@app.route("/editNotes/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    if request.method == "POST" and sno != '0':
        title = request.form.get('title')
        subtitle = request.form.get('subtitle')
        content = request.form.get('content')
        note = Notes.query.filter_by(sno=sno).first()
        note.title = title
        note.subtitle = subtitle
        note.content = content
        db.session.commit()
        return redirect('/notes')
    note = Notes.query.filter_by(sno=sno).first()
    return render_template('editNotes.html', note=note)


@app.route("/addNotes/<string:sno>", methods=['GET', 'POST'])
def add(sno):
    if request.method == "POST":
        title = request.form.get('title')
        subtitle = request.form.get('subtitle')
        content = request.form.get('content')
        if sno == '0':
            note = Notes(title=title, subtitle=subtitle, content=content, date=datetime.now())
            db.session.add(note)
            db.session.commit()
        return redirect('/notes')
    note = Notes.query.filter_by(sno=sno).first()
    return render_template('addNotes.html', sno=sno)


@app.route("/deleteNotes/<string:sno>", methods=['GET', 'POST'])
def delete(sno):
    note = Notes.query.filter_by(sno=sno).first()
    db.session.delete(note)
    db.session.commit()
    return redirect('/notes')

#######################################################################################################################
#######################################################################################################################
#######################################################################################################################


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(30), nullable=False)
    tagline = db.Column(db.String(30), nullable=True)
    img_file = db.Column(db.String(20), nullable=True)
    slug = db.Column(db.String(50), nullable=True)
    content = db.Column(db.String(2000), nullable=False)
    date = db.Column(db.String(12), nullable=True)


@app.route('/posts', methods=['GET', 'POST'])
def post():
    posts = Posts.query.all()
    return render_template("posts.html", posts=posts)


@app.route('/viewPost/<string:sno>', methods=['GET', 'POST'])
def viewpost(sno):
    post = Posts.query.filter_by(sno=sno).first()
    return render_template("viewpost.html", post=post)


@app.route("/addPosts/<string:sno>", methods=['GET', 'POST'])
def addpost(sno):
    if request.method == "POST":
        title = request.form.get('title')
        tagline = request.form.get('tagline')
        slug = request.form.get('slug')
        img_file = request.form.get('img-file')
        content = request.form.get('content')
        if sno == '0':
            posts = Posts(title=title, tagline=tagline, slug=slug, content=content, img_file=img_file, date=datetime.now())
            db.session.add(posts)
            db.session.commit()
        return redirect('/posts')
    post = Posts.query.filter_by(sno=sno).first()
    return render_template('addPosts.html', sno=sno)


@app.route("/editPost/<string:sno>", methods=['GET', 'POST'])
def editPost(sno):
    if request.method == "POST" and sno != '0':
        title = request.form.get('title')
        tagline = request.form.get('tagline')
        slug = request.form.get('slug')
        img_file = request.form.get('img-file')
        content = request.form.get('content')
        post = Posts.query.filter_by(sno=sno).first()
        post.title = title
        post.tagline = tagline
        post.content = content
        post.slug = slug
        post.img_file = img_file
        db.session.commit()
        return redirect('/posts')
    post = Posts.query.filter_by(sno=sno).first()
    return render_template('editPost.html', post=post)


@app.route("/deletePost/<string:sno>", methods=['GET', 'POST'])
def deletepost(sno):
    post = Posts.query.filter_by(sno=sno).first()
    db.session.delete(post)
    db.session.commit()
    return redirect('/posts')


app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail-user'],
    MAIL_PASSWORD=params['gmail-password']
)
mail = Mail(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    phone = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)


@app.route("/contact", methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, phone=phone, email=email, date=datetime.now(), msg=message)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from '+name,
                          sender=email,
                          recipients=[params['gmail-user']],
                          body=message+'\n'+"Phone No.:"+phone+'\n'+"From: "+email
                          )
    return render_template("contact.html", params=params)


app.run(debug=True)
