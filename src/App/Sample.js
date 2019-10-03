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
