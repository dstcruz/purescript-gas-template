import * as PS from './output/App.Sample';
// import * as PS from './spago-out.js';

global.HELLO = PS.hello;
global.toastMe = PS.toastMe;
global.toastSpreadsheetName = PS.toastSpreadsheetName;

global.onOpen = () => {
  SpreadsheetApp
    .getUi()
    .createMenu('FromPurescript')
    .addItem('Toast me!', 'toastMe')
    .addItem('Toast spreadsheet name', 'toastSpreadsheetName')
    .addToUi();
};
