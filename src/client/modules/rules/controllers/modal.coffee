do (angular) ->
  angular.module('rules').controller 'modalRuleController', ($scope, $modalInstance, configurationParameter, rulesManager) ->

    $scope.rawRules = []
    $scope.configurationParameter = configurationParameter
    $scope.newRule = ->
      $scope.rawRules.push {
        condition:
          subject: null
          comparison: null
          object: null
        parameter: configurationParameter
        value: null
      }

    $scope.deleteRule = (index) ->
      $scope.rawRules.splice index, 1

    $scope.conditionBuilder = [
      {
        subject: 'value'
        comparison: [
          {label: 'is higher than', code: '>'}
          {label: 'is lower than', code: '<'}
          {label: 'is', code: '='}
        ]
        object: 'number'
      }
      {
        subject: 'position'
        comparison: [
          {label: 'is before', code: '<'}
          {label: 'is after', code: '>'}
          {label: 'is', code: '='}
        ]
        object: 'number'
      }
      {
        subject: 'parentId'
        comparison: [
          {label: 'is', code: '='}
          {label: 'is not', code: '!='}
          {label: 'is in', code: '[]'}
          {label: 'is not in', code: '[]'}
        ]
        object: 'text'
      }
      {
        subject: 'index'
        comparison: [
          {label: 'is higher than', code: '>'}
          {label: 'is lower than', code: '<'}
          {label: 'is', code: '='}
        ]
        object: 'number'
      }
    ]

    $scope.save = () ->
      rules = []
      for rule in $scope.rawRules
        rules.push {
          parameter: configurationParameter
          condition: rulesManager.conditionBuilder rule
          value: rule.value
        }
      console.log rules
      $modalInstance.close(rules)

    $scope.cancel = ->
      $modalInstance.dismiss 'cancel'

