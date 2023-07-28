#!/usr/bin/env ruby
require 'httparty'

def get_country(country)
    url = 'https://disease.sh/v3/covid-19/countries/' + country
    resp = HTTParty.get(url)
    JSON.parse(resp.body)
end

def get_country_cases(country1, country2)
    country1_data = get_country(country1)
    country2_data = get_country(country2)

    if country1_data['cases'] > country2_data['cases']
        puts "#{country1_data['country']} had #{country1_data['cases']} cases, #{country1_data['cases'] - country2_data['cases']} more than #{country2_data['country']}."
    elsif country2_data['cases'] > country1_data['cases']
        puts "#{country2_data['country']} had #{country2_data['cases']} cases, #{country2_data['cases'] - country1_data['cases']} more than #{country1_data['country']}."
    end 
end

puts "Provide a country: "
country1 = STDIN.gets.chomp
puts "Provide another country: "
country2 = STDIN.gets.chomp

get_country_cases(country1, country2)
