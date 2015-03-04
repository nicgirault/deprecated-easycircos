do (angular) ->
  angular.module('rules').factory 'rulesManager', (helpStore) ->
    conditionBuilder: (rawRule) ->
      return null unless rawRule.condition
      return null unless rawRule.condition.subject
      return null unless rawRule.condition.subject.label
      return null unless rawRule.condition.operator
      return null unless rawRule.condition.object

      subject = rawRule.condition.subject.label
      type = rawRule.condition.subject.type
      comparison = rawRule.condition.operator
      object = rawRule.condition.object
      condition = (parent, datum, index) ->
        if subject == 'parent'
          s = parent
        else if subject == 'index'
          s = index
        else
          s = datum[subject]

        if comparison is 'is greater than'
          return s > parseFloat(object)
        if comparison is 'is' and type == 'number'
          return s == parseFloat(object)
        if comparison is 'is' and type == 'text'
          return s == object
        if comparison is 'is less than'
          return s < parseFloat(object)
        if comparison is 'is in'
          return s in object.split(',')
        if comparison is 'is not in'
          return s not in object.split(',')
        return false

      return condition
