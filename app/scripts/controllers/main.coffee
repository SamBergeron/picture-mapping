'use strict'

###*
 # @ngdoc function
 # @name pictureMappingApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the pictureMappingApp
###
class MainCtrl
  constructor: ($scope, $log, uiGmapGoogleMapApi, uiGmapIsReady) ->

    $scope.mapInstance = null

    $scope.map =
      center:
        latitude: 45
        longitude: -73
      zoom: 8
      options:
        mapTypeId: 'google.maps.MapTypeId.SATELLITE'
      events:
        tilesloaded: (map) ->
          $scope.$apply ->
            $log.info 'This is the instance of the map', map

    $scope.recenterMap = ->
      if $scope.mapInstance
        $scope.mapInstance.control.refresh

    #make sure we get the map after it has loaded
    uiGmapIsReady.promise(1).then (maps) ->
      maps.forEach (map) ->
        map = map.map
        $log.log('Map has loaded')
        $scope.mapInstance = map

MainCtrl.$inject = ['$scope', '$log', 'uiGmapGoogleMapApi', 'uiGmapIsReady']
angular.module 'pictureMappingApp'
  .controller('MainCtrl', MainCtrl)
