angular.module 'JiraSprintTracker.bdc'
.service 'bdcUtils', ['$filter', 'mathsUtils', ($filter, mathsUtils) ->
  calculateProgress: (sprint, labels, data, totalPoints) ->
    if not sprint.progress
      sprint.progress = {}

    data[0].push totalPoints
    data[1].push totalPoints
    labels.push $filter('bdcDayFilter')(sprint.days[0].date)

    _.forEach sprint.days, (day, i) ->
      if i < sprint.days.length - 1
        labels.push $filter('bdcDayPlus1DayFilter')(day.date)
      else
        labels.push 'Ceremony'

      if not sprint.progress[day.date]
        sprint.progress[day.date] = {}

      # Projected progress
      sprint.progress[day.date].ppd = mathsUtils.roundToXDP(parseFloat(sprint.velocity) * parseFloat(day.total), 2)
      if i is 0
        sprint.progress[day.date].theoretical = totalPoints - sprint.progress[day.date].ppd
      else
        sprint.progress[day.date].theoretical = sprint.progress[sprint.days[i - 1].date].theoretical - \
            sprint.progress[sprint.days[i].date].ppd

      data[0].push(sprint.progress[day.date].theoretical)

      # Actual progress
      if not sprint.progress[day.date].pointsComplete
        sprint.progress[day.date].pointsComplete = ""
        sprint.progress[day.date].actual = ""
        sprint.progress[day.date].diff = ""
      else
        if i is 0
          sprint.progress[day.date].actual = totalPoints - sprint.progress[day.date].pointsComplete
        else
          sprint.progress[day.date].actual = sprint.progress[sprint.days[i - 1].date].actual - \
              sprint.progress[sprint.days[i].date].pointsComplete
        sprint.progress[day.date].diff = parseFloat(sprint.progress[day.date].actual - \
            sprint.progress[day.date].theoretical)

        data[1].push(sprint.progress[day.date].actual)

  getStartingPoints: (sprint) ->
    totalPoints = 0
    _.forEach sprint.days, (day) ->
      totalPoints += parseFloat(day.total)
    return mathsUtils.roundToXDP(totalPoints * parseFloat(sprint.velocity), 2)
]