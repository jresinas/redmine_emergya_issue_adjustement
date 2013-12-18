require_dependency 'timelog_helper'
require 'dispatcher' unless Rails::VERSION::MAJOR >= 3

# Patches Redmine's ApplicationController dinamically. Redefines methods wich
# send error responses to clients
module TimelogHelperPatch
  def self.included(base) # :nodoc:
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)

    base.class_eval do
      #unloadable  # Send unloadable so it will be reloaded in development
    end
  end

  module ClassMethods
  end 

  module InstanceMethods
    def ignore_accents(str)
      str.gsub('Á','A').gsub('á','a').gsub('É','E').gsub('é','e').gsub('Í','I').gsub('í','i').gsub('Ó','O').gsub('ó','o').gsub('Ú','U').gsub('ú','u')
    end
  end
end


if Rails::VERSION::MAJOR >= 3
  ActionDispatch::Callbacks.to_prepare do
    TimelogHelper.send(:include, TimelogHelperPatch)
  end
else
  Dispatcher.to_prepare do
    TimelogHelper.send(:include, TimelogHelperPatch)
  end
end