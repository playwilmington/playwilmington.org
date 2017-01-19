ckeditor_run =->
  $('.ckeditor').each ->
    CKEDITOR.replace $(this).attr('id')

$(document).ready(ckeditor_run)
$(document).on('page:load', ckeditor_run)
