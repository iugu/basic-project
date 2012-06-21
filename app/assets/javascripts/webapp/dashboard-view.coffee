DashBoardView = Backbone.View.extend
  el: "#app-content"
  initialize: ->
    _.bindAll @, 'render'

  events:
    "click .bt-access-web": "navigateToWebSpace"

  navigateToWebSpace: () ->
    Router.navigate( '/spaces/web', {trigger:true} )

  render: ->
    $(@el).html JST["view/dashboard-view"]
    @wrapper = $(@el).find('.wrapper').first()
    window.TitleBar.disableDashBoard()
    window.TitleBar.disableSendYell(true)

@DashBoardView = DashBoardView
