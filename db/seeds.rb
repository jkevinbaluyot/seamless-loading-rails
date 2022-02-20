# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "net/http"

url = "https://picsum.photos/v2/list?page=2&limit=100"
resp = Net::HTTP.get_response(URI.parse(url))
data = JSON.parse(resp.body)

data.each do |d|
  url = "https://picsum.photos/200/#{300+(rand(1..5)*20)}"
  p Image.where(author: d['author'], url: url).first_or_create
end
