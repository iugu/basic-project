@DetectLanguage = ->
 language = window.navigator.userLanguage || window.navigator.language
 language = language.toLowerCase().replace('-','').replace('_','')

$ ->
  _cookie_session_token = $.cookie('session_token')
  _cookie_locale = $.cookie('default_locale')

  if IS_MOBILE
    if _cookie_locale
      $.webStorage.local().setItem('default_locale', _cookie_locale)
    if _cookie_session_token
      $.webStorage.local().setItem('session_token', _cookie_session_token)
    $.cookie( 'session_token', $.webStorage.local().getItem( 'session_token' ) )
    $.cookie( 'default_locale', $.webStorage.local().getItem( 'default_locale' ) )
