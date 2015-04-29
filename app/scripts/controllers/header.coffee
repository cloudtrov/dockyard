'use strict'

###*
 # @ngdoc function
 # @name googleApp.controller:HeaderCtrl
 # @description
 # # HeaderCtrl
 # Controller of the googleApp
###
angular.module('googleApp')
  .controller 'HeaderCtrl', ['$scope', '$routeParams', 'ngTableParams', '$location','Sample', '$rootScope', '$sce', '$compile',
  ($scope, $routeParams, ngTableParams, $location, Sample, $rootScope, $sce, $compile)->
  
    Sample.showVersion().then (data) ->
      $scope.versionInfo = data;

]
