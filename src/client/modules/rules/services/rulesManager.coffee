do (angular) ->
  angular.module('rules').factory 'rulesManager', (helpStore) ->
    conditionBuilder: (rawRule) ->
      subject = rawRule.condition.subject.subject
      comparison = rawRule.condition.comparison
      object = rawRule.condition.object
      condition = (datum) ->
        if comparison.code is '>'
          return datum[subject] > parseFloat(object)
        if comparison.code is '='
          return datum[subject] == parseFloat(object)
        if comparison.code is '<'
          return datum[subject] < parseFloat(object)
        if comparison.code is 'in'
          return datum[subject] in object.split(',')
        if comparison.code is 'not in'
          return datum[subject] not in object.split(',')
        return false

      return condition
