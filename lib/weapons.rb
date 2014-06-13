class Weapons
	attr_reader :objects_list
	def initialize
		@objects_list = [{name: "rope", power: 50},
					{name: "sword", power: 75},
					{name: "shield", power: 25},
					{name: "dagger", power: 25},
					{name: "flower", power: 0},
					{name: "potion", power: 100}]
	end
end