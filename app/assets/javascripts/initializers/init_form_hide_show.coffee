$(document).on 'turbolinks:load', ->
  page_form_init()
  collapsible_form_init()
  return

$(document).on 'page:load', ->
  page_form_init()
  collapsible_form_init()
  return

page_form_init =->
  load_data = $('#page_page_type').val()
  page_reload_fields(load_data)
  $('#page_page_type').on 'change', ->
    data = $(this).val()
    page_reload_fields(data)

collapsible_form_init =->
  load_data = $('#collapsible_usage_type').val()
  collapsible_reload_fields(load_data)
  $('#collapsible_usage_type').on 'change', ->
    data = $(this).val()
    collapsible_reload_fields(data)

page_reload_fields = (data) ->
  if data == 'Page'
    $('#page_page_id').parents('div.page_hiding').addClass('hide')
    $('#page_icon').parents('div.page_hiding').removeClass('hide')
  else if data == 'Tab'
    $('#page_page_id').parents('div.page_hiding').removeClass('hide')
    $('#page_icon').parents('div.page_hiding').addClass('hide')

collapsible_reload_fields = (data) ->
  if data == 'Home-Page'
    $('#collapsible_page_id').parents('div.coll_hiding').addClass('hide')
  else if data == 'Page/Tab'
    $('#collapsible_page_id').parents('div.coll_hiding').removeClass('hide')
