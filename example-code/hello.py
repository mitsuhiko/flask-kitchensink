# -*- coding: utf-8 -*-
from flask import Flask, render_template, flash

app = Flask(__name__)
app.secret_key = 'development secret key'
app.debug = True


@app.route('/')
def index():
    flash('Flask running and flashing messages works!')
    return render_template('index.html')
