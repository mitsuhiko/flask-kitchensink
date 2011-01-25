#!/bin/bash

WERKZEUG_VERSION=0.6.2
FLASK_VERSION=0.6.1
JINJA_VERSION=2.5.5
FLASK_SCRIPT_VERSION=0.3.1

mkdir -p _sink
cd _sink

mkdir libs
mkdir tmp
cd tmp

# Werkzeug
wget "http://pypi.python.org/packages/source/W/Werkzeug/Werkzeug-${WERKZEUG_VERSION}.tar.gz" -O werkzeug.tar.gz
tar xzf werkzeug.tar.gz
mv Werkzeug-${WERKZEUG_VERSION}/werkzeug ../libs
rm -rf Werkzeug-${WERKZEUG_VERSION}
rm werkzeug.tar.gz

# Jinja
wget "http://pypi.python.org/packages/source/J/Jinja2/Jinja2-${JINJA_VERSION}.tar.gz" -O jinja2.tar.gz
tar xzf jinja2.tar.gz
mv Jinja2-${JINJA_VERSION}/jinja2 ../libs
rm -rf Jinja2-${JINJA_VERSION}
rm jinja2.tar.gz

# Flask
wget "http://pypi.python.org/packages/source/F/Flask/Flask-${FLASK_VERSION}.tar.gz" -O flask.tar.gz
tar xzf flask.tar.gz
mv Flask-${FLASK_VERSION}/flask ../libs
rm -rf Flask-${FLASK_VERSION}
rm flask.tar.gz

# Flask-Script
wget "http://pypi.python.org/packages/source/F/Flask-Script/Flask-Script-${FLASK_SCRIPT_VERSION}.tar.gz" -O flaskscript.tar.gz
tar xzf flaskscript.tar.gz
mv Flask-Script-${FLASK_SCRIPT_VERSION}/flaskext ../libs
rm -rf Flask-Script-${FLASK_SCRIPT_VERSION}
rm flaskscript.tar.gz

# remove magic __init__ from Flask-Script and other flask extensions.
# that requires pkg_resources which might not be there.
rm ../libs/flaskext/__init__.py
touch ../libs/flaskext/__init__.py

cd ..
rmdir tmp

# Example code
cp -R ../example-code/* .

# Package it up
cd ..
mv _sink Flask-Kitchensink-${FLASK_VERSION}
zip -r Flask-Kitchensink-${FLASK_VERSION}.zip Flask-Kitchensink-${FLASK_VERSION}
rm -rf Flask-Kitchensink-${FLASK_VERSION}
