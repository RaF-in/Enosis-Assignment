angular.
  module('angularJsAssignment').component('moduleCComponent',{
    templateUrl : "Assignment/C.form.html",
    controller : function($scope) {
      $scope.cnt = 0;
      $scope.selectedColorName = ["","","",""];
      $scope.checkbox = [
        {
          selected: false,
          name : "Red",
          color : "red",
          id : 0,
          comma : ""
        },
        {
          selected: false,
          name : "Blue",
          color : "blue",
          id : 1,
          comma : ""
        },
        {
          selected: false,
          name : "Green",
          color : "green",
          id : 2,
          comma : ""
        }
      ];
      $scope.checkAll = function () {
        angular.forEach($scope.checkbox, function (obj) {
            obj.selected = true;
        });
      };
    
      $scope.uncheckAll = function () {
        angular.forEach($scope.checkbox, function (obj) {
            obj.selected = false;
        });
      };
    
      $scope.showSelected = function () {
          $scope.cnt = 0;
          angular.forEach($scope.checkbox, function (obj) {
            if(obj.selected == true) {
                $scope.selectedColorName[obj.id] = obj.name;
                $scope.cnt ++;
                if($scope.cnt > 1) {
                   obj.comma = ",";
                }
                else {
                  obj.comma = "";
                }

            }
            else {
                $scope.selectedColorName[obj.id] = "";
                obj.comma = "";
            }
        });
      };
    }
});