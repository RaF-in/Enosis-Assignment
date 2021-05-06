var app = angular.module("angularJsAssignment",['ngRoute']);

app.config(["$routeProvider",function($routeProvider){
    $routeProvider.
    when("/A",{
        templateUrl : "Assignment/A.html"
    }).
    when("/B",{
        templateUrl : "Assignment/B.html"
    }).
    when("/C",{
        templateUrl : "Assignment/C.html"
    }).
    when("/D",{
        templateUrl : "Assignment/D.html"
    }).
    otherwise({
        redirectTo : "index.html"
    })
}]);

app.controller("angJsAsgController",function($scope) {
    
});