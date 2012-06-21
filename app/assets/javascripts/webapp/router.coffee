MainRouter = Backbone.Router.extend
  initialize: ->
    window.Root = new window.RootView()
    window.Root.render() if window.Root

  routes:
    "": "index"
    "/": "index"
    "dashboard": "renderDashBoard"
    "dashboard/:actions": "renderDashBoard"
    "search": "renderSearch"
    "search/:terms": "renderSearchResults"
    "login": "renderLogin"
    "create": "renderCreateSpace"
    "profile": "renderProfile"
    "profile/settings": "renderProfileSettings"
    "spaces/web": "renderGetWeb"
    "spaces/scan": "renderGetScan"
    "spaces/geo": "renderGetGeo"
    "*space": "renderSpace"

  clearView: () ->
    if @aView
      $(@aView.el).empty()
      @aView = undefined

  index: ->
    @clearView()
    Router.navigate( 'dashboard', {trigger:true} )

  renderDashBoard: () ->
    @clearView()
    @aView = new window.DashBoardView()
    @aView.render()

  renderSpace: ( space ) ->
    @clearView()
    @aView = new window.SpaceView()
    @aView.render()

  renderSearch: () ->
    @clearView()

  renderSearchResults: () ->
    @clearView()

  renderLogin: () ->
    @clearView()

  renderCreateSpace: () ->
    @clearView()

  renderProfile: () ->
    @clearView()

  renderProfileSetting: () ->
    @clearView()

  renderGetWeb: () ->
    @clearView()
    @aView = new window.WebInstructionsView()
    @aView.render()

  renderGetScan: () ->
    @clearView()

  renderGetGeo: () ->
    @clearView()

$ ->
  window.Router = new MainRouter()
