# jQuery plugin
$.fn.galleryselect = ->
  return this.each ->
    gallery = $(this)

    if gallery.data('multiselect') != undefined
      gallery.find('.item').click ->
        $(this).toggleClass('selected')
        checkbox = $(this).find('input:checkbox')
        checkbox.prop("checked", !checkbox.prop("checked"))

    else
      gallery.find('.item').click ->
        gallery.find('.item').removeClass('selected')
        gallery.find('.item input').prop('checked', false)
        $(this).toggleClass('selected')
        $(this).find('input').prop('checked', true)
