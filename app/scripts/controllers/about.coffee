'use strict'

###*
 # @ngdoc function
 # @name pictureMappingApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the pictureMappingApp
###
angular.module 'pictureMappingApp'
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
