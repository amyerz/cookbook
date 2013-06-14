# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'

simplyrecipes=[
	"http://www.simplyrecipes.com/recipes/venison_sauerbraten/",
	"http://www.simplyrecipes.com/recipes/sauerkraut_with_bacon_and_apples/",
	"http://www.simplyrecipes.com/recipes/veal_goulash_with_sauerkraut/",
	"http://www.simplyrecipes.com/recipes/braised_red_cabbage_with_chestnuts/",
	"http://www.simplyrecipes.com/recipes/spareribs_and_sauerkraut//",
	"http://www.simplyrecipes.com/recipes/bavarian_sauerkraut/"
]

simplyrecipes.each do|url|

	# Open document
  doc = Nokogiri::HTML(open(url))

  # Scrape title
  title = doc.css('h1.entry-title')[0].content

  # Create receipe record in db
  Recipe.create(:title => title)

end

