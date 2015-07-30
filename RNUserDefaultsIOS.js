'use strict';

var { NativeModules } = require('react-native');
var Promise = require('bluebird'); // jshint ignore:line
var UserDefaults = NativeModules.RNUserDefaultsIOS;

var _setSuiteName = Promise.promisify(UserDefaults.setUserDefaultsSuiteName);
var _setObjectForKey = Promise.promisify(UserDefaults.setObjectForKey);
var _setBoolForKey = Promise.promisify(UserDefaults.setBoolForKey);

var _arrayForKey = Promise.promisify(UserDefaults.arrayForKey);
var _stringForKey = Promise.promisify(UserDefaults.stringForKey);
var _objectForKey = Promise.promisify(UserDefaults.objectForKey);
var _boolForKey = Promise.promisify(UserDefaults.boolForKey);

var _removeItemForKey = Promise.promisify(UserDefaults.removeObjectForKey);

var UserDefaults = {
    setArrayForKey(array, key) {
        return _setObjectForKey(array, key);
    },
    setStringForKey(string, key) {
        return _setObjectForKey(string, key);
    },
    setObjectForKey(object, key) {
        return _setObjectForKey(object, key);
    },
    setBoolForKey(bool, key) {
        return _setBoolForKey(bool, key);
    },
    arrayForKey(key) {
        return _arrayForKey(key);
    },
    stringForKey(key) {
        return _stringForKey(key);
    },
    objectForKey(key) {
        return _objectForKey(key);
    },
    boolForKey(key) {
        return _boolForKey(key);
    },
    removeItemForKey(key) {
        return _removeItemForKey(key);
    },
    setSuiteName(name) {
        return _setSuiteName(name);
    },
};

module.exports = UserDefaults;
