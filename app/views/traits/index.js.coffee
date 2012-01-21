if $('div#dialog').length
  $('div#dialog').remove()
$("<div id=dialog></div>").dialog
  title: ("Pistas Coletadas"),
  closeText: 'fechar',
  width: 600,
  position: ['center', 200]
  open: ->
    $("div#dialog").html("<%= escape_javascript(render('traits', :traits => @traits)) %>")
