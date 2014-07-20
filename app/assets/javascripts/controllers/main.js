app.controller('MainCtrl', ['$scope', '$rootScope', 'Post', function($scope, $rootScope, Post) {
  if ($rootScope.currentUser) {
    $scope.posts = Post.query();
  }
}]);
