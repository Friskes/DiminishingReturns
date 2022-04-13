local addon = DiminishingReturns
if not addon then return end

local db

addon:RegisterAddonSupport('ShadowedUnitFrames', function()

	db = addon.db:RegisterNamespace('ShadowedUnitFrames', {profile={
		player = {
			enabled = true,
			iconSize = 27,
			direction = 'BOTTOM',
			spacing = 2,
			anchorPoint = 'TOPLEFT',
			relPoint = 'LEFT',
			xOffset = -50,
			yOffset = 28,
			-- categories
			["cheapshot"] = false,
			["scatters"] = false,
			["ctrlstun"] = false,
			["rndroot"] = false,
			["charge"] = false,
			["disarm"] = false,
			["rndstun"] = false,
			["ctrlroot"] = false,
			["cyclone"] = true,
			["disorient"] = true,
			["taunt"] = false,
			["sleep"] = false,
			["entrapment"] = false,
			["banish"] = false,
			["silence"] = false,
			["horror"] = false,
			["fear"] = true,
			["mc"] = false,
		},
		target = {
			enabled = false,
			iconSize = 20,
			direction = 'RIGHT',
			spacing = 2,
			anchorPoint = 'LEFT',
			relPoint = 'RIGHT',
			xOffset = 5,
			yOffset = 0,
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
			iconSize = 20,
			direction = 'RIGHT',
			spacing = 2,
			anchorPoint = 'LEFT',
			relPoint = 'RIGHT',
			xOffset = 5,
			yOffset = 0,
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

	local function RegisterFrame(unit)
		local function GetDatabase() return db.profile[unit], db end
		addon:RegisterFrameConfig('SUF: '..addon.L[unit], GetDatabase)
		addon:RegisterFrame('SUFUnit'..unit, function(frame)
			return addon:SpawnFrame(frame, frame, GetDatabase)
		end)
	end

	RegisterFrame('player')
	RegisterFrame('target')
	RegisterFrame('focus')
	
end)

-- ShadowedUF_Arena depends on SUF so it is loaded after and db would be initialized at that time
addon:RegisterAddonSupport('ShadowedUF_Arena', function()
	local function GetDatabase() return db.profile.arena, db end
	local function SetupFrame(frame)
		return addon:SpawnFrame(frame, frame, GetDatabase)
	end
	addon:RegisterFrameConfig('SUF: '..addon.L["Arena"], GetDatabase)
	for index = 1, 5 do
		addon:RegisterFrame('SUFHeaderarenaUnitButton'..index, SetupFrame)
	end
end)
