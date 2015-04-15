$(document).on 'click', '.structure-form-menu ul li a', (e) ->
  $structureForm = $(this).parents('.structure-form')
  $(this).parent('li').siblings().removeClass('active')
  $(this).parent('li').addClass('active')
  $structureForm.find('.structure-form-pane').hide()
  $($(this).attr('href')).show()
  e.preventDefault()