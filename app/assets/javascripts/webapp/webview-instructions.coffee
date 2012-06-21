WebInstructionsView = Backbone.View.extend
  el: "#app-content"
  initialize: ->
    _.bindAll @, 'render'

  render: ->
    $(@el).html JST["view/webinstructions-view"]
    @wrapper = $(@el).find('.wrapper').first()
    window.TitleBar.enableDashBoard()
    window.TitleBar.disableSendYell(true)

@WebInstructionsView = WebInstructionsView
