# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Unit.create [
  {:title => "gallon", :abbreviation => "gal"},
  {:title => "quart", :abbreviation => "qt"},
  {:title => "pint", :abbreviation => "pt"},
  {:title => "liter", :abbreviation => "l"},
  {:title => "pound", :abbreviation => "lb"},
  {:title => "ounce", :abbreviation => "oz"},
  {:title => "gram", :abbreviation => "g"},
  {:title => "cup", :abbreviation => "C"},
  {:title => "teaspoon", :abbreviation => "tsp"},
  {:title => "tablespoon", :abbreviation => "tbsp"}
]

Style.create [
  {:title => "Amber"},
  {:title => "Barleywine"},
  {:title => "Brown Ale"},
  {:title => "India Pale Ale"},
  {:title => "Lambic"},
  {:title => "Pale Ale"},
  {:title => "Porter"},
  {:title => "Stout"}
]

Category.create [
  {:title => "Grains"},
  {:title => "Extracts"},
  {:title => "Hops"},
  {:title => "Yeasts"},
  {:title => "Spices"},
  {:title => "Additives"},
  {:title => "Sugars"}
]

BrewType.create [
  {:title => "All grain"},
  {:title => "Extract"},
  {:title => "Mini mash"}
]