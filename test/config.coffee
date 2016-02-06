# Header file for tests

# setup tape and spy
root.test = require('tape').test
root.spy = require('sinon').spy

# load node-import without wrapping to variable. 
require 'node-import'
