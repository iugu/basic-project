TitleBarView = Backbone.View.extend
  el: "header"
  initialize: ->
    _.bindAll @, 'render', 'openDashboard', 'update', 'enableDashBoard', 'disableDashBoard', 'enableSendYell', 'disableSendYell'
    @display_DashBoard = true
    @display_SendYell = true

  events: ->
    "click .bt-dashboard": "openDashboard"

  update: () ->
    @render()

  enableDashBoard: (update=false) ->
    @display_DashBoard = true
    @render() if update

  disableDashBoard: (update=false) ->
    @display_DashBoard = false
    @render() if update

  enableSendYell: (update=false) ->
    @display_SendYell = true
    @render() if update

  disableSendYell: (update=false) ->
    @display_SendYell = false
    @render() if update

  openDashboard: () ->
    Router.navigate( 'dashboard', {trigger:true} )

  render: ->
    $(@el).html JST["view/title-bar"]
    @wrapper = $(@el).find('.wrapper').first()
    @wrapper.find('.bt-dashboard').hide() unless @display_DashBoard
    @wrapper.find('.bt-yell').hide() unless @display_SendYell

@TitleBarView = TitleBarView
