var Playlist = Backbone.Model.extend({
  idAttribute: 'name',

  // Default value. So the input box that allows
  // you to create a new playlist, the default name
  // is shown.
  defaults: {
    'name': 'New playlist'
  },

  // Ensure that each playlist created has a name
  initialize: function() {
    if(!this.get('name')) {
      console.log('Playlist:initialize');1
      this.set({'name':this.defaults.name});
    }
  },

  url: function () {
    console.log('create url for playlist: ' + this.get('name'));
    return '/playlist/' + this.get('name');
  }   
});

var PlaylistCollection = Backbone.Collection.extend({
  model: Playlist,
  initialize: function (models, options) {
    console.log("Called pl collection", models, options);
  }
});

var PlaylistCollectionView = Backbone.View.extend({
  el: "#pl-list",

  // Keep reference to initialized view.
  initialize: function(data) {
    console.log('PlaylistCollectionView:initialize', data);
    this.data = data;
  },

  // Render the collection view. Basically, iterate over
  // each playlist view and add to the collection.
  render: function() {

  }
});

var PlaylistView = Backbone.View.extend({
  tagName: "li",
  template: _.tempplate($('#


});

//Model.extend({
    //name: ""
  //});

  //Playlists = Backbone.Collection.extend({

  //});

  //Song = Backbone.Model.extend({
    //path: ""
  //});

  //Songs = Backbone.Model.extend({
  //});
  
  //Friend = Backbone.Model.extend({
    ////Create a model to hold friend atribute
    //name: null
  //});

  //PlayerView = Backbone.View.extend({


  //});
  
  //Friends = Backbone.Collection.extend({
    ////This is our Friends collection and holds our Friend models
    //initialize: function (models, options) {
      //this.bind("add", options.view.addFriendLi);
      ////Listen for new additions to the collection and call a view function if so
    //}
  //});

  
  
  //AppView = Backbone.View.extend({
    //el: $("body"),
    //initialize: function () {
      //this.friends = new Friends( null, { view: this });
      ////Create a friends collection when the view is initialized.
      ////Pass it a reference to this view to create a connection between the two
    //},
    //events: {
      //"click #add-friend":  "showPrompt",
    //},
    //showPrompt: function () {
      //var friend_name = prompt("Who is your friend?");
      //var friend_model = new Friend({ name: friend_name });
      ////Add a new friend model to our friend collection
      //this.friends.add( friend_model );
    //},
    //addFriendLi: function (model) {
      ////The parameter passed is a reference to the model that was added
      //$("#friends-list").append("<li>" + model.get('name') + "</li>");
      ////Use .get to receive attributes of the model
    //}
  //});
  
  //var appview = new AppView;
//})(jQuery);
