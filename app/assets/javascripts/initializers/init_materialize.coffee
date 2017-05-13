$(document).on 'turbolinks:load', ->
  init_materialize()
  return

$(document).on 'page:load', ->
  init_materialize()
  return

init_materialize =->
  $('.toc-wrapper').pushpin
    top: 240
    offset: 150
  Materialize.updateTextFields()
  Waves.displayEffect()
  $('.materialboxed').materialbox()
  $('input, textarea').characterCounter()
  $('textarea').trigger('autoresize')
  $('select').material_select()
  $('ul.tabs').tabs()
  $('.button-collapse').sideNav
    menuWidth: 240,
    draggable: true
  $('.collapsible').collapsible()
  $('#about').modal()
  $('#alert-modal').modal()
  $('.slider').slider({
    height: '600'
    })
  $('.datepicker').pickadate
    selectMonths: true
    selectYears: 15
  $('span.help-text').each ->
    $value = $(this)[0].innerHTML
    $(this).addClass 'hide'
    $(this).parents('div.input-field').children('label').attr(
      'data-hint', $value
    )
    return
  $('.scrollspy').scrollSpy scrollOffset: 175
