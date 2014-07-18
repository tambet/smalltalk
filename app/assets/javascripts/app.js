var app = angular.module('smalltalkApp', ['ngResource', 'ngRoute'])
  .config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
    $locationProvider.html5Mode(true);
    $routeProvider
      .when('/', {
        controller: 'MainCtr'
      })
      .when('/login', {
        controller: 'LoginCtrl',
        template: JST['templates/login']
      })
      .when('/logout', {
        resolve: {
          data: ['$location', 'Auth', function($location, Auth){
            Auth.logout();
            $location.path('/');
          }]
        }
      });
}]);

angular.element(document).ready(function() {
  $.get('api/v1/me').always(function(data, status, jqXHR) {
    app.constant('userConfig', status === 'success' && data);
    angular.bootstrap(document, ['smalltalkApp']);
  });
});
