local addon = DiminishingReturns
if not addon then return end

addon:RegisterAddonSupport('PitBull4', function()

	local db = addon.db:RegisterNamespace('PitBull4', {profile={
		player = {
			enabled = false,
			iconSize = 24,
			direction = 'RIGHT',
			spacing = 2,
			anchorPoint = 'TOPLEFT',
			relPoint = 'BOTTOMLEFT',
			xOffset = 0,
			yOffset = -4,
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
			iconSize = 24,
			direction = 'RIGHT',
			spacing = 2,
			anchorPoint = 'TOPLEFT',
			relPoint = 'BOTTOMLEFT',
			xOffset = 0,
			yOffset = -4,
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
			iconSize = 24,
			direction = 'RIGHT',
			spacing = 2,
			anchorPoint = 'TOPLEFT',
			relPoint = 'BOTTOMLEFT',
			xOffset = 0,
			yOffset = -4,
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

	local function RegisterSingletonFrame(unit)
		local function GetDatabase() return db.profile[unit], db end
		addon:RegisterFrameConfig('PitBull4: '..addon.L[unit], GetDatabase)
		addon:RegisterFrame('PitBull4_Frames_'..unit, function(frame)
			return addon:SpawnFrame(frame, frame, GetDatabase)
		end)
	end

	RegisterSingletonFrame('player')
	RegisterSingletonFrame('target')
	RegisterSingletonFrame('focus')
end)
