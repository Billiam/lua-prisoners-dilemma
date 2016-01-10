local DefectLast = require('lib.strategy.defect_last_rounds')
local Revenge = require('lib.strategy.revenge')
local Forgive = require('lib.strategy.forgive')
local nice = require('lib.strategy.nice')

local meta_strategy = require('lib.strategy.meta_strategy')

return meta_strategy(Forgive(10), Revenge(), DefectLast(), nice)
