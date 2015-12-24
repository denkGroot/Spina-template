$(document).on 'click', '.gallery .item', ->
  gallery = $(this).parents('.gallery')

  if gallery.data('multiselect') != undefined
    $(this).toggleClass('selected')
    checkbox = $(this).find('input:checkbox')
    checkbox.prop("checked", !checkbox.prop("checked"))
  else
    gallery.find('.item').removeClass('selected')
    gallery.find('.item input').prop('checked', false)
    $(this).toggleClass('selected')
    $(this).find('input').prop('checked', true)
