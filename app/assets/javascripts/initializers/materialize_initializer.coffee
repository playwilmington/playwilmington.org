$(document).on 'turbolinks:load', ->
  material_initializer()
  return

$(document).on 'page:load', ->
  material_initializer()
  return

material_initializer =->
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
