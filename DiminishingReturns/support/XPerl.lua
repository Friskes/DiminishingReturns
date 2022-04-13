local addon = DiminishingReturns
if not addon then return end

addon:RegisterAddonSupport('XPerl', function()

	local db = addon.db:RegisterNamespace('XPerl', {profile={
		player = {
			enabled = false,
			iconSize = 24,
			direction = 'RIGHT',
			spacing = 2,
			anchorPoint = 'BOTTOMLEFT',
			relPoint = 'TOPLEFT',
			xOffset = 4,
			yOffset = 4,
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
			anchorPoint = 'BOTTOMLEFT',
			relPoint = 'TOPLEFT',
			xOffset = 4,
			yOffset = 4,
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
			anchorPoint = 'BOTTOMLEFT',
			relPoint = 'TOPLEFT',
			xOffset = 4,
			yOffset = 4,
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

	local function ucfirst(s)
		return s:sub(1,1):upper()..s:sub(2)
	end

	local function RegisterFrame(unit)
		local function GetDatabase() return db.profile[unit], db end
		addon:RegisterFrameConfig('XPerl: '..addon.L[unit], GetDatabase)
		return addon:RegisterFrame('XPerl_'..ucfirst(unit), function(frame)
			return addon:SpawnFrame(frame, frame, GetDatabase)
		end)
	end

	local gotPlayer = RegisterFrame('player')
	local gotTarget = RegisterFrame('target')
	local gotFocus = RegisterFrame('focus')

	if not gotTarget or not gotFocus or not gotPlayer then
		hooksecurefunc('XPerl_SecureUnitButton_OnLoad', addon.CheckFrame)
	end
end)
