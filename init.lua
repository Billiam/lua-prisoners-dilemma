#!/usr/bin/env lua

package.path = debug.getinfo(1,"S").source:match[[^@?(.*[\/])[^\/]-$]] .."?.lua;".. package.path
require('bootstrap.init')(unpack(arg))