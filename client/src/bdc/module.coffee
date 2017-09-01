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
      check: ($q, authUtils) ->
        if authUtils.isLogged()
          $q.resolve({})
        else
          $q.reject
            redirectState: 'login'
