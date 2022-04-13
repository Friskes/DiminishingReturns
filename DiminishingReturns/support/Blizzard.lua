local addon = DiminishingReturns
if not addon then return end

-- FrameXML is a internal fake to have this working like other support
addon:RegisterAddonSupport('FrameXML', function()

	local db = addon.db:RegisterNamespace('Blizzard', {profile={
		player = {
			enabled = false,
			iconSize = 30,
			direction = 'LEFT',
			spacing = 2,
			anchorPoint = 'BOTTOMLEFT',
			relPoint = 'BOTTOMLEFT',
			xOffset = 50,
			yOffset = -30,
			-- categories
			["cheapshot"] = true,
			["scatters"] = true,
			["ctrlstun"] = true,
			["rndroot"] = true,
			["charge"] = true,
			["disarm"] = true,
			["rndstun"] = true,
			["ctrlroot"] = true,
			["cyclone"] = true,
			["disorient"] = true,
			["taunt"] = true,
			["sleep"] = true,
			["entrapment"] = true,
			["banish"] = true,
			["silence"] = true,
			["horror"] = true,
			["fear"] = true,
			["mc"] = true,
		},
		target = {
			enabled = false,
			iconSize = 30,
			direction = 'RIGHT',
			spacing = 2,
			anchorPoint = 'LEFT',
			relPoint = 'RIGHT',
			xOffset = -35,
			yOffset = 6,
			-- categories
			["cheapshot"] = true,
			["scatters"] = true,
			["ctrlstun"] = true,
			["rndroot"] = true,
			["charge"] = true,
			["disarm"] = true,
			["rndstun"] = true,
			["ctrlroot"] = true,
			["cyclone"] = true,
			["disorient"] = true,
			["taunt"] = true,
			["sleep"] = true,
			["entrapment"] = true,
			["banish"] = true,
			["silence"] = true,
			["horror"] = true,
			["fear"] = true,
			["mc"] = true,
		},
		focus = {
			enabled = false,
			iconSize = 30,
			direction = 'RIGHT',
			spacing = 2,
			anchorPoint = 'LEFT',
			relPoint = 'RIGHT',
			xOffset = -35,
			yOffset = 6,
			-- categories
			["cheapshot"] = true,
			["scatters"] = true,
			["ctrlstun"] = true,
			["rndroot"] = true,
			["charge"] = true,
			["disarm"] = true,
			["rndstun"] = true,
			["ctrlroot"] = true,
			["cyclone"] = true,
			["disorient"] = true,
			["taunt"] = true,
			["sleep"] = true,
			["entrapment"] = true,
			["banish"] = true,
			["silence"] = true,
			["horror"] = true,
			["fear"] = true,
			["mc"] = true,
		},
	}})

	local function RegisterFrame(name, unit)
		local function GetDatabase() return db.profile[unit], db end
		addon:RegisterFrameConfig('Blizzard: '..addon.L[unit], GetDatabase)
		addon:RegisterFrame(name, function(frame)
			return addon:SpawnFrame(frame, frame, GetDatabase)
		end)
	end

	RegisterFrame('PlayerFrame', 'player')
	RegisterFrame('TargetFrame', 'target')
	RegisterFrame('FocusFrame', 'focus')
end)
