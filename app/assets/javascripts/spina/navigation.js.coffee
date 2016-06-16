$(document).on 'click', 'nav#primary a.back-to-main-menu', (e) ->
  e.preventDefault()
  $('nav#primary').removeClass('animated')

$(document).on 'click', 'nav#primary > ul > li > a', (e) ->
  link = $(this)
  $('nav#primary > ul > li').removeClass('active')
  link.parent().addClass('active')

  if link.parent().find('ul').length > 0
    $('nav#primary').addClass('animated')
    e.preventDefault()
  else
    $('nav#primary').removeClass('animated')

$(document).on 'click', 'nav#primary ul li a', (e) ->
  $('nav#primary ul li ul li').removeClass('active')
  $(this).parent().addClass('active')