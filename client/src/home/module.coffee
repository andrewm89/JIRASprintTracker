angular.module 'JiraSprintTracker.home', [
  'ui.router'
]

.config ($stateProvider) ->
  $stateProvider

  .state 'main',
    url: '/'
    controller: 'HomeMainCtrl'
    templateUrl: 'home/states/main/view.html'
