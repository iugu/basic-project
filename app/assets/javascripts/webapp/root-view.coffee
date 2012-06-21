RootView = Backbone.View.extend
  el: "#app"
  initialize: ->
    _.bindAll @, 'render'

  #events: ->
  #  "touchstart a.test": "emulate_touch"
  #  "touchend a.test": "emulate_untouch"
  #  "click .more": "more"

  #more: () ->
  #  window.TitleBar.test()
  #  window.TitleBar.update()

  #testing: ( event ) ->
  #  event.preventDefault()
  #  Sound.play("walking")

  #emulate_touch: ( event ) ->
  #  $(event.target).addClass('active')
  
  #emulate_untouch: ( event ) ->
  #  $(event.target).removeClass('active')
  
  render: ->
    $(@el).html JST["view/main-view"]

    window.TitleBar = new window.TitleBarView() unless window.TitleBar
    window.TitleBar.disableDashBoard(false)
    window.TitleBar.disableSendYell(false)
    window.TitleBar.render()
    @

@RootView = RootView
