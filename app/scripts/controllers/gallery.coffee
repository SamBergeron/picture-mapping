'use strict'

class GalleryCtrl
  constructor: ($scope, $log, $http) ->

    $scope.photos = []
    $scope.photos.push src: '/images/test/2015-05-17 11.28.01.jpg'
    $scope.photos.push src: '/images/test/2015-05-17 11.28.04.jpg'
    $scope.photos.push src: '/images/test/2015-05-18 14.03.11.jpg'
    $scope.photos.push src: '/images/test/2015-05-18 14.03.13.jpg'
    $scope.photos.push src: '/images/test/2015-05-18 14.10.00.jpg'

    $scope._index = 0;
    $scope.isImageActive = (index) ->
      return index == $scope._index
    $scope.showPrev = () ->
      return $scope._index = if $scope._index > 0 then --$scope._index else $scope.photos.length - 1
    $scope.showNext = () ->
      return $scope._index = if $scope._index < $scope.photos.length-1 then ++$scope._index else 0
    $scope.showSelect = (index) ->
      return $scope._index = index

GalleryCtrl.$inject = ['$scope', '$log', '$http']
angular.module 'pictureMappingApp'
  .controller('GalleryCtrl', GalleryCtrl)
