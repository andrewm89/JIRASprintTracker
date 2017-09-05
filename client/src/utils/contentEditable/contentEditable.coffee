angular.module 'JiraSprintTracker.utils', ['ngSanitize']
.directive('contenteditable', ['$sce', ($sce) ->
  restrict: 'A',
  require: '?ngModel',
  link: (scope, element, attrs, ngModel) ->
    if not ngModel
      return

    ngModel.$render = () ->
      element.html $sce.getTrustedHtml(ngModel.$viewValue or '')
      read()

    element.on 'blur keyup change', () ->
      scope.$evalAsync read

    read = () ->
      html = element.html()
      if attrs.stripBr and html is '<br>'
        html = ''
      ngModel.$setViewValue html
])
