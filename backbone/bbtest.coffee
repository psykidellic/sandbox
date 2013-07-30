_ = require('underscore')
Backbone = require('backbone')

data =
  id: 1
  queue_items: [
    id: 1
    song:
      id: 1
      name: 'song 1'
    ,
      id: 2
      name: 'song 2'
  ,
    id: 2
    song:
      id: 3
      name: 'song 3'
    ,
      id: 4
      name: 'song 4'
  ]

class Song extends Backbone.Model

class QueueItem extends Backbone.Model

  initialize: ->
    console.log("queueitem called")
    @song = new Song(@get('song'))

  parse: (response) ->
    console.log("queueitem parse")
    response

class QueueItems extends Backbone.Collection
  model: QueueItem

class Queue extends Backbone.Model

  initialize: ->
    @items = new QueueItems()
    @items.reset(@get('queue_items'))

  parse: (response) ->
    console.log("Queue parse called")
    return response

queue = new Queue(data)
# console.log(queue.get('queue_items'))

