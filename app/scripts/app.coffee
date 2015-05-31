'use strict'

###*
 # @ngdoc overview
 # @name pictureMappingApp
 # @description
 # # pictureMappingApp
 #
 # Main module of the application.
###
angular
  .module 'pictureMappingApp', [
    'ngRoute'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
      .otherwise
        redirectTo: '/'

