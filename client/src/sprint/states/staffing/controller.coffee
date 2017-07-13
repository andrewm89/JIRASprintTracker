angular.module 'JiraSprintTracker.sprint'
.controller 'SprintStaffingCtrl', (
  $scope
  $http
) ->

  $scope.title = 'Sprint Staffing'

  $scope.sprints = []

  $scope.sprint = {}

  $http({
    method: "GET"
    url: "/staffing/sprints"
  }).then (data) ->
    $scope.sprints = data.data
  , (error) ->
    console.log error

  $scope.newSprint = (name) ->
    $scope.sprint =
      name: name
      staffing: {}
    $http({
      method: "POST"
      url: "/staffing/sprints/new"
      data: $scope.sprint
    }).then (data) ->
      $scope.sprints.push($scope.sprint)
      $scope.newSprintName = ""
    , (error) ->
      console.log error

  $scope.selectSprint = (name) ->
    $scope.sprint = _.filter $scope.sprints, (sprint) ->
      sprint.name == name