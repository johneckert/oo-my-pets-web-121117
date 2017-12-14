require 'pry'

class Owner
  @@all = []

  attr_accessor :pets, :name
  attr_reader :species

  def initialize(species)
    @species = species
    @pets = {:cats => [], :dogs => [], :fishes => []}
    @@all << self
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def self.all
    @@all
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.values.each do |pet_array|
      pet_array.each {|pet| pet.mood = "nervous"}
    end
    clear_pets
  end

  def list_pets
    total_fishes = @pets[:fishes].length
    total_dogs = @pets[:dogs].length
    total_cats = @pets[:cats].length
    "I have #{total_fishes} fish, #{total_dogs} dog(s), and #{total_cats} cat(s)."
  end

  private

  def clear_pets
    @pets = {:cats => [], :dogs => [], :fishes => []}
  end

end
