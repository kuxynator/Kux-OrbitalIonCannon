
	local prerequision2level = 6
	local prerequision2name= "energy-weapons-damage-"

	if mods["space-exploration"] and settings.startup["ion-cannon-early-recipe"].value then prerequision2level = 2 end
	if data.raw.technology["rampant-arsenal-technology-energy-weapons-damage-6"] then prerequision2name="rampant-arsenal-technology-energy-weapons-damage-" end

	local rocketSiloPrerequisite = "rocket-silo"
	

	local ingredientsCannon =
	{
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"military-science-pack", 1}
	}

	--Add rocket science pack prerequisite and research cost for SE 0.6
	if data.raw["technology"]["se-rocket-science-pack"] then
		rocketSiloPrerequisite = "se-rocket-science-pack"
		table.insert(ingredientsCannon, {"se-rocket-science-pack", 1})
	end

	if not settings.startup["ion-cannon-early-recipe"].value then
		table.insert(ingredientsCannon, {"utility-science-pack", 1})
		table.insert(ingredientsCannon, {"production-science-pack", 1})
		table.insert(ingredientsCannon, {"space-science-pack", 1})
	elseif not mods["space-exploration"] then
		table.insert(ingredientsCannon, {"utility-science-pack", 1})
		table.insert(ingredientsCannon, {"production-science-pack", 1})
	end

	local ingredientsTargeting =
	{
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"military-science-pack", 1},
		{"space-science-pack", 1}
	}
	if not mods["space-exploration"] or not settings.startup["ion-cannon-early-recipe"].value then 
		table.insert(ingredientsTargeting, {"utility-science-pack", 1})
		table.insert(ingredientsTargeting, {"production-science-pack", 1})
	end


	data:extend({
		{
			type = "technology",
			name = "orbital-ion-cannon",
			icon = ModPath.."graphics/icon64.png",
			icon_size = 64,
			prerequisites = {rocketSiloPrerequisite, prerequision2name..prerequision2level},
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "orbital-ion-cannon"
				},
				{
					type = "unlock-recipe",
					recipe = "ion-cannon-targeter"
				}
			},
			unit =
			{
				count = 5000,
				ingredients = ingredientsCannon,
				time = 60
			},
			order = "k-a"
		},
		{
			type = "technology",
			name = "auto-targeting",
			icon = ModPath.."graphics/AutoTargetingTech.png",
			icon_size = 64,
			prerequisites = {"orbital-ion-cannon"},
			effects = {},
			unit =
			{
				count = 4000,
				ingredients = ingredientsTargeting,
				time = 60
			},
			order = "k-b"
		},
	})

	if data.raw["item"]["bob-laser-turret-5"] and settings.startup["ion-cannon-bob-updates"].value then
		data.raw["technology"]["orbital-ion-cannon"].prerequisites = {"rocket-silo", "energy-weapons-damage-6", "bob-laser-turrets-5"}
	end

	if data.raw["item"]["fast-accumulator-3"] and data.raw["item"]["solar-panel-large-3"] and settings.startup["ion-cannon-bob-updates"].value then
		data.raw["technology"]["orbital-ion-cannon"].prerequisites = {"rocket-silo", "energy-weapons-damage-6",	"bob-solar-energy-4", "bob-electric-energy-accumulators-4"}
	end

	if data.raw["item"]["fast-accumulator-3"] and data.raw["item"]["solar-panel-large-3"] and data.raw["item"]["bob-laser-turret-5"] and settings.startup["ion-cannon-bob-updates"].value then
		data.raw["technology"]["orbital-ion-cannon"].prerequisites = {"rocket-silo", "energy-weapons-damage-6", "bob-solar-energy-4", "bob-electric-energy-accumulators-4", "bob-laser-turrets-5"}
	end

