SpaceView = Backbone.View.extend
  el: "#app-content"
  initialize: ->
    _.bindAll @, 'render'

  render: ->
    $(@el).html JST["view/space-view"]
    @wrapper = $(@el).find('.wrapper').first()
    window.TitleBar.enableDashBoard()
    window.TitleBar.enableSendYell(true)

@SpaceView = SpaceView
