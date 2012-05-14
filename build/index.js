(function() {
  var $page, loadAndShowChannels, loadAndShowEpisodes, pageTemplate, play, showList;

  pageTemplate = _.template($('#pageTemplate').html());

  $page = null;

  $(function() {
    $page = $('[data-role="page"]');
    return loadAndShowChannels();
  });

  loadAndShowChannels = function() {
    return $.getJSON('http://player.fm/mahemoff.jsonp?callback=?', function(user) {
      showList(user.favoriteChannels);
      $('a', $page).click(function() {
        return loadAndShowEpisodes($(this).data('id'));
      });
      return false;
    });
  };

  loadAndShowEpisodes = function(id) {
    return $.getJSON("http://player.fm/channels/" + id + ".jsonp?callback=?", function(channel) {
      showList(channel.episodes);
      $('[data-role="content"] a', $page).click(function() {
        play(this.href);
        return false;
      });
      return false;
    });
  };

  showList = function(items) {
    var pageContent;
    pageContent = pageTemplate({
      items: items
    });
    console.log(pageContent);
    $('[data-role="content"]').html(pageContent);
    $page.page();
    $("[data-role='listview']").listview();
    return $.mobile.changePage($page);
  };

  play = function(url) {
    var audio;
    if (!$('audio').length) {
      $('<audio/>').appendTo('body');
    }
    audio = $('audio')[0];
    audio.src = url;
    audio.load();
    audio.play();
    return console.log(audio);
  };

}).call(this);
