from flask import Flask, render_template, request, redirect, url_for, flash
from flask_sqlalchemy import SQLAlchemy
import json

app = Flask(__name__)
with open('config.json', 'r') as c:
    params = json.load(c)["params"]
local_server = True


if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params["local_uri"]
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params["prod_uri"]
db = SQLAlchemy(app)


class Fashionm(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    img = db.Column(db.String(20), nullable=False)
    name = db.Column(db.String(100), nullable=False)
    ratings = db.Column(db.Integer, nullable=False)
    price = db.Column(db.Integer, nullable=False)
    ships = db.Column(db.String(25), nullable=False)


class Electronics(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    img = db.Column(db.String(20), nullable=False)
    name = db.Column(db.String(100), nullable=False)
    ratings = db.Column(db.Integer, nullable=False)
    price = db.Column(db.Integer, nullable=False)
    ships = db.Column(db.String(25), nullable=False)


class Cart(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    img = db.Column(db.String(20), nullable=False)
    name = db.Column(db.String(100), nullable=False)
    ratings = db.Column(db.Integer, nullable=False)
    price = db.Column(db.Integer, nullable=False)
    ships = db.Column(db.String(25), nullable=False)


@app.route('/')
def index():
    fashionm = Fashionm.query.filter_by().all()
    electronics = Electronics.query.filter_by().all()
    cart = Cart.query.filter_by().all()
    counter = len(cart)
    return render_template("index.html", fashionm=fashionm, electronics=electronics, params=params, counter=counter)


@app.route('/<string:product>/viewall')
def viewall(product):
    if product == "Electronics":
        electronics = Electronics.query.filter_by().all()
        cart = Cart.query.filter_by().all()
        counter = len(cart)
        return render_template("elc-viewall.html", electronics=electronics, params=params, counter=counter)
    elif product == "Fashionm":
        fashionm = Fashionm.query.filter_by().all()
        cart = Cart.query.filter_by().all()
        counter = len(cart)
        return render_template("fasm-viewall.html", fashionm=fashionm, params=params, counter=counter)


@app.route('/cart')
def cart():
    cart = Cart.query.filter_by().all()
    counter = len(cart)
    return render_template("cart.html", cart=cart, params=params, counter=counter)


@app.route('/view-prod/<string:product>/<string:sno>')
def viewprod(product, sno):
    if product == "Electronics":
        electronics = Electronics.query.filter_by(sno=sno).first()
        cart = Cart.query.filter_by().all()
        counter = len(cart)
        return render_template("viewprodelc.html", electronics=electronics, counter=counter)
    elif product == "Fashionm":
        fashionm = Fashionm.query.filter_by(sno=sno).first()
        cart = Cart.query.filter_by().all()
        counter = len(cart)
        return render_template("viewfasm.html", fashionm=fashionm, counter=counter)


@app.route("/cart/<string:product>/<string:sno>")
def cartadd(product, sno):
    error = None
    if product == "Fashionm":
        fashionm = Fashionm.query.filter_by(sno=sno).first()
        cart2 = Cart.query.filter_by(name=fashionm.name).first()
        if cart2 is None:
            cartt = Cart(name=fashionm.name, img=fashionm.img, ratings=fashionm.ratings, price=fashionm.price, ships=fashionm.ships)
            db.session.add(cartt)
            db.session.commit()
            cart1 = Cart.query.filter_by().all()
        else:
            cart = Cart.query.filter_by().all()
            error = "Already added to Cart"
            counter = len(cart)
            return render_template('cart.html', error=error, cart=cart, params=params, counter=counter)
        return render_template("cart.html", cart=cart1)
    if product == "Electronics":
        electronics = Electronics.query.filter_by(sno=sno).first()
        cart2 = Cart.query.filter_by(name=electronics.name).first()
        if cart2 is None:
            cartt = Cart(name=electronics.name, img=electronics.img, ratings=electronics.ratings, price=electronics.price, ships=electronics.ships)
            db.session.add(cartt)
            db.session.commit()
        else:
            cart = Cart.query.filter_by().all()
            error = "Already added to Cart"
            counter = len(cart)
            return render_template('cart.html', error=error, cart=cart, params=params, counter=counter)
        cart1 = Cart.query.filter_by().all()
        counter = len(cart1)
        return render_template("cart.html", cart=cart1, counter=counter)
    else:
        return redirect(url_for("/"))


@app.route("/remove-cart-item/<string:sno>")
def delitem(sno):
    cart1 = Cart.query.filter_by(sno=sno).first()
    db.session.delete(cart1)
    db.session.commit()
    return redirect('/cart')


@app.route("/view-cart-item/<string:sno>")
def viewCartItem(sno):
    cartItem = Cart.query.filter_by(sno=sno).first()
    name = cartItem.name
    nameE = Electronics.query.filter_by(name=name).first()
    nameFm = Fashionm.query.filter_by(name=name).first()
    if nameE is not None:
        sno = nameE.sno
        sno = str(sno)
        return redirect("/view-prod/Electronics/"+sno)
    elif nameFm is not None:
        sno = nameFm.sno
        sno = str(sno)
        return redirect("/view-prod/Fashionm/"+sno)
    else:
        return redirect('/cart')


app.run(debug=True)
