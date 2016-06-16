$(document).on 'click', 'nav#primary a.back-to-main-menu', (e) ->
  e.preventDefault()
  $('nav#primary').removeClass('animated')

$(document).on 'click', 'nav#primary > ul > li > a', (e) ->
  link = $(this)
  if link.parent().find('ul').length > 0
    $('nav#primary > ul > li').removeClass('active')
    link.parent().addClass('active')
    $('nav#primary').addClass('animated')
    e.preventDefault()

$(document).on 'click', 'nav#primary ul li a', (e) ->
  $('nav#primary ul li ul li').removeClass('active')
  $(this).parent().addClass('active')