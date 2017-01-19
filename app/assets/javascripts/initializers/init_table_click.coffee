$(document).on 'turbolinks:load', ->
  table_int()
  return

$(document).on 'page:load', ->
  table_int()
  return

table_int =->
  visitDataUrl = (event) ->
    if event.type == 'click' or event.keyCode == '32' or event.keyCode == '13'
      if !event.target.href
        window.location = $(event.target).closest('tr').data('url')
    return

  $('table').on 'click', '.table__row', visitDataUrl
  $('table').on 'keydown', '.table__row', visitDataUrl
  return
