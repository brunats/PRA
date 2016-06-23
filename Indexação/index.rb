#!/usr/lib/ruby/1.9.1
require "open-uri"
require 'ferret'
require 'uri'

url1 = gets
parsed = URI.parse(URI.encode(url1.strip))
site1 = url1.sub("http://www.","")
site1 = site1.sub("https://www.","")
site1 = site1.sub("/",'_')
site1.chomp!
time1 = Time.now

puts url1
puts site1
puts parsed

remote_data = open(parsed, &:read)
my_local_file = open("pagBaixadas/page#{site1}#{time1.day}-#{time1.month}-#{time1.year}.txt", "w") 

my_local_file.write(remote_data)
my_local_file.close