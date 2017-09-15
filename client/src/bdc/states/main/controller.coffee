angular.module 'JiraSprintTracker.bdc'
.controller 'BDCMainCtrl', (
  $scope
  sprints
  bdcUtils
) ->

  $scope.title = 'Burndown Chart'

  $scope.sprints = sprints.data
  $scope.sprint = {}

  initChartConfig = ->
    $scope.series = [
      'Theoretical'
      'Actual'
    ]
    $scope.colours = [
      '#333CFF'
      '#FC1616'
    ]
    $scope.options =
      scales:
        yAxes: [
          {
            id: 'y-axis',
            type: 'linear',
            display: true,
            position: 'left'
          }
        ]
      elements:
        line:
          tension: 0
          fill: false

  initChart = ->
    $scope.labels = []
    $scope.data = []
    $scope.data[0] = []
    $scope.data[1] = []

  initChartConfig()
  initChart()

  $scope.chartReady = false

  $scope.selectCollapsed = false
  $scope.collapseSelect = ->
    if $scope.selectCollapsed
      $scope.selectCollapsed = false
      $('#selectContainer').collapse('show')
    else
      $scope.selectCollapsed = true
      $('#selectContainer').collapse('hide')
    return

  $scope.selectSprint = (name) ->
    $scope.sprint = (_.filter $scope.sprints, (sprint) ->
      sprint.name is name)[0]
    initChart()
    bdcUtils.calculateProgress($scope.sprint, $scope.labels, $scope.data)
    console.log $scope.sprint.progress
    $scope.chartReady = true
    $scope.collapseSelect()

#  $scope.updateSprint = () ->
#    sprintUtils.updateSprint($scope.sprint)
