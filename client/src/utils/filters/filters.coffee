angular.module 'JiraSprintTracker.utils'
.filter 'dayFilter', (moment) ->
  return (date) ->
    return moment(date).format('dddd - DD/MM')
.filter 'bdcDayFilter', (moment) ->
  return (date) ->
    return moment(date).format('dddd')
.filter 'bdcDayPlus1DayFilter', (moment) ->
  return (date) ->
    return moment(date).add(1, 'days').format('dddd')
.filter 'bdcDayPlus1DateFilter', (moment) ->
  return (date) ->
    return moment(date).add(1, 'days').format('dddd - DD/MM')
