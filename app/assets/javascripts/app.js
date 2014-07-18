var app = angular.module('smalltalkApp', ['ngResource']);

angular.element(document).ready(function() {
  $.get('api/v1/me').always(function(data, status, jqXHR) {
    app.constant('userConfig', status === 'success' && data);
    angular.bootstrap(document, ['smalltalkApp']);
  });
});
