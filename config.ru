#!/usr/bin/env ruby
require 'rubygems'
require 'gollum/app'
require 'rack/ssl'

#use Rack::SSL #uncomment this to force ssl

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == ENV['WIKI_USER'] and password == ENV['WIKI_PASS']
end

gollum_path = File.expand_path(ENV['WIKI_REPO'])
Precious::App.set(:gollum_path, gollum_path)
Precious::App.set(:default_markup, :markdown) # set your favorite markup language
Precious::App.set(:wiki_options, {:universal_toc => false})
Precious::App.set(:wiki_options, {:allow_uploads => true})
Precious::App.set(:wiki_options, {:live_preview => true})
Precious::App.set(:wiki_options, {:mathjax => true})
run Precious::App
