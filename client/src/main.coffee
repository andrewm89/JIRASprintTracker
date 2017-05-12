angular.module 'AngularFlaskBoilerplate', [
  'ng'
  'ngAnimate'
  'ngRoute'
  'ngSanitize'
  'tmh.dynamicLocale'
  'ui.bootstrap'
  'ui.router'
  'angularMoment'
  'AngularFlaskBoilerplate.home'
  'AngularFlaskBoilerplate.template'
]

.run ($location, $rootScope, $window) ->
  $rootScope.$on '$viewContentLoaded', ->
    $window.scrollTo 0, 0

  $rootScope.applicationId = ''

.config ($urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'
