do (angular) ->
  angular.module('rules').controller 'modalRuleController', ($scope, $modalInstance, configurationParameter, rulesManager, rawRules, conditionBuilder, parameterType) ->

    $scope.rawRules = rawRules

    $scope.conditionBuilder = conditionBuilder

    $scope.configurationParameter = configurationParameter
    $scope.valueType = parameterType
    $scope.newRule = ->
      $scope.rawRules.push {
        condition:
          subject: null
          operator: null
          object: null
        parameter: configurationParameter
        value: null
      }

    $scope.newRule() unless $scope.rawRules.length

    $scope.deleteRule = (index) ->
      $scope.rawRules.splice index, 1

    $scope.save = () ->
      rules = []
      rawRules = []
      for rule in $scope.rawRules
        condition = rulesManager.conditionBuilder rule
        if condition?
          rules.push {
            parameter: configurationParameter
            condition: condition
            value: rule.value
          }
          rawRules.push rule
      $modalInstance.close(rules, rawRules)

    $scope.cancel = ->
      $modalInstance.dismiss 'cancel'

