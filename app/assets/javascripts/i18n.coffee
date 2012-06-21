@localeData =
  'en': LOCALE_EN
  'pt-BR': LOCALE_PT_BR

class _i18n
  locale: "en"

  setDefaultLocale: ( _locale ) ->
    @locale = _locale

  getText: ( _string, _locale = "" ) ->
    _locale = @locale if _locale == ""
    parts = _string.split('.')
    _translated_text = null
    unless localeData[ _locale ]
      console.log "ERROR.I18N.TRANSLATE_TABLE.LOCALE_NOT_EXISTS " + _locale
      return "ERROR.I18N.TRANSLATE_TABLE.LOCALE_NOT_EXISTS"
    currentSegment = localeData[ _locale ]
    while parts.length
      _next = parts.shift()
      unless currentSegment[ _next ]
        console.log "ERROR.I18N.TRANSLATE_TABLE.INVALID_SEGMENT " + _next
        return "ERROR.I18N.TRANSLATE_TABLE.INVALID_SEGMENT"
      currentSegment = currentSegment[ _next ]
    if typeof currentSegment != "string"
      console.log "ERROR.I18N.TRANSLATE_TABLE.SEGMENT_NOT_TEXT"
      return "ERROR.I18N.TRANSLATE_TABLE.SEGMENT_NOT_TEXT"
    currentSegment

  pluralizeIf: ( _qty, _singular, _plural, _locale = "" ) ->
    return @getText( _singular, _locale ) if _qty == 1
    @getText( _plural, _locale )

@i18n = new _i18n
@_t = i18n.getText
@_p = i18n.pluralizeIf

$ ->
  saved_locale = $.cookie( 'default_locale' )
  i18n.setDefaultLocale( saved_locale ) if saved_locale
