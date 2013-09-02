# jQuery plugin
$.fn.modal = ->
  showModal($(this))

$(document).on 'click', 'a[data-toggle="modal"]', ->
  link = $(this)
  modal = $(link.attr('href'))
  showModal(modal)

$(document).on 'click', 'body.overlay', ->
  hideModal()

$(document).on 'click', 'a[data-dismiss="modal"]', ->
  hideModal()

$(document).on 'click', '.modal', (e) ->
  e.stopPropagation()

hideModal = ->
  $('body').removeClass('overlay')
  $('#overlay .modal').addClass('flyOut')
  $('#overlay').fadeOut 300, ->
    $(this).remove()
  return false

showModal = (element) ->
  modal = element.clone()
  modal.addClass('animated flyIn')

  if $('#overlay').length < 1
    $('body').append('<div id="overlay"></div>')

  maxheight = window.innerHeight - (window.innerHeight / 8) - 150

  modal.css({"margin-top": window.innerHeight / 8})
  modal.find('section').css({"max-height": maxheight})

  modal.appendTo('#overlay')
  $('#overlay').fadeIn(400)
  modal.show()

  $('body').addClass('overlay')
  return false