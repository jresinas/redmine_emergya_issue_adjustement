# Run initializers
# Needs to be atop requires because some of them need to be run after initialization
#Dir["#{File.dirname(__FILE__)}/config/initializers/**/*.rb"].sort.each do |initializer|
#  require initializer
#end

# Get messages from locales
#Dir[File.join("#{File.dirname(__FILE__)}/config/locales/*.yml")].each do |locale|
#  I18n.load_path.unshift(locale)
#end

#require 'redmine'
require 'issues_dates_required_patch'
#require 'issues_controller_tracker_patch'
require 'issues_controller_patch'
#require 'timelog_helper_patch'
require 'hooks'


Rails.configuration.to_prepare do
  TimelogController.send(:helper, :eia)
end

Redmine::Plugin.register :redmine_emergya_issue_adjustement do
  name 'Emergya Issue Adjustement Plugin'
  author 'ogonzalez, jresinas'
  description 'Issue/Tracker behaviour changes adjusting to Emergya workflows'
  version '0.0.2'
  author_url 'http://www.emergya.es'

  settings :default => { :trackers => []}, :partial => 'settings/settings'
end