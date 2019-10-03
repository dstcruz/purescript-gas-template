"use strict";

// See https://developers.google.com/apps-script/reference/spreadsheet
// for complete list of available functions for interacting with
// Google Spreadsheets

exports.getActiveSpreadsheet = function () {
  return SpreadsheetApp.getActiveSpreadsheet();
};

exports._getSpreadsheetName = function (sheet) {
  return sheet.getName();
};

exports._toast = function (sheet, msg) {
  sheet.toast(msg);
};
