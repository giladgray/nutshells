# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$.ready = (document) ->
  # class launchModal will automatically launch the attached modal
  $(".launchModal").modal('show')
  $("#loginplzModal").on('hidden', -> window.location = "/")

  # submitting form hides modal
  $("#newNutForm form").submit -> $("#newNutForm").modal('hide')
  # hiding modal resets form
  $("#newNutForm").on 'hidden', -> $("#newNutForm form")[0].reset()

  # grid/list display toggle buttons
  $("#showGrid").click -> $("#nuts").removeClass('list').addClass('grid')
  $("#showList").click -> $("#nuts").removeClass('grid').addClass('list')


clickRating = (url, id) ->
  # initiate AJAX call to update rating
  $.get "/nuts/#{id}/#{url}", (result) ->
    # it returns the new rating number, put that in the rating element
    $("#nut#{id} .nut.rating").text(result)


# opens a New Nut modal dialog with the given nut title pre-filled
window.nutModal = (title) ->
  $("#newNutForm").modal('show')
  $("#nut_title").val(title)
  $("#nut_body").focus()
