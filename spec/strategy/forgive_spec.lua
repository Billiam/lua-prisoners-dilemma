local Forgive = require('lib.strategy.forgive')

describe('forgive', function()
  describe("with a run of confessions", function()
    local history = {
      {action="confess", player_action="confess"},
      {action="confess", player_action="confess"},
      {action="confess", player_action="confess"},
      {action="confess", player_action="confess"},
    }
    
    describe("in rounds prior to the forgiveness limit", function()
      it("takes no action", function()
        local strategy = Forgive(4)
  
        assert.is_nil(strategy(3, 50, history))
        assert.is_nil(strategy(4, 50, history))
      end)
    end)
    
    describe("after a run of confessions", function()
      local strategy = Forgive(2)
      
      it("remains silent twice", function()
        assert.are.same('silent', strategy(3, 50, history))
        assert.are.same('silent', strategy(4, 50, history))
      end)
    end)
    
    describe("after forgiving", function()
      local history = {
        {action="confess", player_action="confess"},
        {action="confess", player_action="confess"},
        {action="confess", player_action="confess"},
        {action="confess", player_action="confess"},
        {action="confess", player_action="silent"},
        {action="confess", player_action="silent"},
      }
      
      it("takes no action", function()
        local strategy = Forgive(4)
        
        assert.is_nil(strategy(7, 10, history))
      end)
    end)
  end)

  describe("without a run of confessions", function()
    local history = {
      {action="confess", player_action="confess"},
      {action="confess", player_action="confess"},
      {action="confess", player_action="confess"},
      {action="confess", player_action="silent"},
      {action="confess", player_action="silent"},
      {action="confess", player_action="confess"},
      {action="confess", player_action="confess"},
      {action="confess", player_action="confess"},
    }
    
    it("takes no action", function()
      local strategy = Forgive(4)

      assert.is_nil(strategy(9, 10, history))
    end)
  end)
end)
