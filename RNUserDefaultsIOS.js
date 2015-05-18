'use strict';

var NativeModules = require('NativeModules');
var Promise = require('bluebird'); // jshint ignore:line
var UserDefaults = NativeModules.RNUserDefaultsIOS;

var _arrayForKey = Promise.promisify(UserDefaults.arrayForKey);
var _stringForKey = Promise.promisify(UserDefaults.stringForKey);

var UserDefaults = {
    arrayForKey(key) {
        return _arrayForKey(key);
    },
    stringForKey(key) {
        return _stringForKey(key);
    }
};

module.exports = UserDefaults;
