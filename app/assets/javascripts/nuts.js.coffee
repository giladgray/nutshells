# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$.ready = (document) ->
  $(".rate-up").click -> clickRating "up.json", $(this).attr "data_id"
  $(".rate-down").click -> clickRating "down.json", $(this).attr "data_id"
  $(".search-query").submit ->
    alert("submit")
    window.location = "/#{$(this).val()}"
  $(".nut.rating div").hover(
    -> $(this).find(".btn-group").show()
    -> $(this).find(".btn-group").hide()
  )
  $(".nut.rating div .btn-group").hide()

#  $("#submitNewNutButton").click ->
#    alert("button clicked")
#    $.post "/nut", { nut: { title: $("#nut_title").val(), body: $("#nut_body").val() } }, (result) ->


clickRating = (url, id) ->
  # initiate AJAX call to update rating
  $.get "/nuts/#{id}/#{url}", (result) ->
    # it returns the new rating number, put that in the rating element
    $("#nut#{id} .nut.rating").text(result)

    