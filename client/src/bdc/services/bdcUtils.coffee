angular.module 'JiraSprintTracker.bdc'
.service 'bdcUtils', ['bdcDayPlus1DayFilterFilter', (bdcDayPlus1DayFilterFilter) ->
  calculateProgress: (sprint, labels, data) ->
    if not sprint.progress
      sprint.progress = {}

    _.forEach sprint.days, (day, i) ->
      if i < sprint.days.length - 1
        labels.push bdcDayPlus1DayFilterFilter(day.date)
      else
        labels.push 'Ceremony'

      if not sprint.progress[day.date]
        sprint.progress[day.date] = {}

      if not sprint.progress[day.date].ppd
        sprint.progress[day.date].ppd = parseFloat(sprint.velocity) * parseFloat(day.total)

      if not sprint.progress[day.date].pointsComplete
        sprint.progress[day.date].pointsComplete = 0

      if not sprint.progress[day.date].theoretical
        if i is 0
          sprint.progress[day.date].theoretical = 40
        else
          sprint.progress[day.date].theoretical = sprint.progress[sprint.days[i-1].date].theoretical - sprint.progress[sprint.days[i-1].date].ppd

      if not sprint.progress[day.date].actual
        sprint.progress[day.date].actual = 0

      if not sprint.progress[day.date].diff
        sprint.progress[day.date].diff = parseInt(sprint.progress[day.date].actual - sprint.progress[day.date].theoretical)

      data[0].push(sprint.progress[day.date].theoretical)
      data[1].push(sprint.progress[day.date].actual)
]