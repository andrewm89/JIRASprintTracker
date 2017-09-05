angular.module 'JiraSprintTracker.sprint'
.service 'sprintUtils', ($http) ->
  getBoards: () ->
    return $http({
      method: "GET"
      url: "/staffing/boards"
    })

  getSprints: (board_id) ->
    return $http({
      method: "GET"
      url: "/staffing/sprints/" + board_id
    })

  getSprintFromDB: (name) ->
    return $http({
      method: "GET"
      url: "/staffing/sprints/db/" + encodeURIComponent(name)
    })

  newSprint: (sprint) ->
    return $http({
      method: "POST"
      url: "/staffing/sprints/new"
      data: sprint
    }).then (data) ->
      return data
    , (error) ->
      console.log error

  updateSprint: (sprint) ->
    return $http({
      method: "PUT"
      url: "/staffing/sprints"
      data: sprint
    }).then (data) ->
      return data
    , (error) ->
      console.log error
