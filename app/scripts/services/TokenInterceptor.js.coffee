angular.module('googleApp').factory 'TokenInterceptor', ['$q', '$window', '$location', 'AuthenticationService', ($q, $window, $location, AuthenticationService) ->

{
    request: (config) ->
      config.headers = config.headers or {}
      if $window.sessionStorage.token
        config.headers.Authorization = 'Bearer ' + $window.sessionStorage.token
      config
    requestError: (rejection) ->
      $q.reject rejection
    response: (response) ->
      if response != null and response.status == 200 and $window.sessionStorage.token and !AuthenticationService.isAuthenticated
        AuthenticationService.isAuthenticated = true
      response or $q.when(response)
    responseError: (rejection) ->
      if rejection != null and rejection.status == 401 and ($window.sessionStorage.token or AuthenticationService.isAuthenticated)
        delete $window.sessionStorage.token
        AuthenticationService.isAuthenticated = false
        $location.path '/'
      $q.reject rejection

  }

]