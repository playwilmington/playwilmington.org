$(document).on 'turbolinks:load', ->
  form_init()
  return

$(document).on 'page:load', ->
  form_init()
  return

form_init =->
  load_data = $('#page_page_type').val()
  reload_fields(load_data)
  $('#page_page_type').on 'change', ->
    data = $(this).val()
    reload_fields(data)

reload_fields = (data) ->
  if data == 'Page'
    $('#page_page_id').parents('div.page_hiding').addClass('hide')
    $('#page_icon').parents('div.page_hiding').removeClass('hide')
  else if data == 'Tab'
    $('#page_page_id').parents('div.page_hiding').removeClass('hide')
    $('#page_icon').parents('div.page_hiding').addClass('hide')
