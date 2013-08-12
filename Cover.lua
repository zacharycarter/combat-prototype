Cover = Tile:extend
{
	class = "Cover",

	props = {"x", "y", "id"},	
	
	sync_high = {},
	sync_low = {"id"},

	image = '/assets/graphics/cover.png',

	onNew = function (self)
		self:mixin(GameObject)
		self:mixin(GameObjectCommons)
		self:mixin(FogOfWarObject)
		--~ self.width = 64
		--~ self.height = 64
		--~ self:updateQuad()
		object_manager.create(self)
		
		the.app.view.layers.ground:add(self)
				
		
		drawDebugWrapper(self)
		the.covers[self] = true
	
	end,
	
	receiveBoth = function (self, message_name, ...)
		
	end,
	
	receiveLocal = function (self, message_name, ...)
		
	end,
	
	onUpdateBoth = function (self)	
		self:collide(the.player)
	end,
	
	onDieBoth = function (self)
		the.app.view.layers.ground:remove(self)
		the.covers[self] = nil
	end,
}
