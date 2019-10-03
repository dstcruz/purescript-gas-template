// Generated by purs bundle 0.13.3
var PS = {};
(function(exports) {
  "use strict";


  exports.getActiveSpreadsheet = function () {
    return SpreadsheetApp.getActiveSpreadsheet();
  };

  exports._getSpreadsheetName = function (sheet) {
    return sheet.getName();
  };

  exports._toast = function (sheet, msg) {
    sheet.toast(msg);
  };
})(PS["App.Sample"] = PS["App.Sample"] || {});
(function(exports) {
  "use strict";

  exports.runEffectFn1 = function runEffectFn1(fn) {
    return function(a) {
      return function() {
        return fn(a);
      };
    };
  };

  exports.runEffectFn2 = function runEffectFn2(fn) {
    return function(a) {
      return function(b) {
        return function() {
          return fn(a, b);
        };
      };
    };
  };
})(PS["Effect.Uncurried"] = PS["Effect.Uncurried"] || {});
(function($PS) {
  // Generated by purs version 0.13.3
  "use strict";
  $PS["Effect.Uncurried"] = $PS["Effect.Uncurried"] || {};
  var exports = $PS["Effect.Uncurried"];
  var $foreign = $PS["Effect.Uncurried"];
  exports["runEffectFn1"] = $foreign.runEffectFn1;
  exports["runEffectFn2"] = $foreign.runEffectFn2;
})(PS);
(function($PS) {
  // Generated by purs version 0.13.3
  "use strict";
  $PS["App.Sample"] = $PS["App.Sample"] || {};
  var exports = $PS["App.Sample"];
  var $foreign = $PS["App.Sample"];
  var Effect_Uncurried = $PS["Effect.Uncurried"];                
  var toast = Effect_Uncurried.runEffectFn2($foreign["_toast"]);
  var toastMe = function __do() {
      var v = $foreign.getActiveSpreadsheet();
      return toast(v)("Toast me!")();
  };
  var hello = function (n) {
      return "Hello " + n;
  };
  var getSpreadsheetName = Effect_Uncurried.runEffectFn1($foreign["_getSpreadsheetName"]);
  var toastSpreadsheetName = function __do() {
      var v = $foreign.getActiveSpreadsheet();
      var v1 = getSpreadsheetName(v)();
      return toast(v)(v1)();
  };
  exports["hello"] = hello;
  exports["toastMe"] = toastMe;
  exports["toastSpreadsheetName"] = toastSpreadsheetName;
})(PS);
(function($PS) {
  // Generated by purs version 0.13.3
  "use strict";
  $PS["Main"] = $PS["Main"] || {};
  var exports = $PS["Main"];
  var App_Sample = $PS["App.Sample"];                
  var toastSpreadsheetName = App_Sample.toastSpreadsheetName;
  var toastMe = App_Sample.toastMe;
  var hello = App_Sample.hello;
  exports["hello"] = hello;
  exports["toastMe"] = toastMe;
  exports["toastSpreadsheetName"] = toastSpreadsheetName;
})(PS);
module.exports = PS["Main"];
