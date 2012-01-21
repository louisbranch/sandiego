if $('div#network').length
  $('div#network').remove()
$("<div id=network></div>").dialog
  title: ("<%= @network.location.name %>"),
  closeText: 'fechar',
  width: 600,
  position: ['center']
  open: ->
    $("div#network").html("<%= escape_javascript(render('network', :network => @network)) %>")
$('div.mission_time').html('<%= "Faltam #{@progress.remaining_hours} horas" %>')
