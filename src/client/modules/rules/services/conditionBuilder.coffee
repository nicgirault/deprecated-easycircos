do (angular) ->
  angular.module('rules').factory 'conditionBuilder', ->
    operators:
      number: ['is', 'is not', 'is less than', 'is greater than', 'is less than or is', 'is greater than or is']
      text: ['is', 'is not', 'is in', 'is not in', 'start with', 'end with']
    datumParameters: [
      {
        label: 'value'
        type: 'number'
      }
      {
        label: 'position'
        type: 'number'
      }
      {
        label: 'parent'
        type: 'text'
      }
      {
        label: 'index'
        type: 'number'
      }
    ]
