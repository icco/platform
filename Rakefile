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

desc "Run the DupeRun game."
task :run do
  sh "ruby -Ilib ./bin/duperun"
end

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "duperun"
  gem.homepage = "http://github.com/icco/duperun"
  gem.license = "MIT"
  gem.summary = %Q{A platform game involving penguins}
  gem.description = %Q{A platform game where penguins jump around.}
  gem.email = "nat@natwelch.com"
  gem.authors = ["Nat Welch"]
  # dependencies defined in Gemfile
end

Jeweler::RubygemsDotOrgTasks.new
