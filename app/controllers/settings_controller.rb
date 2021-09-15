require 'json'
class SettingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def display
    ActionController::Parameters.permit_all_parameters = true
    # setting_obj = Setting.new(get_params)
    # puts "++++++ Params : #{params}"
    # #params = params.to_unsafe_h
    # @sample = params.permit(:data_h)
    # new_h = {}
    # params.each_pair {|k, v|
    #   new_h[k]=v
    # }
    puts "++++++ Params : #{params[:data_h]}"
    inner = params["dialog"].to_h
    #params = params.to_unsafe_h
    puts "&&&&&&& #{inner} :#{inner.class} #{inner.inspect}"
    #permitted = params.require(:dialog)
    #puts "Permitted : #{permitted} : #{permitted.class}"
    #parameters = params.permit(params.keys).to_h
    #puts "Params... : #{parameters}"

    data = File.read(File.join(Rails.root, 'settings.json'))
    json_data = JSON.parse(data)
    @sample = {'data_h': json_data}
    params.each_pair{|k, v|
      puts k, v
    }
    puts "SP.. : #{@sample}"
  end

  def update_json
    puts "Params : #{params}"
  end

  private

  def get_params
    puts "Params Inside : #{params}"
    #params.require(:setting).require(:dialog)
  end
end
