describe 'SprintMainCtrl', ->
  beforeEach module 'JiraSprintTracker.sprint'

  $controller = null
  $scope      = null

  beforeEach inject (_$controller_) ->
    $controller = _$controller_

  beforeEach inject ($rootScope, $state, $location) ->
    @$rootScope = $rootScope
    @$state = $state
    @$location = $location

  beforeEach inject ($injector) ->
    @$httpBackend = $injector.get '$httpBackend'
    return

  beforeEach ->
    @$scope = @$rootScope.$new()
    @$controller = $controller 'SprintMainCtrl',
      $scope: @$scope
      $location: @$location

  it 'should create controller', ->
    expect(@$controller).toBeDefined()
