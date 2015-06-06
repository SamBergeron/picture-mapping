'use strict'

###*
 # @ngdoc function
 # @name pictureMappingApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the pictureMappingApp
###
class MainCtrl
  constructor: ($scope, $log, $http, uiGmapGoogleMapApi, uiGmapIsReady) ->

    $scope.mapInstance = null

    # Add markers from json file
    $scope.markers = []
    $http.get('markers.json').success (res) ->
      for marker in res
        #Toggle window on click for marker
        $scope.markers.push(marker)
      $log.log 'Here are the markers: ' + $scope.markers
    .error (res) ->
      $log.log 'Loading markers has failed ' + res

    $scope.map =
      control: {}
      center:
        latitude: 51.222657326976254
        longitude: -117.70599365234375
      zoom: 9
      tilt: 45
      options:
        mapTypeId: google.maps.MapTypeId.HYBRID
      events:
        tilesloaded: (map) ->
          $scope.$apply ->
            $scope.mapInstance = map

    $scope.recenterMap = (lat, long) ->
      if $scope.mapInstance
        $scope.mapInstance.panTo(new google.maps.LatLng(lat, long))

    $scope.centerOnMarker = (marker) ->
      $scope.recenterMap(marker.latitude, marker.longitude)
      $scope.mapInstance.setZoom(12)

    #If they ever decide to make this work everywhere on the map it would be cool
    #Right now you can test it if you're in a big city (AKA it works in NYC)
    $scope.tiltOnCenter = ->
      if $scope.mapInstance
        tilt = $scope.mapInstance.getTilt()
        $scope.mapInstance.setTilt(45)
        $scope.mapInstance.setHeading(90)

    $scope.onClick = (show) ->
      show = !show
      $log.log(show)


    #make sure we get the map after it has loaded
    uiGmapIsReady.promise(1).then (maps) ->
      maps.forEach (map) ->
        $scope.mapInstance = map.map


MainCtrl.$inject = ['$scope', '$log', '$http', 'uiGmapGoogleMapApi', 'uiGmapIsReady']
angular.module 'pictureMappingApp'
  .controller('MainCtrl', MainCtrl)
