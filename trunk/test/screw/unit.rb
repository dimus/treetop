dir = File.dirname(__FILE__)
require 'rubygems'
require 'spec/expectations'
require 'spec/matchers'

require File.join(dir, 'unit', 'util')
require File.join(dir, 'unit', 'assertion_failed_error')
require File.join(dir, 'unit', 'assertions')
require File.join(dir, 'unit', 'collector')
require File.join(dir, 'unit', 'error')
require File.join(dir, 'unit', 'failure')
require File.join(dir, 'unit', 'test_case')
require File.join(dir, 'unit', 'test_result')
require File.join(dir, 'unit', 'test_suite')
require File.join(dir, 'unit', 'ui')
require File.join(dir, 'unit', 'auto_runner')
require File.join(dir, 'unit', 'sugar')

module Screw
  module Unit
    # If set to false Screw::Unit will not automatically run at exit.
    def self.run=(flag)
      @run = flag
    end

    # Automatically run tests at exit?
    def self.run?
      @run ||= false
    end
  end
end

at_exit do
  unless $! || Screw::Unit.run?
    exit Screw::Unit::AutoRunner.run
  end
end
