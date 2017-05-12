angular.module 'JiraSprintTracker.stats', [
  'ui.router'
]

.config ($stateProvider) ->
  $stateProvider

  .state 'stats',
    url: '/stats'
    controller: 'StatsMainCtrl'
    templateUrl: 'stats/states/main/view.html'
