# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'
require 'nokogiri'

# a bunch of fun words for seeding the DB
WORDS = %w(avocado pantaloons postmodernism ruby python california ramen Philadelphia evolution beef windows)

puts "#{Nut.count} nuts in the bucket as we begin our adventure."

WORDS.each do |word|
	puts ""
	puts "** We begin to process the word #{word.upcase}..."
	# Wikipedia scrape time!
	wikipedia = Nokogiri::HTML(open(url = "http://en.wikipedia.org/wiki/#{word}"))
	puts "=> Exploring #{url}..."
	node = wikipedia.css('#mw-content-text > p')[0]
	/^(?<body>.+?\.)/ =~ node.text
	puts "  => #{body}"
	Nut.create({
		title: word,
		body: body,
		source: 'Wikipedia',
		source_url: url
	})

	# Wiktionary scrape time!
	wiktionary = Nokogiri::HTML(open(url = "http://en.wiktionary.org/wiki/#{word}"))
	puts "=> Now turning to #{url}..."
	# find all list items that contain a whitespace character and do not begin with parentheses
	wiktionary.css('#mw-content-text ol li').select { |n| n.text =~ /^(?!\().+?\s/ }.each do |node|
		/^(?<body>.+?\.)/ =~ node.text
		puts "  => #{body}"
		Nut.create({
			title: word,
			body: body,
			source: 'Wiktionary',
			source_url: url
		})
		puts "  => #{body}"
	end
end

puts ""
puts "#{Nut.count} nuts in the bucket as we conclude our travels."
