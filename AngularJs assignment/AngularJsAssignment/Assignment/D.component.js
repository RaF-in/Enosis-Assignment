angular.
  module('angularJsAssignment').component('moduleDComponent',{
    templateUrl : "Assignment/D.form.html",
    controller : function($scope,$http) {
      $scope.val = 0;
      $scope.month = '0';
      $scope.allMonths = data;
      $scope.fetchdays = function(){
        $http.get('Assignment/monthData.json').then(function(response) {
          $scope.monthList = response.data;
        });
          $scope.val = $scope.month;
      }
    }
});