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
    'uiGmapgoogle-maps'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
      .when '/gallery',
        templateUrl: 'views/gallery.html'
        controller: 'GalleryCtrl'
      .otherwise
        redirectTo: '/'
  .config (uiGmapGoogleMapApiProvider) ->
    uiGmapGoogleMapApiProvider
      .configure
        key: 'AIzaSyDgEo9hjCdBFtgtxxLeQx2mb2uo-i3BShs',
        v: '3.17',
        libraries: 'weather,geometry,visualization'
