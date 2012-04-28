var Playlist = Backbone.Model.extend({
});

var PlaylistCollection = Backbone.Collection.extend({

  model: Playlist

});

var PlaylistCollectionView = Backbone.View.extend({

  tagName: "ul",

  initialize: function() {
  },

  render: function() {
    $(this.el).empty();
    _.each(self.model.models, function(playlist) {
      $(this.el).append(new PlaylistItemView({model:playlist}).render().el);
    });
    return this;
  }
});

var AppRouter = Backbone.Router.extend({

  routes: {
    "": "home",
    "playlist/:name": "playlist"
  },

  // As the name suggests, the first method to be called for the app.
  // Set up the page and all the basic views - header, sidebar etc.
  // Generally, one can check if there
  // is any existing session or not and change the display if required.
  initialize: function() {
    console.log("approuter:initialize");
    $('header').html('HEADER TEXT ON START');   
  },

  home: function() {
    // Generally, homeview do not change so reuse
    // the same object. Seems like its a good pattern.
    console.log("home in approuter");
  }

});

$(document).ready(function() {
  var app = new AppRouter();
  Backbone.history.start();
});


