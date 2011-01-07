#!/bin/bash

WERKZEUG_VERSION=0.6.2
FLASK_VERSION=0.6.1
JINJA_VERSION=2.5.5

rm -rf sink
mkdir -p "sink"
cd sink

mkdir tmp
cd tmp

# Werkzeug
wget "http://pypi.python.org/packages/source/W/Werkzeug/Werkzeug-${WERKZEUG_VERSION}.tar.gz" -O werkzeug.tar.gz
tar xzf werkzeug.tar.gz
mv Werkzeug-${WERKZEUG_VERSION}/werkzeug ..
rm -rf Werkzeug-${WERKZEUG_VERSION}
rm werkzeug.tar.gz

# Jinja
wget "http://pypi.python.org/packages/source/J/Jinja2/Jinja2-${JINJA_VERSION}.tar.gz" -O jinja2.tar.gz
tar xzf jinja2.tar.gz
mv Jinja2-${JINJA_VERSION}/jinja2 ..
rm -rf Jinja2-${JINJA_VERSION}
rm jinja2.tar.gz

# Flask
wget "http://pypi.python.org/packages/source/F/Flask/Flask-${FLASK_VERSION}.tar.gz" -O flask.tar.gz
tar xzf flask.tar.gz
mv Flask-${FLASK_VERSION}/flask ..
rm -rf Flask-${FLASK_VERSION}
rm flask.tar.gz

cd ..
rmdir tmp

# Example code
cp -R ../example-code/* .
