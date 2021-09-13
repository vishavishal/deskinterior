require 'sketchup.rb'
require 'extensions.rb'

module DeskINT_V1
  unless file_loaded?(__FILE__)
    folder_path                   = 'C:/DeskInterior' #Enter the folder of the ruby plugin code in format E:/folder_path_folder_name
    loader_path                   = File.join(folder_path, "deskinterior_loader.rb")
    extension_title            = "Desk - Interior"

    my_plugin_loader              = SketchupExtension.new(extension_title, loader_path)
    my_plugin_loader.copyright    = "Copyright 2021 VG"
    my_plugin_loader.creator      = "Vivek Gnanasekaran"
    my_plugin_loader.version      = "1.0.0"
    my_plugin_loader.description  = "Info of the Selected entity."

    Sketchup.register_extension my_plugin_loader, true
    file_loaded(__FILE__)
  end
end