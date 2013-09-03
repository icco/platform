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

require 'rake/clean'
CLEAN.include("data.db")
CLEAN.include(".DS_Store")
CLEAN.include(".rake_t_cache")

desc "Run the game."
task :run do
  sh "ruby -Ilib ./bin/natform"
end

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "natform"
  gem.homepage = "http://github.com/icco/natform"
  gem.license = "MIT"
  gem.summary = %Q{A platform game involving Nat}
  gem.description = %Q{A platform game.}
  gem.email = "nat@natwelch.com"
  gem.authors = ["Nat Welch"]
  # dependencies defined in Gemfile
end

Jeweler::RubygemsDotOrgTasks.new
