app.controller('MainCtrl', ['$scope', '$rootScope', 'Post', 'userConfig', function($scope, $rootScope, Post, userConfig) {
  $rootScope.currentUser = userConfig;
  //$scope.posts = Post.query();
}]);
