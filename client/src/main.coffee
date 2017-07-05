angular.module 'JiraSprintTracker', [
  'ng'
  'ngAnimate'
  'ngCookies'
  'ngSanitize'
  'ui.router'
  'ui.bootstrap'
  'JiraSprintTracker.home'
  'JiraSprintTracker.bdc'
  'JiraSprintTracker.blog'
  'JiraSprintTracker.sprint'
  'JiraSprintTracker.stats'
  'JiraSprintTracker.template'
]

.run ($location, $rootScope, $window) ->
  $rootScope.$on '$viewContentLoaded', ->
    $window.scrollTo 0, 0

  $rootScope.applicationId = ''

.config ($urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'

.constant('_', window._)
