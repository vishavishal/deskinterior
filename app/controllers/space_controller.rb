class SpaceController < ApplicationController
  protect_from_forgery except: :index
  def index
    @spaces = []
    puts "+++++Index Params : #{params} : #{params[:count]}"
    @count = params[:count]
  end

  def create_space
  end

  def update_spaces
  end
end
