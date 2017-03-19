$(document).on 'turbolinks:load', ->
  init_materialize()
  return

$(document).on 'page:load', ->
  init_materialize()
  return

init_materialize =->
  Materialize.updateTextFields()
  Waves.displayEffect()
  $('ul.tabs').tabs()
  $('.button-collapse').sideNav
    menuWidth: 240,
    draggable: true
  $('.collapsible').collapsible()
  $('#about').modal()
  $('#alert-modal').modal()
  $('.slider').slider()
