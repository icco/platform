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
  gem.name = "natform"
  gem.homepage = "http://github.com/icco/platform"
  gem.license = "MIT"
  gem.summary = %Q{A platform game about Nat.}
  gem.description = %Q{A platform game where Nat tries to escape depression.}
  gem.email = "nat@natwelch.com"
  gem.authors = ["Nat Welch"]
  # dependencies defined in Gemfile
end

Jeweler::RubygemsDotOrgTasks.new
