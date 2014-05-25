$ ->
  count = 0
  $(".tile").click ->
    count += 1
    console.log count
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
        tile.css("border", "#FFA0A0")
      success:(r) ->
        console.log(r)

    if count == 64
      document.location.href = '/tiles' 



