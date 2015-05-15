'use strict';

var NativeModules = require('NativeModules');
var Promise = require('bluebird'); // jshint ignore:line
var UserDefaults = NativeModules.RNUserDefaultsIOS;

var _stringForKey = Promise.promisify(UserDefaults.stringForKey);

var UserDefaults = {
    stringForKey(key) {
        return _stringForKey(key);
    }
};

module.exports = UserDefaults;
