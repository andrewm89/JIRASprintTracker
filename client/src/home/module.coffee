angular.module 'JiraSprintTracker.home', [
  'ui.router'
]

.config ($stateProvider) ->
  $stateProvider

  .state 'main',
    url: '/'
    controller: 'HomeMainCtrl'
    templateUrl: 'home/states/main/view.html'
    resolve:
      check: ($q, authUtils) ->
        if authUtils.isLogged()
          $q.resolve({})
        else
          $q.reject
            redirectState: 'login'

  .state 'login',
    url: '/login'
    controller: 'LoginCtrl'
    templateUrl: 'home/states/login/view.html'
