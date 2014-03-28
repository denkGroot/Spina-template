$(document).on 'click', 'body.dropdown', ->
  closeDropdown()

$(document).on 'click', '[data-trigger="dropdown"]', ->
  trigger = $(this)
  dropdown = $(trigger.attr('data-target'))
  body = $('body')

  if body.hasClass('dropdown')
    trigger.removeClass('button-active')
    body.removeClass('dropdown')
    dropdown.hide()
  else
    trigger.addClass('button-active')
    body.addClass('dropdown')
    dropdown.show()

  return false

$(document).on 'click', '[data-dropdown] ul', (e) ->
  e.stopPropagation()

closeDropdown = ->
  $('body').removeClass('dropdown')
  $('[data-dropdown] ul').hide()
  $('[data-trigger="dropdown"]').removeClass('button-active')
  return false
