angular.module 'JiraSprintTracker.sprint'
.controller 'SprintTeamCtrl', (
  $scope
  $http
) ->

  $scope.title = 'Team Management'

  $scope.team = {}

  $scope.roles = [
    'Developer',
    'Product Owner',
    'Scrum Master',
    'Stakeholder'
  ]

  $scope.members = []

  $http({
    method:"GET"
    url:"/users"
  }).then( (response)->
    $scope.team = response.data.users.users
    $scope.members = _.filter response.data.users.users, (user) ->
      return _.includes user.html, "<strong>tind</strong>.io"
  , (response) ->
    console.log "Error"
    console.log response
  )

.filter 'filterEmail', () ->
  return (input) ->
    return input.split("- ")[1].split(" (")[0].replace("<strong>","").replace("</strong>","")
