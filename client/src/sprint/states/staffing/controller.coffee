angular.module 'JiraSprintTracker.sprint'
.controller 'SprintStaffingCtrl', (
  $scope
  $http
  devTeam
  sprints
  sprintUtils
  staffingUtils
) ->

  $scope.title = 'Sprint Staffing'

  $scope.selectCollapsed = false

  $scope.sprints = sprints.data
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
      $('#selectContainer').collapse('show');
    else
      $scope.selectCollapsed = true
      $('#selectContainer').collapse('hide');
    return

  $scope.newSprint = (name) ->
    $scope.sprint =
      name: name
      staffing: {}
    sprintUtils.newSprint($scope.sprint)
    $scope.sprints.push($scope.sprint)
    $scope.newSprintName = ""
    $scope.collapseSelect()

  $scope.selectSprint = (name) ->
    $scope.sprint = (_.filter $scope.sprints, (sprint) ->
      sprint.name == name)[0]
    $scope.collapseSelect()

  $scope.updateWorkingDays = () ->
    $scope.sprint.days = staffingUtils.workingDays $scope.sprint.startDate, $scope.sprint.endDate
    sprintUtils.updateSprint($scope.sprint)

  $scope.getRowTotal = () ->
    return 100

.filter 'dayFilter', (moment) ->
  return (date) ->
    return moment(date).format('dddd - DD/MM');
