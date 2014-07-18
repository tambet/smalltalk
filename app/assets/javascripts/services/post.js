app.factory('Post', ['$resource', function($resource) {
  return $resource('/api/v1/posts');
}]);
