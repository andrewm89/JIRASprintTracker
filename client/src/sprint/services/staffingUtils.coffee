angular.module 'JiraSprintTracker.sprint'
.service 'staffingUtils', ($http) ->
  workingDays: (start, end) ->
    return unless start? and end?
    # check if start < end
    current = moment start
    endM = moment(end).add(1, 'days')
    return unless endM.isAfter current
    days = []
    while not current.isSame endM, 'day'
      day = current.isoWeekday()
      if day isnt 6 and day isnt 7
        days.push {
          date: current.format()
        }
      current.add 1, 'days'
    days
