angular.module 'JiraSprintTracker.home'
.controller 'HomeMainCtrl', (
  $scope
  $http
  $cookies
) ->

  $scope.title = 'Sprint Tracker'

  $scope.logged_in = false

  $scope.credentials = {}

  if $cookies.get("cloud.session.token")
    $scope.logged_in = true

  $scope.login = (credentials) ->
    $http({
      method: "POST"
      url: "/login"
      data: credentials
      headers:
        "Content-Type": "application/json"
    }).then((response) ->
      cookie = angular.fromJson(response).data
      $cookies.put("cloud.session.token", cookie.session.value)
      $scope.logged_in = true
    , (response) ->
      console.log "Error"
      console.log response
    )

  $scope.logout = (credentials) ->
    $http({
      method: "DELETE"
      url: "/logout"
      headers:
        "Content-Type": "application/json"
    }).then((response) ->
      console.log "Successfully logged out"
      $cookies.remove("cloud.session.token")
      $scope.logged_in = false
    , (response) ->
      console.log "Error"
      console.log response
    )
