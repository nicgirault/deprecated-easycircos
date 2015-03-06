do (angular) ->
  angular.module('trackManager').factory 'dataParser', (yaml) ->
    formats = [
      { ext:'yml', delimiter: null, label: '.yml' }
      { ext:'csv', delimiter: ',', label: '.csv' }
      { ext:'.tsv', delimiter: '\t', label: '.tsv' }
      { ext:'.dsv;', delimiter: ';', label: '.dsv ";"' }
      { ext:'.dsv ', delimiter: ' ', label: '.dsv " "' }
    ]

    return {
      formats: formats
      format: formats[0]
      toggleFormat: ->
        key = @formats.indexOf @format
        if key == @formats.length - 1
          @format = @formats[0]
        else
          @format = @formats[key+1]
      parse: (content, callback) ->
        try
          callback(yaml.load(content))
        catch
          Papa.parse(content, {
            complete: (results) ->
              callback results.data
            delimiter: @format.delimiter
            dynamicTyping: true
            skipEmptyLines: true
          })
    }

