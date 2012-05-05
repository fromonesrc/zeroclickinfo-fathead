#!/usr/bin/ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'

DOWNLOAD_DIR  = "download"
PATH_BASE     = "#{DOWNLOAD_DIR}/www.ruby-doc.org/core-1.9.3"

def parse_file(file)
  doc = Nokogiri::HTML(open(file))

  if doc.at_css("#documentation")
    title       = doc.at_css("#documentation h1").text
    description = doc.at_css("#documentation #description")
  end
  puts "#{title}\n#{description}"

end

Dir.new(PATH_BASE).entries.each do |file|
  parse_file(PATH_BASE+'/'+file) if file=~/\.html$/
end
