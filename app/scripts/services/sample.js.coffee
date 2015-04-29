angular.module('googleApp').factory 'Sample', ['appConfig','$resource','$http','$q','$rootScope', (appConfig, $resource, $http, $q, $rootScope) ->

  showVersion: (welcome) ->
    deferred = $q.defer()
    xhr = $http.get(appConfig.baseUrl+'/version')
    xhr.success (data) ->
      deferred.resolve data
      return
    xhr.error (data) ->
      deferred.reject data
      return
    deferred.promise
  getImages: () ->
    deferred = $q.defer()
    xhr = $http.get(appConfig.baseUrl+'/images/json')
    xhr.success (data) ->
      deferred.resolve data
      return
    xhr.error (data) ->
      deferred.reject data
      return
    deferred.promise
  getContainers: () ->
    deferred = $q.defer()
    xhr = $http.get(appConfig.baseUrl+'/containers/json?all='+true)
    xhr.success (data) ->
      deferred.resolve data
      return
    xhr.error (data) ->
      deferred.reject data
      return
    deferred.promise
  showInfo: () ->
    deferred = $q.defer()
    xhr = $http.get(appConfig.baseUrl+'/info')
    xhr.success (data) ->
      deferred.resolve data
      return
    xhr.error (data) ->
      deferred.reject data
      return
    deferred.promise

  restartContainer : (id, status) ->
    deferred = $q.defer()
    xhr = $http.post(appConfig.baseUrl+'/containers/'+id+'/'+status)
    xhr.success (data) ->
      deferred.resolve data
      # $rootScope.containerError = false
      return
    xhr.error (data) ->
      deferred.reject data
      debugger;
      $rootScope.containerError()
      return
    deferred.promise
 ]