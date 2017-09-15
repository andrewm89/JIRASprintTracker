angular.module 'JiraSprintTracker.sprint'
.service 'sprintUtils', ($http) ->
  getBoards: ->
    return $http({
      method: 'GET'
      url: '/sprint/boards'
    })

  getSprints: (board_id) ->
    return $http({
      method: 'GET'
      url: '/sprint/sprints/' + board_id
    })

  getSprintFromDB: (name) ->
    return $http({
      method: 'GET'
      url: '/sprint/sprints/db/' + encodeURIComponent(name)
    })

  getSprintsFromDB: ->
    return $http({
      method: 'GET'
      url: '/sprint/sprints/db'
    })

  newSprint: (sprint) ->
    return $http({
      method: 'POST'
      url: '/sprint/sprints/new'
      data: sprint
    }).then (data) ->
      return data
    , (error) ->
      console.log error

  updateSprint: (sprint) ->
    return $http({
      method: 'PUT'
      url: '/sprint/sprints'
      data: sprint
    }).then (data) ->
      return data
    , (error) ->
      console.log error
