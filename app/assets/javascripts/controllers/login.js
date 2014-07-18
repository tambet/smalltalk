app.controller('LoginCtrl', ['$scope', 'Auth', function($scope, Auth) {
  alert('Tere');
  $scope.login = function() {
    Auth.login({
      email: $scope.email,
      password: $scope.password
    });
  };
}]);
