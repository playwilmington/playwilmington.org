$(document).on 'turbolinks:load', ->
  cocoon_initializer()
  return

cocoon_initializer = ->
  $(document).on('cocoon:after-insert', ->
    $('select').material_select()
    Materialize.updateTextFields()
    $('.ckeditor').each ->
      CKEDITOR.replace $(this).attr('id')
    $('.datepicker').pickadate
      selectMonths: true
      selectYears: 15
    return
  ).on 'cocoon:after-remove', ->
    return
