Backbone.sync = ( method, model, options ) ->
  unless DEVELOPMENT_MODE
    if method == "read"
      msgpack.download( model.url(), {}, ( data, options, status ) ->
        if status.ok
          LoadRemoteData( model, data, options )

        options.success( model, data ) if options.success and status.ok
        options.error( model, data ) if options.error and !status.ok
      )
    else
      msgpack.upload( model.url(), { data: JSON.stringify(model) }, ( data, options, status ) ->
        options.success( model, data ) if options.success and status.ok
        options.error( model, data ) if options.error and !status.ok
      )
  else
    if method == "read"
      # Create DATA based on Request for Testing Purposes
      data = GenerateFixturesFor model
      LoadRemoteData( model, data, options )
      options.success( model, data )
    else
      options.success( model, data )
