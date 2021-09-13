require 'json'
class SettingsController < ApplicationController
  def display
  end

  def read_settings
    settings_file = File.read('../../assets/custom/custom_settings.json') 
    $DeskINT_SETTINGS = JSON.parse(settings_file)
    
  end

  def update_json
    puts "Params : #{params}"
  end
end
