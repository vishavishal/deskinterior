#----------------------------------------------------------------------------------
#  CopyRight : Vivek Gnanasekaran
#----------------------------------------------------------------------------------
require_relative 'core/observers.rb' #For loading observer 

module DeskINT_V1

  #--------------- Constants       ----------------------------------------------
  
  # To avoid direct __FILE__ usage bug
  file = __FILE__.dup
  file.force_encoding('UTF-8') if file.respond_to?(:force_encoding)
  ROOT_PATH       = File.dirname(file) unless defined?(ROOT_PATH)
  SERVER_IP       = "http://localhost:3000"

  FILE_TYPE_STR   = "/*.rb"
  TEST_MODE       = false
  #------------------------------------------------------------------------------

  module Starters
    extend self

    #Function to load all the ruby files in specified directories
    def load_ruby_files
      ruby_directories = ['core']
      ruby_directories.each do |dir_name|
        dir_path = File.join(ROOT_PATH, dir_name)
        files_to_be_loaded = Dir[dir_path+FILE_TYPE_STR]
        files_to_be_loaded.each { |file_name| 
          Sketchup.load File.join(file_name) 
        }
      end
    end

    def start_extension 
      options = {
        :dialog_title => "Dialog Example",
        :preferences_key => "com.sample.plugin",
        :scrollable => true,
        :resizable => true,
        :width => 600,
        :height => 400,
        :left => 100,
        :top => 100,
        :min_width => 50,
        :min_height => 50,
        :max_width =>1000,
        :max_height => 1000,
        :style => UI::HtmlDialog::STYLE_DIALOG
      }
      $vg_dialog = UI::HtmlDialog.new(options)
      $vg_dialog.add_action_callback('cb1') { |*args|
        puts "Inside Cb1"
        puts Sketchup.class
        resp        = CivilHelper::create_outer_closures 
        puts "Resp : #{resp}"
        $vg_dialog.execute_script("alertMe()");
      }
      
      $vg_dialog.add_action_callback('getSpaces') {|*args|
        count = Sketchup.active_model.entities.to_a.length
        puts "Total count: #{count}"
        $vg_dialog.execute_script("sendCount("+count.to_s+")"); 
      }
      $vg_dialog.set_url(SERVER_IP)
      $vg_dialog.show
    end
  end
end

#Load all ruby files
DeskINT_V1::Starters::start_extension