# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'page:change', ->
  $('#comments-link').click ->
    $('#comments-link').fadeToggle()

$(document).on 'page:change', ->
  $("#my-checkbox").change ->
    $("#my-checkbox").fadeToggle()


$(document).on 'page:change', ->
  $('#comments-link').click ->
    $('#my-p').append

$(document).ready ->
  $(".btn-show-new").click ->
    $(".new-election-type-form").toggle()

$(document).ready ->
  $("input[name='candidate']").change ->
    maxAllowed = parseInt( $("#max-votes").val() )
    count = $("input[name='candidate']:checked").length
    if(count > maxAllowed)
      $(this).prop("checked", false)
      if(maxAllowed==1)
        alert('Możesz wybrać maksymalnie ' + maxAllowed + ' kandydata.')
      else
        alert('Możesz wybrać maksymalnie ' + maxAllowed + ' kandydatów.')