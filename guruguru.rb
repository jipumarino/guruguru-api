require 'rubygems'
require 'nokogiri'
require 'net/http'

exit if ARGV.empty?
res = Net::HTTP.post_form URI.parse('http://pangui.heroku.com/'), :msg => ARGV.join(" ")
puts Nokogiri::HTML(res.body).css('h1')[1].inner_text.gsub(/^\s+/,'').gsub(/\s+$/,'')
