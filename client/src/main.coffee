angular.module 'JiraSprintTracker', [
  'angularMoment'
  'ng'
  'ngAnimate'
  'ngCookies'
  'ngSanitize'
  'ui.router'
  'ui.bootstrap'
  'chart.js'
  'JiraSprintTracker.home'
  'JiraSprintTracker.bdc'
  'JiraSprintTracker.blog'
  'JiraSprintTracker.sprint'
  'JiraSprintTracker.stats'
  'JiraSprintTracker.template'
  'JiraSprintTracker.utils'
]

.run ($location, $rootScope, $window, $state) ->
  $rootScope.$on '$viewContentLoaded', ->
    $window.scrollTo 0, 0

  $rootScope.applicationId = ''

  $rootScope.$on '$stateChangeError', (evt, to, toParams, from, fromParams, error) ->
    if (error.redirectState)
      $state.go(error.redirectState)

.config ($urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'

.constant('_', window._)
