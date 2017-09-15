angular.module 'JiraSprintTracker.utils'
.service 'authUtils', ($http, $cookies) ->
  isLogged: ->
    if $cookies.get('cloud.session.token')
      return true
    return false

  loginUser: (credentials) ->
    $http({
      method: 'POST'
      url: '/login'
      data: credentials
      headers:
        'Content-Type': 'application/json'
    }).then((response) ->
      cookie = angular.fromJson(response).data
      $cookies.put('cloud.session.token', cookie.session.value)
    , (response) ->
      console.log 'Error'
      console.log response
    )

  logoutUser: ->
    $http({
      method: 'DELETE'
      url: '/logout'
      headers:
        'Content-Type': 'application/json'
    }).then((response) ->
      console.log 'Successfully logged out'
      $cookies.remove('cloud.session.token')
    , (response) ->
      console.log 'Error'
      console.log response
    )
