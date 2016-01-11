#!/usr/bin/env lua

local path = debug.getinfo(1,"S").source:match[[^@?(.*[\/])[^\/]*$]]
path = path or './'
package.path = path .."?.lua;".. package.path
require('config').working_directory = path
require('bootstrap.init')(unpack(arg))
