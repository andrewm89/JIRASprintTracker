angular.module 'JiraSprintTracker.sprint'
.controller 'SprintStaffingCtrl', (
  $scope
  $http
  devTeam
  boards
  sprintUtils
  staffingUtils
) ->

  $scope.title = 'Sprint Staffing'

  $scope.selectCollapsed = false

  $scope.boards = boards.data.values

  $scope.JIRASprints = {}
  $scope.sprints = []
  $scope.sprint = null

  $scope.devTeam = devTeam

  $scope.popup1 = {opened: false}
  $scope.popup2 = {opened: false}

  $scope.open1 = () ->
    $scope.popup1.opened = true

  $scope.open2 = () ->
    $scope.popup2.opened = true

  $scope.collapseSelect = () ->
    if $scope.selectCollapsed
      $scope.selectCollapsed = false
      $('#selectContainer').collapse('show')
    else
      $scope.selectCollapsed = true
      $('#selectContainer').collapse('hide')
    return

  $scope.newSprint = (name) ->
    $scope.sprint =
      name: name
      staffing: {}
    sprintUtils.newSprint($scope.sprint)
    $scope.sprints.push $scope.sprint

  $scope.selectBoard = (board_id) ->
    sprintUtils.getSprints(board_id)
    .then (sprints) ->
      $scope.JIRASprints = sprints.data.values
    , (error) ->
      console.log error

  $scope.selectSprint = (name) ->
    $scope.sprint = (_.filter $scope.sprints, (sprint) ->
      sprint.name == name)[0]
    if not $scope.sprint
      sprintUtils.getSprintFromDB name
      .then (response) ->
        if response.data.name
          $scope.sprint = response.data
          $scope.sprints.push $scope.sprint
        else
          $scope.newSprint name
      , (error) ->
        console.log error
    $scope.collapseSelect()

  $scope.updateWorkingDays = () ->
    newDays = staffingUtils.workingDays $scope.sprint.startDate, $scope.sprint.endDate
    if not $scope.sprint.days
      $scope.sprint.days = newDays
    else
      _.merge $scope.sprint.days, newDays
    _.forEach $scope.sprint.days, (day) ->
      if 'members' not in day
        members = {}
        _.forEach devTeam, (member) ->
          members[member.key] = "0"
        day.members = members
        day.total = "0"

    sprintUtils.updateSprint($scope.sprint)

  $scope.updateStaffing = () ->
    _.forEach $scope.sprint.days, (day) ->
      total = 0
      _.forEach day.members, (member) ->
        total += parseFloat member
      day.total = String total

    sprintUtils.updateSprint($scope.sprint)

.filter 'dayFilter', (moment) ->
  return (date) ->
    return moment(date).format('dddd - DD/MM')
