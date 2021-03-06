immutable = require 'immutable'
React = require 'react'

{ div } = React.DOM
MyListView = React.createFactory require './my-list-view'


module.exports = React.createClass
  displayName: 'App'

  _createSubItem: (id, text) ->
    shifter = "..."
    return immutable.Map({ id, text, shifter })

  _createItem: (id, text, subItems = null) ->
    if !subItems
      subItems = immutable.List()
    return immutable.Map({ id, text, subItems })

  _getThings: ->
    subItems = immutable.List.of(
      @_createSubItem(10, "subitem 1")
      @_createSubItem(20, "subitem 2")
      @_createSubItem(30, "subitem 3")
    )
    subItems2 = immutable.List.of(
      @_createSubItem(40, "subitem 1")
      @_createSubItem(50, "subitem 2")
      @_createSubItem(60, "subitem 3")
    )

    return immutable.List.of(
      @_createItem(1, 'foldable item', subItems)
      @_createItem(2, 'foldable item', subItems2)
    )

  render: ->
    MyListView
      things: @_getThings()
