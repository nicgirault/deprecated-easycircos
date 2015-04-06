do (angular) ->
  angular.module('trackManager').factory 'dataParser', (yaml, CircosNotification) ->
    maxRows = 1000
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
        yamlContent = yaml.load content

        # if file content is a string, it means it's not yaml
        if typeof yamlContent == 'string'
          Papa.parse content, {
            complete: (results) ->
              if results.meta.truncated
                CircosNotification.add 'Your dataset is too big. Only the first ' + maxRows + ' lines were parsed', 'tooMuchData', 1
              CircosNotification.add 'Autodetected delimiter is \'' + results.meta.delimiter + '\'', 'delimiter', 0
              angular.forEach results.errors, (error) ->
                CircosNotification.add error.message, error.message, 1
              if results.errors.length == 0
                CircosNotification.success 'Data parsed'
              callback results.data
            dynamicTyping: true
            skipEmptyLines: true
            preview: maxRows
          }

        else
          Notification.info 'Yaml format detected'
          callback yamlContent

    }
