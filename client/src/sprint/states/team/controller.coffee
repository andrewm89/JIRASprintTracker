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

  $scope.newMember = undefined

  # Get possible team members
  $http({
    method:"GET"
    url:"/users"
  }).then( (response)->
    $scope.members = _.filter response.data.users.users, (user) ->
      return _.includes user.html, "<strong>tind</strong>.io"
  , (error) ->
    console.log "Error"
    console.log error
  )

  # Get current team members
  $http({
    method: "GET"
    url: "/team/members"
  }).then( (response) ->
    $scope.team = response.data
  , (error) ->
    console.log "Error"
    console.log error
  )

  $scope.setTeamMember = (user) ->
    $http({
      method: "POST"
      url: "/team/members/add"
      data: user
    }).then( (response) ->
      $scope.team.push(user)
      console.log "Team member successfully added"
    , (error) ->
      console.log "Error"
      console.log error
    )

  $scope.removeTeamMember = (user) ->
    $http({
      method: "DELETE"
      url: "/team/members/remove"
      data: user
    }).then( (response) ->
      _.pull $scope.team, user
      console.log "Team member successfully removed"
    , (error) ->
      console.log "Error"
      console.log error
    )

.filter 'filterEmail', () ->
  return (input) ->
    return input.split("- ")[1].split(" (")[0].replace("<strong>","").replace("</strong>","")
