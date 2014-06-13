class Person
	attr_reader :name
	attr_accessor :objects, :weapons

	def initialize(name)
		@name = name
		@objects ||= []
		@weapons ||= []
		@total_power = 0
	end

	def pick_up object, weapon
		objects << object
		weapons << weapon
	end

	def has_objects
		objects.count >= 2
	end

	def total_power
		weapons.inject(:+)
	end

end