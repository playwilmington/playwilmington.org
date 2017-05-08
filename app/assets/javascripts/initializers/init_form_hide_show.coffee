$(document).on 'turbolinks:load', ->
  init_page_form()
  init_collapsible_form()
  init_card_group_form()
  return

$(document).on 'page:load', ->
  init_page_form()
  init_collapsible_form()
  init_card_group_form()
  return

init_page_form =->
  load_data = $('#page_page_type').val()
  page_reload_fields(load_data)
  $('#page_page_type').on 'change', ->
    data = $(this).val()
    page_reload_fields(data)

init_collapsible_form =->
  load_data = $('#collapsible_usage_type').val()
  collapsible_reload_fields(load_data)
  $('#collapsible_usage_type').on 'change', ->
    data = $(this).val()
    collapsible_reload_fields(data)

init_card_group_form =->
  load_data = $('#card_group_usage_type').val()
  card_group_reload_fields(load_data)
  $('#card_group_usage_type').on 'change', ->
    data = $(this).val()
    card_group_reload_fields(data)

page_reload_fields = (data = '') ->
  if data == 'Page'
    $('#page_page_id').parents('div.page_hiding').addClass('hide')
    $('#page_icon').parents('div.page_hiding').removeClass('hide')
  else if data == 'Tab'
    $('#page_page_id').parents('div.page_hiding').removeClass('hide')
    $('#page_icon').parents('div.page_hiding').addClass('hide')
  else if data.length == 0
    $('#page_page_id').parents('div.page_hiding').addClass('hide')
    $('#page_icon').parents('div.page_hiding').addClass('hide')

collapsible_reload_fields = (data = '') ->
  if data == 'Home-Page' || data.length == 0
    $('#collapsible_page_id').parents('div.coll_hiding').addClass('hide')
  else if data == 'Page/Tab'
    $('#collapsible_page_id').parents('div.coll_hiding').removeClass('hide')

card_group_reload_fields = (data = '') ->
  if data == 'Home Page' || data.length == 0
    $('#card_group_page_id').parents('div.coll_hiding').addClass('hide')
  else if data == 'Page/Tab'
    $('#card_group_page_id').parents('div.coll_hiding').removeClass('hide')
