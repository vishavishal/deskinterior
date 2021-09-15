function createSpace() {
  window.location.href = 'skp:cb1@1';
}
function alertMe() {
  alert("Small");
  post_to_url('', {'q':'a'});
}
function getAllSpaces() {
  window.location.href = 'skp:getSpaces@1';
}
function sendCount(input) {
  alert("INput : "+input);
  $.post('space/index/', {'count': '1249765'}, function(data){});
  // post_to_url('space/index', {'count': '1249765'})
  // $.ajax({
  //   type: "POST",
  //   url: 'space/index',
  //   data: {'count': '249765'},
  //   success: function() {},
  //   datatype : "application/json"
  // });
}
function receiveData(type, data) {

}

function getSettings() {
  alert("FUn : getSettings");
  window.location.href = 'skp:get_settings@1'
}
function rcvSettings(input) {
  input_data = {'data_h': 'sample'}
  alert("rcvSettings : "+input_data)
  //$.post('settings/display/', input_data, function(data){});
  $.ajax({
    url: '/settings/display',
    data: input_data,
    method: 'POST',
    success: function (res) {}
 }); 
}