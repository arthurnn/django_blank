'''
Created on Sep 12, 2011

@author: arthurnn
'''
import os

# Set a default value for environments
default = 'development'
# Grab the current environment from the system environment variable named
# DJANGO_ENV
current_env = os.getenv('DJANGO_ENV', default=None)
# Print an alert if no value is found: better for debug
if current_env == None:
    print "No DJANGO_ENV defined. Falling back to '%s'." % default
    current_env = default
# Must match the config.(name) convention, so it must be lowercased and without
# dots in it. CURRENT_ENV is when you want to behave differently depending on
# which env you are running on.
CURRENT_ENV = current_env = current_env.lower()
if '.' in current_env:
    raise Exception('You configuration environment must not contain a dot.')
# Finally import the configuration
exec("from config import *") # This is the base configuration
try:
    exec("from config.%s import *" % current_env) # This is the specific configuration.
except ImportError:
    print "The module 'config.%s' was not found. Only the base configuration\
    has been imported." % current_env
