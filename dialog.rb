# Load the normal support files.
require 'sketchup.rb'
require 'extensions.rb'

require_relative 'skplib/helpers/poly.rb'

$vg_dialog = UI::HtmlDialog.new(
{
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
})
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
$vg_dialog.set_url("http://localhost:3000")
$vg_dialog.show
puts "Check ---- -#{CivilHelper.class}"