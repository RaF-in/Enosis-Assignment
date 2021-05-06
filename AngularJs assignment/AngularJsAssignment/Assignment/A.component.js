angular.
  module('angularJsAssignment').component('moduleAComponent',{
    templateUrl : "Assignment/A.form.html",
    controller : function($scope) {
        $scope.result = "";
        $scope.choice = "true";
        $scope.verify = function() {
            if($scope.choice == "true") {
                if($scope.firstNumber < $scope.secondNumber && $scope.secondNumber < $scope.thirdNumber) {
                    $scope.result = "Strictly increasing";
                }
                else {
                    $scope.result = "Results are not increasing";
                }
            }

            else {
                if($scope.firstNumber > $scope.secondNumber && $scope.secondNumber > $scope.thirdNumber) {
                    $scope.result = "Strictly decreasing";
                }
                else {
                    $scope.result = "Results are not decreasing";
                }
            }
        }
    }
});