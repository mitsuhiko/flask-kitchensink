# -*- coding: utf-8 -*-
from flask import Flask, render_template, flash

app = Flask(__name__)
app.config.from_pyfile('hello.cfg')


@app.route('/')
def index():
    flash('Flask is running and flashing messages works!')
    return render_template('index.html')
