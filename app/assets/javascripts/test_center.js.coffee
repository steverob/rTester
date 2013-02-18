jQuery ->

  $(".radio").live 'change',->
    q_no=$(@).attr("class").split(" ")[0]
    if parseInt($('#timeup').html())==1
      $('#'+q_no).attr("class","btn btn-success qn-nav ans")
      $('#q_'+q_no+' span').attr("class","badge badge-success")
      $(@).parent().parent().parent().children().attr("class","")
      $(@).parent().parent().attr("class","s")

    if parseInt($('#timeup').html())==0
      alert "Time up! Please submit the test."


  $(window)._scrollable()

  $("div[id^='q_'] span.badge").live 'click',->
    $(@).attr("class","badge badge-warning")
    qn=$(@).parent().parent().parent().attr("id").split("_")[1]
    $('#'+qn).attr("class","btn btn-warning qn-nav")

  $("button.qn-nav").live "click",->
    $.scrollTo('#q_'+$(@).html(),500, {offset:-50} )


  $(".confirmButton").click ->
    $("#confirmDiv").confirmModal ({
      heading:  'Are you sure?<hr>'
      body: ->
        unanswered=$('input.hidden-radio:checked').length
        if unanswered!=0
          '<h5>You have <span class="badge badge-important">unanswered</span> questions!</h5>'
        else
          'You have answered all the questions!'

      callback:-> $('#answers-form').submit()
    })

  $("input.hidden-radio").trigger('click')
