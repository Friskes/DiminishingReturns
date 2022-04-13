local addon = DiminishingReturns
if not addon then return end

--[[if not IsAddOnLoaded("Blizzard_ArenaUI") then
	LoadAddOn("Blizzard_ArenaUI")
end]]

addon:RegisterAddonSupport('Blizzard_ArenaUI', function()

	local db = addon.db:RegisterNamespace('Blizzard_ArenaUIplayers', {profile={
		anchorPoint = "RIGHT",
		direction = "LEFT",
		spacing = 2,
		iconSize = 30,
		xOffset = -10,
		yOffset = -2,
		relPoint = "LEFT",
		enabled = false,
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
	}})

	local function GetDatabase() 
		return db.profile, db
	end

	addon:RegisterFrameConfig(addon.L['Blizzard: arena enemies'], GetDatabase)

	local function SetupFrame(frame)
		return addon:SpawnFrame(frame, frame, GetDatabase)
	end

	for i = 1,5 do
		addon:RegisterFrame('ArenaEnemyFrame'..i, SetupFrame)
	end
end)

-- FrameXMLXXX is a internal fake to have this working like other support
addon:RegisterAddonSupport('FrameXMLArenaUI', function()

	local db = addon.db:RegisterNamespace('Blizzard_ArenaUIpets', {profile={
		anchorPoint = "RIGHT",
		direction = "LEFT",
		spacing = 2,
		iconSize = 19,
		xOffset = -5,
		yOffset = -3,
		relPoint = "LEFT",
		enabled = false,
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
	}})

	local function GetDatabase() 
		return db.profile, db
	end

	addon:RegisterFrameConfig('Blizzard: arenapet1-5', GetDatabase)

	local function SetupFrame(frame)
		return addon:SpawnFrame(frame, frame, GetDatabase)
	end

	for i = 1,5 do
		addon:RegisterFrame('ArenaEnemyFrame'..i..'PetFrame', SetupFrame)
	end
end)
