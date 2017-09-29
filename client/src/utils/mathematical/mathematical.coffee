angular.module 'JiraSprintTracker.utils'
.service 'mathsUtils', ->
  roundToXDP: (number, x) ->
    factor = x * x
    return Math.round(number * factor) / factor
