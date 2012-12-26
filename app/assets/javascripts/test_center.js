$(document).ready(function(){

  $(".radio").live('change',function(){
    var q_no=$(this).attr("class").split(" ")[0];
    if ($('#timeup').html()==1) {
      $('#'+q_no).attr("class","btn btn-success qn-nav ans");
      $('#q_'+q_no+' span').attr("class","badge badge-success");
      $(this).parent().parent().parent().children().attr("class","");
      $(this).parent().parent().attr("class","s");
    }
    if($('#timeup').html()==0){
      alert("Time up! Please submit the test.");
    }

  });



  $(window)._scrollable();
  $("div[id^='q_'] span.badge").live('click',function(){
    $(this).attr("class","badge badge-warning");
    var qn=$(this).parent().attr("id").split("_")[1];
      $('#'+qn).attr("class","btn btn-warning qn-nav");

  });

  $("button.qn-nav").live("click",function(){
    $.scrollTo('#q_'+$(this).html(),500, {offset:-50} );
  });

        $(".confirmButton").click(function () {
            openConfirmModal();
        });
        function openConfirmModal() {
            $("#confirmDiv").confirmModal({
                heading: 'Are you sure?<hr>',
                body: function () {
                  var unanswered=$('input.hidden-radio:checked').length
                  if(unanswered!=0)
                    return '<h5>You have <span class="badge badge-important">unanswered</span> questions!</h5>';
                  else
                    return 'You have answered all the questions!';
                  },
                callback: function () {
                    $('#answers-form').submit();
                }
            });
        }

        $("input.hidden-radio").trigger('click');



});
