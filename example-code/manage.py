#!/usr/bin/env python

# the path to the bundled libraries.  If you want to switch to a
# proper virtualenv based deployment later, just delete the 'libs'
# folder and the following two lines.
import os, sys
sys.path.append(os.path.join(os.path.dirname(__file__), 'libs'))

# the application to use for the manage script
from hello import app
from flaskext.script import Manager

manager = Manager(app)

@manager.command
def custom_command():
    """This is a custom command"""
    print 'Hello World'

if __name__ == '__main__':
    manager.run()
