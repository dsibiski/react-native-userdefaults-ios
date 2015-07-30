## react-native-userdefaults-ios [![Build Status](https://travis-ci.org/dsibiski/react-native-userdefaults-ios.svg?branch=master)](https://travis-ci.org/dsibiski/react-native-userdefaults-ios)
React Native Module for [NSUserDefaults](https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSUserDefaults_Class/)

This library is especially helpful for hybrid apps that already make use of `[NSUserDefaults standardUserDefaults]` and would like to read or write to it from within their React components.

[![NPM](https://nodei.co/npm/react-native-userdefaults-ios.png?downloads=true&downloadRank=true&stars=true)](https://nodei.co/npm/react-native-userdefaults-ios/)

### Add it to your project

1. Run `npm install react-native-userdefaults-ios --save`
2. Open your project in XCode, right click on `Libraries` and click `Add
   Files to "Your Project Name"`.
3. Select the `RNUserDefaults.xcodeproj` file in the `node_modules/react-native-userdefaults-ios` folder and click `Add`
4. In the Xcode Project Navigator find the `RNUserDefaults.xcodproj` and add the  `Products/libRNUserDefaultsIOS.a` to `Build Phases -> Link Binary With Libraries`.
5. Follow the implementation example below...

### Example

```javascript
// Require the library...
var UserDefaults = require('react-native-userdefaults-ios');
```

#### Writing to `standardUserDefaults`
```javascript
//Set an Array...
var arr = ['1', '2', '3'];
UserDefaults.setArrayForKey(arr, 'keyForMyArray')
    .then(result => {
        console.log(result);
    });

// Set a String...
UserDefaults.setStringForKey('myString', 'keyForMyString')
    .then(result => {
        console.log(result);
    });

//Set an Object...
var obj = {
    name: 'Dave'
};
UserDefaults.setObjectForKey(obj, 'keyForMyObject')
    .then(result => {
        console.log(result);
    });

//Set a boolean value...
UserDefaults.setBoolForKey(true, 'keyForMyBool')
    .then(result => {
        console.log(result);
    });

//Remove an item (works for any type)...
UserDefaults.removeItemForKey('keyOfItemToRemove')
    .then(result => {
        console.log(result);
    });
```

#### Reading from `standardUserDefaults`
```javascript
// Get an array for a given key...
UserDefaults.arrayForKey('keyForMyArray')
    .then(array => {
        //Do something with the returned array...
        array.forEach(item => {
            console.log(item);
        });
    });

// Get a string for a given key...
UserDefaults.stringForKey('keyForMyString')
    .then(string => {
        //Do something with the returned string...
        console.log(string);
    });

// Get an object for a given key...
UserDefaults.objectForKey('keyForMyObject')
    .then(obj => {
        //Do something with the returned object...
        console.log(obj);
    });

// Get a boolean value for a given key...
UserDefaults.boolForKey('keyForMyBool')
    .then(bool => {
        //Do something with the returned boolean value...
        console.log(bool);
    });
```

#### Writing to user defined suite name
```javascript
//Set the suite name
var suiteName = 'mySuiteName';
UserDefaults.setSuiteName(suiteName);
// then start reading and writing to UserDefaults as the standardUserDefaults

// if you want to switch back to the standardUserDefaults
var suiteName = 'com.xxx.xxx'; // normally your bundle identifier
UserDefaults.setSuiteName(suiteName);
```

### Todos for 1.0 release

- [ ] Implement `dataForKey:`
- [ ] Implement `stringArrayForKey:`
- [ ] Implement `setFloat:forKey:`
- [ ] Implement `floatForKey:`
- [ ] Implement `setInteger:forKey:`
- [ ] Implement `integerForKey:`
- [ ] Implement `setDouble:forKey:`
- [ ] Implement `doubleForKey:`
- [ ] Implement `setURL:forKey:`
- [ ] Implement `URLForKey:`
- [ ] Implement `NSUserDefaultsDidChangeNotification`

### Todos for 0.1.0 release - DONE!

- [x] Implement `arrayForKey:`
- [x] Implement `stringForKey:`
- [x] Implement `setObject:forKey:`
- [x] Implement `objectForKey:`
- [x] Implement `removeObjectForKey:`
- [x] Implement `dictionaryForKey:` Note: This was taken care of with `objectForKey` since in JS an Object is a Dictionary in Obj-C
- [x] Implement `setBool:forKey:`
- [x] Implement `boolForKey:`
