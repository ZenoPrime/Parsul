const admin = require("firebase-admin/app");
admin.initializeApp();

const solanaPay = require("./solana_pay.js");
exports.solanaPay = solanaPay.solanaPay;
