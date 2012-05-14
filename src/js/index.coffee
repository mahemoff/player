pageTemplate = _.template($('#pageTemplate').html())
$page = null

$ ->
  $page = $('[data-role="page"]')
  loadAndShowChannels()

loadAndShowChannels = ->
  $.getJSON 'http://player.fm/mahemoff.jsonp?callback=?', (user) ->
    showList user.favoriteChannels
    $('a', $page).click -> loadAndShowEpisodes($(this).data('id'))
    false

loadAndShowEpisodes = (id) ->
  $.getJSON "http://player.fm/channels/#{id}.jsonp?callback=?", (channel) ->
    showList channel.episodes
    $('[data-role="content"] a', $page).click ->
      play(this.href)
      false
    false

showList = (items) ->
  pageContent = pageTemplate(items: items)
  console.log(pageContent)
  $('[data-role="content"]').html(pageContent)
  $page.page()
  $("[data-role='listview']").listview()
  $.mobile.changePage($page)

play = (url) ->
  $('<audio/>').appendTo('body') unless $('audio').length
  audio = $('audio')[0]
  audio.src = url
  audio.load()
  audio.play()
  console.log audio
