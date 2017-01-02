var app = angular.module('app', []);

/***
 FACTORIES
***/
app.factory('gatewayService', ['$http', '$q', function gatewayService($http, $q) {

  // private memebers
  var serviceEndPoint = "http://gw.zvault.io:8080/v1/payments/gateway";
  var sharedKey = "9DEEC911E76445799AACA4C84B9A8DAB";
  var serviceCode = "1010";
  var MerchantName = "Razer Internal Store";

  // interface
  var service = {
    order: {},
    newOrder: newOrder,
    queryOrder: queryOrder,
    cancelOrder: cancelOrder
  };
  return service;

  // private methods
  function signature(order) {
    var plainText = order.referenceId + order.totalAmount.toString() + serviceCode + sharedKey;
    return CryptoJS.SHA256(plainText.toLowerCase()).toString();
  }

  // public methods
  function newOrder(postData) {
    var def = $q.defer();
    var postUrl = serviceEndPoint;
    //var plainText = serviceCode + sharedKey;
    var hmac = signature(postData); //CryptoJS.SHA256(plainText.toLowerCase()).toString();
    var config = { headers : {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Signature': hmac,
          'ServiceCode': serviceCode
        }};

    console.log("Preparing...");
    //console.log(order);
    $http.post(postUrl, postData, config)
      .then(function(response) {
        service.order = response.data;
        def.resolve(response.data);
      })
      .catch(function(err) {
        def.reject("Failed to create new order");
        console.log(err);
      });

    return def.promise;
  }

  function queryOrder(transactionToken) {
    var def = $q.defer();
    var queryUrl = serviceEndPoint.concat(transactionToken);

    $http.get(queryUrl, {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Signature': signature,
          'ServiceCode': serviceCode
        }
      })
      .then(function(data) {
        service.order = data;
        def.resolve(data);
      })
      .catch(function(err) {
        def.reject("Failed to get order details");
        console.log(err);
      });

    return def.promise;
  }

  function cancelOrder(transactionToken) {
    var order = {};
    return order;
  }
}]);

/***
 CONTROLLERS
***/
app.controller('OUYAStoreController', ['gatewayService', function OUYAStoreController(gatewayService) {
  var vm = this;
  vm.order = {
    referenceId: "",
    creditType: "zGold",
    totalAmount: 100,
    paymentItems: [{
      itemCode: "23636",
      amount: 100,
      quantity: 1,
      itemTitle: "Bomb Squad",
      itemDescription: "Bomb Squad - Blow up your friends in mini-games ranging from capture-the-flag to hockey!",
      ImageUrl: "http://assets.razerzone.com/eeimages/razer_pages/23636/game-2.png"
    }],
    IpAddress: "182.23.151.172",
    callbackURL: "http://internal-ESLB-GWMerchant-752403706.us-east-1.elb.amazonaws.com:8080/v1/admin/callback",
    returnURL: "http://gw.zvault.razerzone.com:8090/Home/MerchantGateway?ServiceCode=1010",
    MerchantLogoUrl: "http://assets.razerzone.com/eeimages/razer_pages/18228/razer_cortex.png",
    customParameters: "userId=lijunhao",
    PromotionCodes: ["C100"]
  };
  vm.order.referenceId = guid();

  function guid() {
    function s4() {
      return Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1);
    }
    return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
  }

  vm.newOrder = function() {
    console.log(gatewayService);
    gatewayService.newOrder(vm.order)
      .then(function(data) {
        console.log(data);
      },
      function() {
        console.log('Service error');
    });
  };
}]);

/***
 DIRECTIVIES
***/
app.directive('jsonEdit', function() {
  return {
    restrict: 'A',
    require: 'ngModel',
    template: '<textarea ng-model="jsonEditing"></textarea>',
    replace: true,
    scope: {
      model: '=jsonEdit'
    },
    link: function(scope, element, attrs, ngModelCtrl) {

      function setEditing(value) {
        scope.jsonEditing = angular.copy(JSON2String(value));
      }

      function updateModel(value) {
        scope.model = string2JSON(value);
      }

      function setValid() {
        ngModelCtrl.$setValidity('json', true);
      }

      function setInvalid() {
        ngModelCtrl.$setValidity('json', false);
      }

      function string2JSON(text) {
        try {
          return angular.fromJson(text);
        } catch (err) {
          setInvalid();
          return text;
        }
      }

      function JSON2String(object) {
        // better than JSON.stringify(), because it formats + filters $$hashKey etc.
        // NOTE that this will remove all $-prefixed values
        return angular.toJson(object, true);
      }

      function isValidJson(model) {
        var flag = true;
        try {
          angular.fromJson(model);
        } catch (err) {
          flag = false;
        }
        return flag;
      }

      //init
      setEditing(scope.model);

      //check for changes going out
      scope.$watch('jsonEditing', function(newval, oldval) {
        if (newval != oldval) {
          if (isValidJson(newval)) {
            setValid();
            updateModel(newval);
          } else {
            setInvalid();
          }
        }
      }, true);

      //check for changes coming in
      scope.$watch('model', function(newval, oldval) {
        if (newval != oldval) {
          setEditing(newval);
        }
      }, true);

    }
  };
});

// $.getJSON('//gd.geobytes.com/GetCityDetails?callback=?', function(data) {
//   //console.log(JSON.stringify(data, null, 2));
//   document.getElementById("IpAddress").value = data.geobytesremoteip;
// });