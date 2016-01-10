local History = require('lib.history')

describe("history", function()
  describe(".create()", function()
    it("accepts a path argument", function()
      local path = 'path/to/files'
      local instance = History.create(path)
      
      assert.same(path, instance.path)
    end)
  end)
  
  describe(":add_actions()", function()
    local history
    before_each(function()
      history = History.create('path')
    end)
    
    describe("adds new actions", function()
      local results
      before_each(function()
        history:add_actions('player1', 'silent', 'confess')
        results = history:log('player1')
      end)
      
      it('has one result', function()
        assert.are.equal(1, #results)
      end)
      
      it("saves the opponent's action", function()
        assert.are.same('silent', results[1].action)
      end)
      
      it("saves the player's action", function()
        assert.are.same('confess', results[1].player_action)
      end)
    end)
    
    describe('saves multiple actions', function()
      before_each(function()
        history:add_actions('player1', 'silent', 'silent')
        history:add_actions('player1', 'silent', 'silent')
        history:add_actions('player1', 'silent', 'silent')
        history:add_actions('player2', 'silent', 'silent')
        history:add_actions('player2', 'silent', 'silent')
      end)
    
      it("stores results by player", function()
        assert.are.equal(3, #history:log('player1'))
        assert.are.equal(2, #history:log('player2'))
      end)
    end)
  end)
  
  describe(':round()', function()
    local history
    before_each(function()
      history = History.create('path')
    end)
    
    describe('returns the current round', function()
      before_each(function()
        history:add_actions('player1', 'silent', 'silent')
        history:add_actions('player1', 'silent', 'silent')
      end)
      
      it("starts on round 1", function()
        assert.are.equal(1, history:round('new-player'))
      end)
      
      it("returns the current round based on history", function()
        assert.are.equal(3, history:round('player1'))
      end)
    end)
  end)
  
  describe(':save()', function()
    it("delegates save to table.save", function()
      local history = History.create('path')
      
      stub(table, 'save')
      history:save()
  
      assert.spy(table.save).was_called_with({}, 'path')
    end)
  end)
  
  describe(':load()', function()
    it("delegates save to table.load", function()
      local history = History.create('path')
  
      stub(table, 'load')
      history:load()
  
      assert.spy(table.load).was_called_with('path')
    end)
    
    it("restores history data when loading", function()
      local history = History.create('path')
      local file_data = {player1 = { action="confess", player_action="silent" }}
  
      stub(table, 'load').returns(file_data)
      history:load()
      
      assert.are.equal(file_data, history.opponents)
    end)
  end)
end)
