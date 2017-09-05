angular.module 'JiraSprintTracker.home'
.controller 'LoginCtrl', (
  $scope
  $state
  authUtils
) ->

  $scope.title = 'Sprint Tracker'

  $scope.credentials = {}

  $scope.login = (credentials) ->
    authUtils.loginUser credentials
    if authUtils.isLogged()
      $state.go 'main'
    # User feedback to be added here on failure
