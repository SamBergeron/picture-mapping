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
    startCenter =
      latitude: 51.3
      longitude: -117.5

    $scope.mapInstance = null

    $scope.map =
      center:
        latitude: startCenter.latitude
        longitude: startCenter.longitude
      zoom: 8
      options:
        mapTypeId: google.maps.MapTypeId.HYBRID
      events:
        tilesloaded: (map) ->
          $scope.$apply ->
            $log.info 'This is the instance of the map', map

    $scope.recenterMap = ->
      if $scope.mapInstance
        $scope.mapInstance.panTo(new google.maps.LatLng(startCenter.latitude, startCenter.longitude))

    # Add marker
    $scope.mymarker = new google.maps.Marker
        map: $scope.mapInstance
        animation: google.maps.Animation.DROP
        position: new google.maps.LatLng(52, 118)
        title: 'foo'


    #make sure we get the map after it has loaded
    uiGmapIsReady.promise(1).then (maps) ->
      maps.forEach (map) ->
        map = map.map
        $log.log('Map has loaded')
        $scope.mapInstance = map


MainCtrl.$inject = ['$scope', '$log', 'uiGmapGoogleMapApi', 'uiGmapIsReady']
angular.module 'pictureMappingApp'
  .controller('MainCtrl', MainCtrl)
