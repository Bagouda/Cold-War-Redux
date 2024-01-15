NDefines.NGame.START_DATE = "1946.1.1.12"
NDefines.NGame.END_DATE = "1954.1.1.1"
NDefines.NGame.GAME_SPEED_SECONDS = { 1.0, 0.5, 0.2, 0.1, 0.0 }
NDefines.NDiplomacy.VOLUNTEERS_PER_TARGET_PROVINCE = 1
NDefines.NDiplomacy.VOLUNTEERS_PER_COUNTRY_ARMY = 0
NDefines.NDiplomacy.VOLUNTEERS_DIVISIONS_REQUIRED = 5
NDefines.NDiplomacy.VOLUNTEERS_TRANSFER_SPEED = 10
NDefines.NDiplomacy.VOLUNTEERS_DIVISIONS_REQUIRED = 0 -- TODO: change
NDefines.NCountry.AIR_VOLUNTEER_PLANES_LIMIT = 0.5
NDefines.NAI.MAX_VOLUNTEER_ARMY_FRACTION = 0.1
NDefines.NDiplomacy.TENSION_VOLUNTEER_FORCE_DIVISION = 0.0
NDefines.NDiplomacy.TENSION_DECAY = 0.05
NDefines.NDiplomacy.BASE_CONDITIONAL_PEACE_MONTHS = 6
NDefines.NCountry.BASE_RESEARCH_SLOTS = 0
NDefines.NCountry.CIVIL_WAR_INVOLVEMENT_MIN_TENSION = 0.0
NDefines.NCountry.MAJOR_MIN_FACTORIES = 100
NDefines.NCountry.MIN_FOCUSES_FOR_CONTINUOUS = 0
NDefines.NCountry.BASE_STABILITY_PARTY_POPULARITY_FACTOR = 0.10
NDefines.NCountry.BASE_STABILITY_WAR_FACTOR = 0.55
NDefines.NCountry.WAR_SUPPORT_DEFENSIVE_WAR = 0.05				-- Impact of being in defensive war
NDefines.NCountry.WAR_SUPPORT_OFFNSIVE_WAR = -0.01
NDefines.NCountry.WAR_SUPPORT_TENSION_IMPACT = 0.001
NDefines.NTrade.BASE_TRADE_FACTOR = 50
NDefines.NAI.REQUEST_LEND_LEASE_PROTECT_VALUE = 0
NDefines.NAI.MINIMUM_EQUIPMENT_TO_ASK_LEND_LEASE = 100      -- AI will accept to lend lease this equipment only if our stockpile is less than that.
NDefines.NAI.MINIMUM_CONVOY_TO_ASK_LEND_LEASE = 30        -- AI will accept to lend lease convoys only if our stockpile is less than that (special case because convoy stockpile can't be negative).
NDefines.NAI.MINIMUM_FUEL_DAYS_TO_ASK_LEND_LEASE = 2      -- AI will accept to lend lease fuel only if the player have less fuel than this number multiply by his max daily consumption.
NDefines.NAI.MINIMUM_FUEL_DAYS_TO_ACCEPT_LEND_LEASE = 10   -- AI will accept to lend lease fuel only if they have more fuel than this number multiply by their max daily consumption. Note that for a GiE asking to its host, we divide this number by 2.
NDefines.NOperatives.AGENCY_CREATION_DAYS = 90
NDefines.NOperatives.AGENCY_UPGRADE_DAYS = 90
NDefines.NOperatives.AGENCY_CREATION_FACTORIES = 20
NDefines.NOperatives.OPERATIVE_BASE_PROPAGANDA_POWER = 0.0010
NDefines.NIntel.CAPTURED_OPERATIVE_MAX_FACTOR = 5.0
NDefines.NIntel.CAPTURED_OPERATIVE_MIN_FACTOR = 1.0
NDefines.NNavy.NAVAL_SUPREMACY_CAN_INVADE = 0.0
NDefines.NMilitary.COMBAT_MINIMUM_TIME = 12
NDefines.NCharacter.SPECIALIST_ADVISOR_MIN_RANK = 9
NDefines.NCharacter.EXPERT_ADVISOR_MIN_RANK = 9
NDefines.NCharacter.GENIUS_ADVISOR_MIN_RANK = 9


NSupply = {
	MAX_RAILWAY_LEVEL = 5, -- update railway texture as well, each frame corresponds to a level

	--defines to calculate the capitals supply. This will be also used for max supply of other nodes depending on how well they are connected to capital. Using the formula:
	--CapitalSupply = CAPITAL_SUPPLY_BASE + (NumberOfCivilianFactories * CAPITAL_SUPPLY_CIVILIAN_FACTORIES) + (NumberOfMilitaryFactories * CAPITAL_SUPPLY_MILITARY_FACTORIES) + (NumberOfDockyards * CAPITAL_SUPPLY_DOCKYARDS)
	CAPITAL_SUPPLY_BASE = 10.0, -- base supply for capital
	CAPITAL_SUPPLY_CIVILIAN_FACTORIES = 0.6, -- supply from one civilian factory
	CAPITAL_SUPPLY_MILITARY_FACTORIES = 0.3, -- supply from one military factory
	CAPITAL_SUPPLY_DOCKYARDS = 0.8, --supply from one naval factory

	-- defines that are used for supply reach for capital
	-- supply flow will start from INITIAL_SUPPLY_FLOW and will be reduced by a penalty on each province it travels (which depends on how far we are from our origin, terrain etc)
	-- a supply reach >= 1.0 considered "perfect" and will be able to fully support units on that particular province (assuming you are not over capacity)
	CAPITAL_INITIAL_SUPPLY_FLOW = 10.0, -- starting supply from
	CAPITAL_STARTING_PENALTY_PER_PROVINCE = 0.2, -- starting penalty that will be added as supply moves away from its origin (modified by stuff like terrain)
	CAPITAL_ADDED_PENALTY_PER_PROVINCE = 0.8, -- added penalty as we move away from origin

	-- defines that are used for supply reach for built nodes
	NODE_INITIAL_SUPPLY_FLOW = 3.5,
	NODE_STARTING_PENALTY_PER_PROVINCE = 0.30,
	NODE_ADDED_PENALTY_PER_PROVINCE = 0.40,

	-- defines that are used for supply reach for dockyards
	NAVAL_BASE_INITIAL_SUPPLY_FLOW = 5.3,
	NAVAL_BASE_STARTING_PENALTY_PER_PROVINCE = 0.4,
	NAVAL_BASE_ADDED_PENALTY_PER_PROVINCE = 0.5,

	-- Node Flow (i.e. province caps) increase by this amount per railway level of the node's bottleneck
	NODE_FLOW_BONUS_PER_RAIL_LEVEL = 0.64,

	-- rivers will transfer in between nodes as if they were this level
	RIVER_RAILWAY_LEVEL = 1,

	-- defines that are used for supply reach for floating harbors
	FLOATING_HARBOR_INITIAL_SUPPLY_FLOW = 2.6,
	FLOATING_HARBOR_STARTING_PENALTY_PER_PROVINCE = 0.8,
	FLOATING_HARBOR_ADDED_PENALTY_PER_PROVINCE = 0.8,

	FLOATING_HARBOR_BASE_SUPPLY = 15.0, -- supply given by a floating harbor
	FLOATING_HARBOR_BASE_DURATION = 21, -- duration of a full hp floating harbor
	FLOATING_HARBOR_DURATION_RATIO_AT_MIN_HP = 0.0,  -- duration mult for a harbor that was reduced to 0 hp

	FLOATING_HARBOR_MIN_DECAY = 0.2, -- Always reduce Floating Harbor longevity by this many "hours" per hour
	FLOATING_HARBOR_DECAY_MAX_AIR_BONUS = -0.1, -- At 100% Friendly Air superiourity, change decay rate by this many "hours" per hour
	FLOATING_HARBOR_DECAY_MAX_AIR_PENALTY = 0.4, -- At 100% Enemy Air superiourity, change decay rate by this many "hours" per hour
	FLOATING_HARBOR_DECAY_MAX_NAVAL_BONUS = -0.2, -- At 100% Friendly naval superiourity, change decay rate by this many "hours" per hour
	FLOATING_HARBOR_DECAY_MAX_NAVAL_PENALTY = 0.5, -- At 100% Enemy Naval superiourity, change decay rate by this many "hours" per hour
	FLOATING_HARBOR_DECAY_NO_CONTROL_PENALTY = 1.0, -- If adjacent land province is not held, change decay rate by this many "hours" per hour

	SUPPLY_FLOW_DROP_REDUCTION_AT_MAX_INFRA = 0.30, -- max infrastructure level will reduce the supply flow drop off by this ratio
	SUPPLY_FLOW_PENALTY_CROSSING_RIVERS = 0.20, -- crossing rivers introduces additional penalty

	 -- node flow terrain falloff is scaled by logistics curve based on distance(d) (scalar / (1+e^(-k(d-midpoint))))
	SUPPLY_FLOW_DIST_LOGISTICS_FALLOFF_K = 1.3, -- How steep the curve is
	SUPPLY_FLOW_DIST_LOGISTICS_FALLOFF_MIDPOINT = 2.3, -- sigmoid inflection point
	SUPPLY_FLOW_DIST_LOGISTICS_FALLOFF_SCALAR = 0.5, -- Max Penalty adjustment due to distance
	SUPPLY_FLOW_DIST_LOGISTICS_FALLOFF_MIN_PENALTY_SCALE = 0.25, -- Logistics curve never reduces penalty facor below this limit

	-- The range bonus added to a fully motorized hub. This supply is added on top of the XXX_INITIAL_SUPPLY_FLOW defined above.
	SUPPLY_HUB_FULL_MOTORIZATION_BONUS = 2.2,
	-- How many trucks does it cost to fully motorize a hub
	SUPPLY_HUB_FULL_MOTORIZATION_TRUCK_COST = 80.0,
	-- For each additional level of motorization on a hub (i.e. contry with set motoriazation) reduce max bonus for next level by this amount
	SUPPLY_HUB_MOTORIZATION_MARGINAL_EFFECT_DECAY = 1.6,


	-- used for calculating "flow" for railways.
	RAILWAY_BASE_FLOW = 15.0, 		-- how much base flow railway gives when a node connected to its capital/a naval node by a railway
	RAILWAY_FLOW_PER_LEVEL = 8.0, 	-- how much additional flow a railway level gives
	RAILWAY_FLOW_PENALTY_PER_DAMAGED = 5.0, -- penalty to flow per damaged railway
	RAILWAY_MIN_FLOW = 5.0, 		-- minimum railway flow can be reduced to

	-- used for calculating "flow" from a naval node to another naval node when it is connected via a convoy route
	-- NAVAL_BASE_MAX_SUPPLY_FLOW_FACTOR = 0.9, -- flow of the parent node is factored to this ratio (so at most it can transfer parent naval node flow * this define)
	NAVAL_BASE_FLOW = 15.0, -- max output/input of a naval node is limited by this base value + additional ratio for each level
	NAVAL_FLOW_PER_LEVEL = 5.0, -- max output/input of a naval node is limited by previous base value + this define per its level

	SUPPLY_NODE_MIN_SUPPLY_THRESHOLD = 1.0, -- if supply of a node is below this value it will be set to 0 -- Currently unused?

	INFRA_TO_SUPPLY = 0.5,							-- each level of infra gives this many supply
	VP_TO_SUPPLY_BASE = 0.2,							-- Bonus to supply from a VP, no matter the level
	VP_TO_SUPPLY_BONUS_CONVERSION = 0.05,			-- Bonus to supply local supplies from Victory Points, multiplied by this aspect and rounded to closest integer
	SUPPLY_FROM_DAMAGED_INFRA = 0.15,                -- damaged infrastructure counts as this in supply calcs
	SUPPLY_BASE_MULT = 0.2,							-- multiplier on supply base values
	SUPPLY_DISRUPTION_DAILY_RECOVERY = 1.5,		-- every day nodes recover this much of their accumulated disruption.

	RAILWAY_CONVERSION_COOLDOWN = 10, -- railways will be put on cooldown when they are captured by enemy and will not be usable during the cooldown
	RAILWAY_CONVERSION_COOLDOWN_CORE = 5,
	RAILWAY_CONVERSION_COOLDOWN_CIVILWAR = 0,

	DEFAULT_STARTING_TRUCK_RATIO = 1.5, -- countries get this ratio of starting truck in their buffers compared to their need
	DEFAULT_STARTING_TRAIN_RATIO = 1, -- countries get this ratio of starting trains in their buffers compared to their need

	SUPPLY_POINTS_PER_TRAIN = 1.25,  -- old default 1.25 -- Amount of supply that can fit in a train. (Trains distribute supply from capital to a supply node.)
	NUM_RAILWAYS_TRAIN_FACTOR = 0.03, -- the train usage is scaled by railway distance between the supply node and the capital multiplied by this factor

	BASE_SUPPLY_MULT_FOR_TRUCK_DEFAULT_BUFFER = 1.0,  -- initial value for wanted buffers over potential truck usage
	BASE_SUPPLY_MULT_FOR_TRUCK_MIN_BUFFER = 0.0, -- min and max values for buffer ratio
	BASE_SUPPLY_MULT_FOR_TRUCK_MAX_BUFFER = 100.0,

	TRUCK_ATTRITION = 0.003, -- base truck attrition
	TRUCK_ATTRITION_FACTOR = 0.65, --a scale on total truck attrition

	BASE_TRUCK_HP = 100.0,
	TRUCK_HP_PER_ARMOR = 2,

	BASE_TRAIN_HP = 100.0,
	TRAIN_ARMOR_TARGETING_WEIGHT = 0.01, -- For each health point gained by armor_value, enemy bombers are this much more likely to target

	MIN_TRAIN_SUPPLY_FACTOR = 0.5, -- Having 0 trains in stockpile only applies this penalty factor, scaling up to 1.0 when need is met
	MIN_TRAIN_REQUIREMENT = 2, -- If total train need <= this, then don't apply any supply penalty, even if stockpile is insufficient

	SUPPLY_FLOW_REDUCTION_THRESHOLD = 0.1, -- if supply flow is lower than this, it is not applied

	-- following values are used for calculating potential truck usage
	-- generally potential is ~= current usage but as units moves along the map
	-- they are assigned to different nodes which adds slightly higher usage due to minimum truck needed being 1
	BASE_AIR_SUPPLY_MULT_FOR_TRUCK_BUFFER = 1.0,
	BASE_ARMY_SUPPLY_MULT_FOR_TRUCK_BUFFER = 1.0,
	BASE_NAVY_SUPPLY_MULT_FOR_TRUCK_BUFFER = 1.0,

	CAPITAL_NODE_BASE_SUPPLY_ADD = 0,
	BUILT_NODE_BASE_SUPPLY_ADD = 0.6,
	LOCAL_NODE_BASE_SUPPLY_ADD = 0.5,
	NAVAL_NODE_BASE_SUPPLY_ADD = 0.3,
	-- ~end

	-- armies slowly gains and buffers supply above >100% up to their supply grace if they have efficent supply flow
	-- otherwuse they will lose up to 100% supply every day depending on how bad supply flow is
	ARMY_SUPPLY_RATIO_STARTING_GAIN = 0.0,
	ARMY_SUPPLY_RATIO_SPEED_GAIN_PER_HOUR = 0.01,
	ARMY_MAX_SUPPLY_RATIO_GAIN_PER_HOUR = 0.15,

	MIN_SURRENDER_LIMIT_TO_MOVE_SUPPLY_CAPITAL = 0.15, -- country needs to be above thos surrender ratio to be able to move its capital
	COOLDOWN_DAYS_AFTER_MOVING_SUPPLY_CAPITAL = 30, -- cooldown for moving supply again after last move
	DAYS_TO_START_GIVING_SUPPLY_AFTER_MOVING_SUPPLY_CAPITAL = 7,  -- the country will start gaining supply after this many days moving its capital
	DAYS_TO_START_GIVING_FULL_SUPPLY_AFTER_MOVING_SUPPLY_CAPITAL =  21, -- the country will reach max supply after this many days moving its capital

	MIN_DIFF_FOR_AUTO_UPDATING_EXISTING_RAILWAYS = 5, -- while building railways, the system will prefer updating existing railway if new railway is close enough to existing one

	LOCAL_SUPPLY_PER_AIR_MISSION = 0.2, -- each assigned plane gives this much supply at full efficiency

	-- reinforcements depends on distance to capital and following defines are used for calculating reinforcement time
	SUPPLY_PATH_MAX_DISTANCE = 15,	-- max time it can take
	RAILWAY_DISTANCE_FACTOR_FOR_REINFORCEMENT_SPEED = 0.1, -- time factor for total railway distance
	TRUCK_DISTANCE_FACTOR_FOR_REINFORCEMENT_SPEED = 0.01, -- time factor for total truck distance
	NAVAL_DISTANCE_FACTOR_FOR_REINFORCEMENT_SPEED = 0.08, -- time factor for total naval distance

	ALERT_VERY_LOW_SUPPLY_LEVEL = 0.2,			   -- At which point we show up the low and very low supply level alert. Value is in % of supplies supported vs required.
	ALERT_LOW_SUPPLY_LEVEL = 0.5,

	AI_FRONT_MINIMUM_UNITS_PER_PROVINCE_FOR_SUPPLY_CALCULATIONS = 1,    -- AI will try to keep this amount of divisions per province as a minimum when evaluating supply limitations for war fronts
	AI_FRONT_DIVISIONS_PER_SUPPLY_POINT = 1.0, -- How many divisions should the AI consider it can supply per available supply point
	AI_FRONT_MAX_UNITS_ENEMY_COUNT_FACTOR = 1.2, -- Make sure AI front MaxNrUnits is at least EnemyCount multiplied by this factor
	SUPPLY_THRESHOLD_FOR_ARMY_ATTRITION = 0.35, -- armies will only get attrition below this supply
	NUMBER_OF_SHOWN_SUPPLY_SOURCES_IN_SUPPLY_MAPMODE = 3, -- number of supply flow sources shown in breakdown tooltip
	ESTIMATED_DIVISION_WEIGHT_FOR_SUPPLY_ESTIMATIONS_GUI = 1.0,	--Division supply consumption used for estimating frontline weight for order tooltips
	AVAILABLE_MANPOWER_STATE_SUPPLY = 0.18,						--Factor for state supply from max manpower (population)
	STORED_SUPPLY_CONSUMPTION_RATE_FACTOR = 0.75,				--Multiplies consumption rate of stored supply (more/less easement)
}