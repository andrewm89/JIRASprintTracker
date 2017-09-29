angular.module 'JiraSprintTracker.bdc'
.controller 'BDCMainCtrl', (
  $scope
  sprints
  bdcUtils
  sprintUtils
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

  $scope.totalPoints = undefined

  $scope.selectSprint = (name) ->
    $scope.sprint = (_.filter $scope.sprints, (sprint) ->
      sprint.name is name)[0]
    $scope.totalPoints = bdcUtils.getStartingPoints $scope.sprint
    initChart()
    bdcUtils.calculateProgress($scope.sprint, $scope.labels, $scope.data, $scope.totalPoints)
    $scope.chartReady = true
    $scope.collapseSelect()

  $scope.updateProgress = ->
    initChart()
    bdcUtils.calculateProgress($scope.sprint, $scope.labels, $scope.data, $scope.totalPoints)
    sprintUtils.updateSprint $scope.sprint
