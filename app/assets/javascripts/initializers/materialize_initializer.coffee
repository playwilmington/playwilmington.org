$(document).on 'turbolinks:load', ->
  material_initializer()
  return

material_initializer =->
  $('.button-collapse').sideNav
    menuWidth: 240,
    draggable: true
  $('select').material_select()
  Materialize.updateTextFields()
  $('#about').modal()
  $('.datepicker').pickadate
    selectMonths: true
    selectYears: 15
