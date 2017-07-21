angular.module 'JiraSprintTracker.sprint'
.service 'sprintUtils', ($http) ->
  getSprints: () ->
    return $http({
      method: "GET"
      url: "/staffing/sprints"
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
