angular.module 'JiraSprintTracker.sprint'
.service 'teamUtils', ($http) ->
  getGroupMembers: () ->
    return $http({
      method:"GET"
      url:"/users"
    }).then( (response)->
      return _.filter response.data.users.users, (user) ->
        return _.includes user.html, "<strong>tind</strong>.io"
    , (error) ->
      console.log "Error"
      console.log error
    )

  getTeam: () ->
    return $http({
      method: "GET"
      url: "/team/members"
    })

  getDevTeam: () ->
    return $http({
      method: "GET"
      url: "/team/members"
    }).then (data) ->
      return _.filter data.data, (member) ->
        member.role is "Developer"
    , (error) ->
      console.log error

  getRoles: () ->
    return [
      'Developer',
      'Product Owner',
      'Scrum Master',
      'Stakeholder'
    ]

  addTeamMember: (user) ->
    return $http({
      method: "POST"
      url: "/team/members/add"
      data: user
    }).then( (response) ->
      return user
    , (error) ->
      console.log error
    )

  removeTeamMember: (user) ->
    return $http({
      method: "DELETE"
      url: "/team/members/remove"
      data: user
    }).then( (response) ->
      return user
    , (error) ->
      console.log error
    )
