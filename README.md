## react-native-userdefaults-ios
React Native Module for [NSUserDefaults](https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSUserDefaults_Class/)

This library is especially helpful for hybrid apps that already make use of `[NSUserDefaults standardUserDefaults]` and would like to read or write to it from within their React components.

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

// Get a string for a given key...
UserDefaults.stringForKey('keyForMyString')
    .then(string => {
        //Do something with the returned value...
        console.log(string);
    });

// Get an array for a given key...
UserDefaults.arrayForKey('keyForMyArray')
    .then(array => {
        //Do something with the returned value...
        array.forEach(item => {
            console.log(item);
        });
    };
```

### Todos for 0.1.0 release

- [x] Implement `arrayForKey:`
- [x] Implement `stringForKey:`
- [ ] Implement `setObject:forKey:`
- [ ] Implement `objectForKey:`
- [ ] Implement `removeObjectForKey:`

### Todos for 1.0 release

- [ ] Implement `dataForKey:`
- [ ] Implement `stringArrayForKey:`
- [ ] Implement `dictionaryForKey:`
- [ ] Implement `setBool:forKey:`
- [ ] Implement `boolForKey:`
- [ ] Implement `setFloat:forKey:`
- [ ] Implement `floatForKey:`
- [ ] Implement `setInteger:forKey:`
- [ ] Implement `integerForKey:`
- [ ] Implement `setDouble:forKey:`
- [ ] Implement `doubleForKey:`
- [ ] Implement `setURL:forKey:`
- [ ] Implement `URLForKey:`
- [ ] Implement `NSUserDefaultsDidChangeNotification`
