var app = angular.module('smalltalkApp', ['ngResource', 'ngRoute', 'angular-flash.service', 'angular-flash.flash-alert-directive'])
  .config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
    $locationProvider.html5Mode(true);
    $routeProvider
      .when('/', {
        controller: 'MainCtrl',
        template: JST['templates/main']
      })
      .when('/add', {
        controller: 'AddCtrl',
        template: JST['templates/add']
      })
      .when('/login', {
        controller: 'LoginCtrl',
        template: JST['templates/login']
      })
      .when('/signup', {
        controller: 'SignupCtrl',
        template: JST['templates/signup']
      })
      .when('/delete/:id', {
        resolve: {
          data: ['$location', '$route', 'Post', function($location, $route, Post){
            Post.delete($route.current.params);
            $location.path('/');
          }]
        }
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
    app.run(function($rootScope) {
      $rootScope.currentUser = (status === 'success' && data);
    })
    angular.bootstrap(document, ['smalltalkApp']);
  });
});
