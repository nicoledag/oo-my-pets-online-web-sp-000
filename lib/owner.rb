require 'pry'

class Owner

  attr_accessor :dog, :fish, :cat, :name, :pets
  attr_reader :species

  @@all = []
  @@count = 0

  def initialize(species)
    @species = species
    @pets = {:cats=>[], :dogs=>[], :fishes=>[]}
    @@all << self
    @@count += 1
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@count = 0
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
   @pets[:dogs].each do|dog| dog.mood = "happy"
   end
  end

  def play_with_cats
   @pets[:cats].each do|cat| cat.mood = "happy"
   end
  end

  def feed_fish
   @pets[:fishes].each do|fish| fish.mood = "happy"
   end
  end

  def sell_pets
    pets.each do |type, pet|
      pet.each do |m| m.mood = "nervous"
      end
        pet.delete_if {|n| n = n.name}
    end
  end

  def list_pets
    binding.pry
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end

end
