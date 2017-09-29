angular.module 'JiraSprintTracker.bdc', [
  'ui.router'
]

.config ($stateProvider) ->
  $stateProvider

  .state 'bdc',
    url: '/bdc'
    controller: 'BDCMainCtrl'
    templateUrl: 'bdc/states/main/view.html'
    resolve:
      sprints: ($stateParams, sprintUtils) ->
        sprintUtils.getSprintsFromDB()
