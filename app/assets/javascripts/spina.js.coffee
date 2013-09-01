#= require jquery.datatables
#= require jquery.ui
#= require jquery.sortable
#= require jquery.nestedsortable
#= require raphael
#= require morris
#= require nprogress
#= require wysihtml5
#= require wysihtml5_parser_rules

#= require switch
#= require modal
#= require tabs
#= require dropdown

# Nprogress
$(document).on 'page:fetch', -> NProgress.start()
$(document).on 'page:change', -> NProgress.done()
$(document).on 'page:restore', -> NProgress.remove()

# Clickable TR's
$(document).on 'click', '.table-clickable tbody tr', ->
  checkbox = $(this).find('input[type="checkbox"]:first')
  checkbox.prop("checked", !checkbox.prop("checked"))

# Search inputs
$(document).on 'keyup', '.search-input input', (e) ->
  $(this).parent().removeClass('animated small-shake')
  if $(this).val() == ""
    $(this).parent().find('.clear-input').fadeOut(200)
    if e.keyCode == 13
      $(this).parent().addClass('animated small-shake')
  else
    $(this).parent().find('.clear-input').fadeIn(200)

$(document).on 'click', '.clear-input', ->
  link = $(this)
  input = link.siblings('input')
  input.val("")
  input.focus()
  input.trigger("keyup")
  link.fadeOut(200)
  return false

$(document).on 'keyup + change', '.table-container .search-input input', ->
  datatable = $(this).parent().parent().find('table.datatable').dataTable()
  datatable.fnFilter($(this).val())

# Datatables

ready = ->

  # Wysihtml5 editor
  $('.wysihtml5-container').each ->
    textarea = $(this).find('textarea')
    toolbar = $(this).find('.toolbar')

    editor = new wysihtml5.Editor textarea.attr('id'), {
      toolbar: toolbar.attr('id'),
      useLineBreaks: false,
      parserRules: wysihtml5ParserRules,
    }

  $('ol.sortable').nestedSortable
    listType: 'ol'
    items: 'li'
    disableNesting: 'no-nest',
    placeholder: 'placeholder'
    forcePlaceholderSize: true
    handle: 'div'
    tolerance: 'pointer'
    toleranceElement: '> div'
    maxLevels: 3
    update: ->
      # based upon https://github.com/patrickshannon/Nested-Drag-and-Drop-with-Ancestry/blob/master/public/javascripts/application.js
      mylist = $(this).nestedSortable('serialize')
      mylist.replace(/root/g, '')
      sort_url = $(this).data('sort-url')
      finalstring = ''
      $(mylist.split('&')).each (index) ->
        string2 = this.split('[')
        type = string2[0]
        string3 = string2[1].split(']')
        id = string3[0]
        fragments = this.split('=')
        parent_id = fragments[1]
        finalstring = finalstring + type + '[' + index + ']' + '[id]=' + id + '&' + type + '[' + index + '][parent_id]=' + parent_id + '&' + type + '[' + index + '][position]=' + index + '&'
      $.post sort_url, finalstring

  # Switch
  if $('input[data-switch]').length > 0
    $('input[data-switch]').spinaSwitch()

  # Datepicker
  if $('.datepicker').length > 0
    $('.datepicker').datepicker()

  # Datatable
  if $('.datatable').length > 0
    $('table.datatable').dataTable
      "bLengthChange": false,
      "oLanguage": {
        "sProcessing": "Bezig...",
        "sLengthMenu": "_MENU_ resultaten weergeven",
        "sZeroRecords": "Geen resultaten gevonden",
        "sInfo": "_START_ tot _END_ van _TOTAL_ resultaten",
        "sInfoEmpty": "Geen resultaten om weer te geven",
        "sInfoFiltered": " (gefilterd uit _MAX_ resultaten)",
        "sInfoPostFix": "",
        "sSearch": "Zoeken:",
        "sEmptyTable": "Geen resultaten aanwezig in de tabel",
        "sInfoThousands": ".",
        "sLoadingRecords": "Een moment geduld aub - bezig met laden...",
        "oPaginate": {
          "sFirst": "Eerste",
          "sLast": "Laatste",
          "sNext": "Volgende",
          "sPrevious": "Vorige"
        }
      }

$(document).ready(ready)
$(document).on 'page:load', ready