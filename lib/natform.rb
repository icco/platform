# Base file. Require this and it brings everything else together.
# @author Nat Welch (nat@natwelch.com)

# Base requires
require "rubygems"
require "bundler"
require 'logger'
Bundler.require

include Gosu
include Chingu

# CONSTANTS
CONFIG = {
  :window => {
    :height => 600,
    :width =>  1000,
  },
  :db => "sqlite3://./data.db"
}

class NatForm
  @@logger = Logger.new(STDOUT)
  def self.log msg
    @@logger.level = Logger::WARN
    @@logger.info msg
  end

  def self.logger
    return @@logger
  end
end

ActiveRecord::Base.logger = NatForm.logger
ActiveRecord::Base.include_root_in_json = true
ActiveRecord::Base.store_full_sti_class = true
ActiveSupport.use_standard_json_time_format = true
ActiveSupport.escape_html_entities_in_json = false
Time.zone = "UTC"
ActiveRecord::Base.default_timezone = :utc
ActiveRecord::Base.establish_connection(CONFIG[:db])

# This resets the DB every time the app runs.
ActiveRecord::Migration.class_eval do
  create_table :ticks do |t|
    t.integer :player
    t.float :x
    t.float :y
   end
end

module ZOrder
  Background, Map, Player, UI = *0..3
end

# Application requires. If you create a new class, put it here brosef!
require "natform/game_window"
require "natform/player"
require "natform/block"
require "natform/grass_block"
require "natform/level"
require "natform/level_one"
