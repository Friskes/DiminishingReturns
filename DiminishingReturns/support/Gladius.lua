local addon = DiminishingReturns
if not addon then return end

addon:RegisterAddonSupport('Gladius', function()

	local db = addon.db:RegisterNamespace('Gladius', {profile={
		enabled = true,
		iconSize = 36,
		direction = 'LEFT',
		spacing = 2,
		anchorPoint = 'RIGHT',
		relPoint = 'LEFT',
		xOffset = -2,
		yOffset = 29,
		-- categories
		["cheapshot"] = false,
		["scatters"] = false,
		["ctrlstun"] = false,
		["rndroot"] = false,
		["charge"] = false,
		["disarm"] = false,
		["rndstun"] = false,
		["ctrlroot"] = false,
		["cyclone"] = false,
		["disorient"] = false,
		["taunt"] = false,
		["sleep"] = false,
		["entrapment"] = false,
		["banish"] = false,
		["silence"] = false,
		["horror"] = false,
		["fear"] = true,
		["mc"] = true,
	}})

	local function GetDatabase() 
		return db.profile, db
	end

	addon:RegisterFrameConfig('Gladius: arena1-5', GetDatabase)

	local function SetupFrame(frame)
		return addon:SpawnFrame(frame:GetParent(), frame, GetDatabase)
	end

	local needHook = false
	for i = 1,5 do
		if not addon:RegisterFrame('GladiusButton'..i, SetupFrame) then
			needHook = true
		end
	end

	if needHook then
		hooksecurefunc(Gladius, 'UpdateAttribute', function(gladius, unit)
			addon.CheckFrame(gladius.buttons[unit].secure)
		end)
	end
end)
