require 'rubygems'
require 'nokogiri'
require 'net/http'

exit if ARGV.empty?
frase = ARGV.join(" ")
res = Net::HTTP.post_form(URI.parse('http://pangui.heroku.com/'),{'msg' => frase})
puts Nokogiri::HTML(res.body).css('h1')[1].inner_text.gsub(/^\s+/,'').gsub(/\s+$/,'')
