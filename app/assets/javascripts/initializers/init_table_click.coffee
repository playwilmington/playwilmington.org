$(document).on 'turbolinks:load', ->
  init_table()
  return

$(document).on 'page:load', ->
  init_table()
  return

init_table =->
  visitDataUrl = (event) ->
    if event.type == 'click' or event.keyCode == '32' or event.keyCode == '13'
      if !event.target.href
        window.location = $(event.target).closest('tr').data('url')
    return

  $('table').on 'click', '.table__row', visitDataUrl
  $('table').on 'keydown', '.table__row', visitDataUrl
  return
