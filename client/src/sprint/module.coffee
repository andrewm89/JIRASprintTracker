angular.module 'JiraSprintTracker.sprint', [
  'ui.router'
]

.config ($stateProvider) ->
  $stateProvider

  .state 'sprint',
    url: '/sprint'
    abstract: true
    template: '<ui-view/>'

  .state 'sprint.main',
    url: '/'
    controller: 'SprintMainCtrl'
    templateUrl: 'sprint/states/main/view.html'

  .state 'sprint.staffing',
    url: '/staffing'
    controller: 'SprintStaffingCtrl'
    templateUrl: 'sprint/states/staffing/view.html'
