angular.module 'JiraSprintTracker', [
  'ng'
  'ngAnimate'
  'ngMaterial'
  'ngSanitize'
  'ui.bootstrap'
  'ui.router'
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
