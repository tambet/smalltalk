app.factory('Auth', ['$http', '$location', '$rootScope',
  function($http, $location, $rootScope) {
    return {
      login: function(user) {
        return $http.post('/api/v1/login', user)
          .success(function(data) {
            $rootScope.currentUser = data;
            $location.path('/');
          })
          .error(function(resp) {
          });
      },
      signup: function(user) {
        return $http.post('/api/v1/signup', user)
          .success(function() {
            $location.path('/');
          })
          .error(function(resp) {
          });
      },
      logout: function() {
        return $http.get('/api/v1/logout').success(function() {
          $rootScope.currentUser = null;
        });
      }
    };
}]);
