'use strict'
angular.module('googleApp')
  .controller 'AboutCtrl', ['$scope', '$routeParams', 'ngTableParams', '$location','Sample', '$rootScope', '$sce', '$compile', '$route'
  ($scope, $routeParams, ngTableParams, $location, Sample, $rootScope, $sce, $compile, $route)->
    
    # Sample.getContainers().then (data) ->
    #   $scope.containers = data;

    $scope.containersTable = new ngTableParams({
        page: 1,
        count: 10
        },{
        getData: ($defer, params) ->
          Sample.getContainers().then (data) ->
            $scope.containers = data;
          params.total($scope.containers.length);
          $defer.resolve $scope.containers.slice((params.page() - 1) * params.count(), params.page() * params.count())
        }   
    )
    $scope.toggleDetail = ($index)  ->
      $scope.activePosition = $scope.activePosition == $index ? -1 : $index;

    $scope.containerStatus = (status) ->
      if(status.match("Exited"))
        return false
      else
        return true

    $scope.restartContainer = (id, status) ->
      if(status.match("Exited"))
        status = "start"
      else
        status = "stop"
      Sample.restartContainer(id, status).then (data) ->
        $scope.containerErrorMessage = false;
        $scope.containersTable.reload();

    # $rootScope.containerError = () ->
    #   $scope.containerErrorMessage = true;
    #   $scope.containersTable.reload();     
]
