angular.module 'JiraSprintTracker.blog', [
  'ui.router'
]

.config ($stateProvider) ->
  $stateProvider

  .state 'blog',
    url: '/blog'
    controller: 'BlogMainCtrl'
    templateUrl: 'blog/states/main/view.html'
