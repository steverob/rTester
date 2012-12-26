$(document).ready(function(){
  $('#negative-marking').live('change',function(){
    if($(this).is(':checked'))
    {
      $('#neg-marks').removeAttr('readonly');
      $('#neg-marks').val('');
    }
    else
    {
      $('#neg-marks').attr('readonly','readonly');
      $('#neg-marks').val(0.0);
    }
  });


});
