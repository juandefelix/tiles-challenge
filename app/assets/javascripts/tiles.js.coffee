# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$ ->
  $(".tile").click ->
    tile = $(this)
    word = $("p", this).text()
    id = $(this).attr('id')
    tile.css("visibility", "hidden")
    $.ajax
      url: "/tiles"
      type: "POST"
      # dataType: 'json'
      data: "tile":
        timestamp: new Date().getTime(),
        word: word
        id: id
      error: ->
        tile.css("visibility", "visible")
        tile.css("background-color", "#FFAAAA")



