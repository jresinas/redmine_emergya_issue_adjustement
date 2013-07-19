require 'dispatcher'
require_dependency 'issues_controller'


module IssuesControllerPatch
  def self.included(base) # :nodoc:
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
    base.class_eval do
      unloadable  # Send unloadable so it will be reloaded in development
      skip_before_filter :authorize, :only => [:get_exposition_level]
    end
  end

  module InstanceMethods
    # Wraps the association to get the Deliverable subject.  Needed for the 
    # Query and filtering
    def get_exposition_level
      impacto = params[:impacto]
      probabilidad = params[:probabilidad]
      @exposicion = ""

      if (impacto.present? && probabilidad.present?)
        @exposicion = ExpositionLevel.getExpositionLevelValue(impacto,probabilidad)
      else 
        render :nothing => true
      end
    end

  end
  module ClassMethods
  end
end

Dispatcher.to_prepare do
  IssuesController.send(:include, IssuesControllerPatch)
end
