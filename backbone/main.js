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
    if(!this.homeView) {
      this.homeView = PlaylistCollectionView(new PlaylistCollection(DefaultPlaylist));
    }

    this.homeView.render();      
  },

});

$(document).ready(function() {
  var app = new AppRouter();
  Backbone.history.start();
});


