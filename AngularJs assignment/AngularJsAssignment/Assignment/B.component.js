angular.
  module('angularJsAssignment').component('moduleBComponent',{
    templateUrl : "Assignment/B.form.html",
    controller : function($scope) {
        $scope.message = "";
        $scope.match = function() {
            if($scope.password == $scope.rePassword) {
                $scope.message = "Password Match !!!";
            }
            else {
                $scope.message = "Password Do not Match !!!";
            }
        }
    }
});