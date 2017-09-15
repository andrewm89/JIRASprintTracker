angular.module 'JiraSprintTracker.sprint'
.controller 'SprintTeamCtrl', (
  $scope
  $http
  group
  roles
  team
  teamUtils
) ->

  $scope.title = 'Team Management'

  $scope.team = team.data

  $scope.roles = roles

  $scope.members = group

  $scope.newMember = undefined

  $scope.setTeamMember = (user) ->
    teamUtils.addTeamMember(user)
    $scope.team.push user
    $scope.newMember = undefined

  $scope.removeTeamMember = (user) ->
    teamUtils.removeTeamMember(user)
    _.pull $scope.team, user

.filter 'filterEmail', ->
  return (input) ->
    return input.split('- ')[1].split(' (')[0].replace('<strong>','').replace('</strong>','')
