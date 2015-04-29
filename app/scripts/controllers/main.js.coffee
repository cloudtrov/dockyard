'use strict'
angular.module('googleApp')
  .controller 'MainCtrl', ['$scope', '$routeParams', 'ngTableParams', '$location','Sample', '$rootScope', 
  '$sce', '$compile','$modal', '$window', 'AuthenticationService', ($scope, $routeParams, ngTableParams, $location, Sample, $rootScope, $sce, $compile, $modal, $window, AuthenticationService)->
    $scope.dockerContent = {};
    $scope.user = {};
    $scope.dockerContent.url = "/views/_summary.html";
    $scope.stoppedContainer = [];
    data = [];
    $scope.runningContainers = [];

    Sample.getContainers().then (data) ->
      $scope.containers = data;
      data.forEach (container) ->
        if(container.Status.match("Exited")) 
          $scope.stoppedContainer.push(container)
        else
           $scope.runningContainers.push(container)

    Sample.getImages().then (data) ->
      $scope.dockerImages = data;

      $scope.tableImage = new ngTableParams({
        page: 1,
        count: 10
        },{
        total: $scope.dockerImages.length,
        getData: ($defer, params) ->
          $defer.resolve $scope.dockerImages.slice((params.page() - 1) * params.count(), params.page() * params.count())
        }   
      )
 

    Sample.showInfo().then (data) ->
      $scope.dockerInfo = data;

    $scope.containerList = () ->
      $scope.view = "container"
      $scope.dockerContent.url = "/views/_container_list.html";
    $scope.imageList = () ->
      $scope.view = "image"
      $scope.dockerContent.url = "/views/_image_list.html";

    $scope.dockerSummary = () ->
      $scope.view = "summary"
      $scope.dockerContent.url = "/views/_summary.html";

    $scope.isActive = (view) ->
      if(view == $scope.view)
        return true
      else
        return false;
    $scope.getRepo = (image) ->
      return image.split(':')[0]

    $scope.getTag = (image) ->
      return image.split(':')[1]

    $scope.toggleDetail = ($index) ->
      $scope.viewMore = false
      $scope.activePosition = if $scope.activePosition == $index then -1 else $index
      return
    # $scope.createContainer = () ->           
    #   modalInstance = $modal.open({
    #   templateUrl: 'views/_create_container.html',
    #   backdrop : 'static',
    #   });
]