if $('div#dialog').length
  $('div#dialog').remove()
$("<div id=dialog></div>").dialog
  title: ("<%= @network.location.name %>"),
  closeText: 'fechar',
  width: 600,
  position: ['center', 200]
  open: ->
    $("div#dialog").html("<%= escape_javascript(render('network', :network => @network, :traits_found => @traits_found, :time_traveled => @time_traveled)) %>")
$('div.mission_time').html('<%= "Faltam #{@progress.remaining_hours} horas" %>')
window.locationTimeTravel()
