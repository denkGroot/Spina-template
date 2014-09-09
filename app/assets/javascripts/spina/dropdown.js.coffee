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

$(document).on 'click', '[data-dropdown] ul, [data-dropdown] .sliding-dropdown', (e) ->
  e.stopPropagation()

$(document).on 'click', '.slide-controls .previous, .slide-controls .next', (e) ->
  e.preventDefault()

  # Get sliding dropdown
  sliding_dropdown = $(this).parents('.sliding-dropdown')

  # Get active title
  active_title = sliding_dropdown.find('.slide-title.active')

  # Get previous and next titles
  previous = active_title.prev('.slide-title')
  next = active_title.next('.slide-title')

  if $(this).hasClass('previous') and previous.length > 0
    sliding_dropdown.find('.slide-title').removeClass('active')
    previous.addClass('active')
    target = previous.data('target')
    sliding_dropdown.find('.slide').removeClass('active')
    $(target).addClass('active')

  else if $(this).hasClass('next') and next.length > 0
    sliding_dropdown.find('.slide-title').removeClass('active')
    next.addClass('active')
    target = next.data('target')
    sliding_dropdown.find('.slide').removeClass('active')
    $(target).addClass('active')

  if sliding_dropdown.find('.slide-title.active').next('.slide-title').length > 0
    sliding_dropdown.find('.next').removeClass('muted')
  else
    sliding_dropdown.find('.next').addClass('muted')

  if sliding_dropdown.find('.slide-title.active').prev('.slide-title').length > 0
    sliding_dropdown.find('.previous').removeClass('muted')
  else
    sliding_dropdown.find('.previous').addClass('muted')

closeDropdown = ->
  $('body').removeClass('dropdown')
  $('[data-dropdown] ul, [data-dropdown] .sliding-dropdown').hide()
  $('[data-trigger="dropdown"]').removeClass('button-active')
  return false
