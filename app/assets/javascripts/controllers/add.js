app.controller('AddCtrl', ['$scope', '$location', '$http', 'flash', function($scope, $location, $http, flash) {
  $scope.addPost = function() {
    var post = {
      body: $scope.body,
      heading: $scope.heading
    };
    $http.post('/api/v1/posts', post)
      .success(function() {
        $location.path('/');
      })
      .error(function(resp) {
        flash.error = resp.pop();
      });
    };
}]);
