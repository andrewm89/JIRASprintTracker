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
    resolve:
      sprints: ($stateParams, sprintUtils) ->
        sprintUtils.getSprints()
      devTeam: ($stateParams, teamUtils) ->
        teamUtils.getDevTeam()

  .state 'sprint.team',
    url: '/team'
    controller: 'SprintTeamCtrl'
    templateUrl: 'sprint/states/team/view.html'
    resolve:
      group: ($stateParams, teamUtils) ->
        teamUtils.getGroupMembers()
      roles: ($stateParams, teamUtils) ->
        teamUtils.getRoles()
      team: ($stateParams, teamUtils) ->
        teamUtils.getTeam()
