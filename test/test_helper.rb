#let ruby know what environment we're in
ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'minitest/autorun'
require 'minitest/pride'

module TestHelpers

  def teardown
    task_manager.delete_all
    #will allow us to run the teardown method from the class we're inheri Minitest. So Minitest has a teardown method
    super
  end

  def task_manager
    database = YAML::Store.new('db/task_manager_test.rb')
    @database ||= TaskManager.new(database)
  end


end