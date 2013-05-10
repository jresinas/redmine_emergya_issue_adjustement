class ExpositionLevel
  DEFAULT_VALUES = {
    'Leve' => {'Baja' =>'Bajo', 'Media' => 'Bajo', 'Elevada' => 'Bajo'},
    'Moderado' => {'Baja' =>'Bajo', 'Media' =>'Medio', 'Elevada' =>'Medio'},
    'Importante' => {'Baja' =>'Medio', 'Media' =>'Alto', 'Elevada' =>'Alto'}
  }

  def self.getExpositionLevelsArray
    return (Setting.plugin_redmine_emergya_issue_adjustement['expositionLevels'] || DEFAULT_VALUES)
  end

  def self.getExpositionLevelValue(impact, probability)
    return (Setting.plugin_redmine_emergya_issue_adjustement['expositionLevels'][impact][probability] || DEFAULT_VALUES[impact][probability])
  end

  def self.getCustomFieldId(name)
    return "issue_custom_field_values_"+(CustomField.find(:first, :conditions => ["name = '"+name+"'"]).id).to_s
  end

  def self.getTrackerId(name)
    return Tracker.find(:first, :conditions => ["name = '"+name+"'"]).id
  end
end
