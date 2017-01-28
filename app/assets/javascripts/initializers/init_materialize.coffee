$(document).on 'turbolinks:load', ->
  init_materialize()
  return

$(document).on 'page:load', ->
  init_materialize()
  return

init_materialize =->
  Waves.displayEffect()
  $('ul.tabs').tabs()
  $('.button-collapse').sideNav
    menuWidth: 240,
    draggable: true
  $('select').material_select()
  $('.collapsible').collapsible()
  Materialize.updateTextFields()
  $('#about').modal()
  $('#alert-modal').modal()
  $('.slider').slider()
  $('.datepicker').pickadate
    selectMonths: true
    selectYears: 15
