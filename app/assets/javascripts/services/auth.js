app.factory('Auth', ['$http', '$location', '$rootScope', 'flash',
  function($http, $location, $rootScope, flash) {
    return {
      login: function(user) {
        var encoded = window.btoa(user.email + ':' + user.password);
        $http.defaults.headers.common.Authorization = 'Basic ' + encoded;

        return $http.post('/api/v1/login')
          .success(function(data) {
            $rootScope.currentUser = data;
            $location.path('/');
          })
          .error(function(resp) {
            flash.error = 'Invalid email or password';
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