# encoding: utf-8

require 'rubygems'
require 'bundler'
require 'rake'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "sad_nat_game"
  gem.homepage = "http://github.com/icco/sad_nat_game"
  gem.license = "MIT"
  gem.summary = %Q{TODO: one-line summary of your gem}
  gem.description = %Q{TODO: longer description of your gem}
  gem.email = "nat@natwelch.com"
  gem.authors = ["Nat Welch"]
  # dependencies defined in Gemfile
end

Jeweler::RubygemsDotOrgTasks.new
