'use strict'

###*
 # @ngdoc function
 # @name pictureMappingApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the pictureMappingApp
###
angular.module 'pictureMappingApp'
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
