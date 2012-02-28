# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$.ready = (document) ->
  # click handlers for rating buttons
  $(".rate-up").click -> clickRating "up.json", $(this).attr "data_id"
  $(".rate-down").click -> clickRating "down.json", $(this).attr "data_id"
  # hover over a nut rating to show +/- options
  $(".nut.rating div").hover(
    -> $(this).find(".btn-group").show()
    -> $(this).find(".btn-group").hide()
  )
  $(".nut.rating div .btn-group").hide()
  # class launchModal will automatically launch the attached modal
  $(".launchModal").modal('show')
  $("#loginplzModal").on('hidden', -> window.location = "/")

  $("#newNutForm form").submit -> $("#newNutForm").modal('hide')
  $("#newNutForm").on 'hide', loadAllNuts


clickRating = (url, id) ->
  # initiate AJAX call to update rating
  $.get "/nuts/#{id}/#{url}", (result) ->
    # it returns the new rating number, put that in the rating element
    $("#nut#{id} .nut.rating").text(result)


loadAllNuts = ->
  $.get "/nuts.json", (result) ->
    window.data = result
    table = $("#tableOfNuts")
    table.html("")
    for nut in result
      row = $("<tr>").attr("id", "nut#{nut.id}")
      row.append($("<td>").addClass("nut title span3").html("<h3>#{nut.title}</h3>"))
      row.append($("<td>").addClass("nut rating span2").text(nut.rating))
      row.append($("<td>").addClass("nut body span5").text(nut.body))
      row.append($("<td>").addClass("nut body span5").text(nut.user.username))
      table.append(row)
