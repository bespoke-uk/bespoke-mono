### Run React Native Example Apps on Android and iOS

Source: https://reactnative.dev/docs/0.78/legacy/native-modules-setup

Starts the example React Native applications on Android and iOS platforms respectively. Execute 'yarn example android' for Android emulator/device or 'yarn example ios' for iOS simulator/device. These commands build and deploy the example app to test the native module functionality.

```shell
# Android app
yarn example android
# iOS app
yarn example ios
```

--------------------------------

### Initialize New React Native Project with Community CLI

Source: https://reactnative.dev/docs/0.77/getting-started-without-a-framework

Create a new React Native project named 'AwesomeProject' using the React Native Community CLI. This command generates the project structure and installs necessary dependencies.

```shell
npx @react-native-community/cli@latest init AwesomeProject
```

--------------------------------

### AppState Usage Example

Source: https://reactnative.dev/docs/0.78/appstate

Complete example demonstrating how to use AppState to monitor app state changes, detect when app comes to foreground, and handle cleanup. Shows proper subscription management with event listener setup and removal.

```APIDOC
## AppState Usage Example

### Description
Complete working example showing how to monitor app state changes using AppState event listeners, detect foreground transitions, and properly manage subscriptions.

### Code Implementation
```
import React, {useRef, useState, useEffect} from 'react';
import {AppState, StyleSheet, Text} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const AppStateExample = () => {
  const appState = useRef(AppState.currentState);
  const [appStateVisible, setAppStateVisible] = useState(appState.current);

  useEffect(() => {
    const subscription = AppState.addEventListener('change', nextAppState => {
      if (
        appState.current.match(/inactive|background/) &&
        nextAppState === 'active'
      ) {
        console.log('App has come to the foreground!');
      }

      appState.current = nextAppState;
      setAppStateVisible(appState.current);
      console.log('AppState', appState.current);
    });

    return () => {
      subscription.remove();
    };
  }, []);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Text>Current state is: {appStateVisible}</Text>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});

export default AppStateExample;
```

### Key Points
- Use useRef to store previous app state
- Use useState to trigger UI updates when state changes
- Use useEffect with empty dependency array to set up listener on mount
- Always clean up by calling subscription.remove() in return function
- Check for transition from background/inactive to active to detect foreground
```

--------------------------------

### DrawerLayoutAndroid Component Example

Source: https://reactnative.dev/docs/0.79/drawerlayoutandroid

A practical example demonstrating how to use the DrawerLayoutAndroid component with navigation content and main view content. Shows proper setup of the component with required and optional props.

```APIDOC
## DrawerLayoutAndroid Component Usage Example

### Description
Complete example of implementing a DrawerLayoutAndroid component with navigation view and main content.

### Basic Implementation

#### TypeScript Example
```typescript
import React, { useRef } from 'react';
import {
  DrawerLayoutAndroid,
  Text,
  View,
  TouchableOpacity,
} from 'react-native';

const MyDrawerLayout = () => {
  const drawer = useRef<DrawerLayoutAndroid>(null);

  const navigationView = (
    <View style={{ flex: 1, backgroundColor: '#fff' }}>
      <Text>Drawer Content</Text>
      <TouchableOpacity onPress={() => drawer.current?.closeDrawer()}>
        <Text>Close Drawer</Text>
      </TouchableOpacity>
    </View>
  );

  return (
    <DrawerLayoutAndroid
      ref={drawer}
      drawerWidth={300}
      drawerPosition="left"
      renderNavigationView={() => navigationView}
      drawerBackgroundColor="rgba(0,0,0,0.5)"
    >
      <View style={{ flex: 1 }}>
        <Text>Main Content</Text>
        <TouchableOpacity onPress={() => drawer.current?.openDrawer()}>
          <Text>Open Drawer</Text>
        </TouchableOpacity>
      </View>
    </DrawerLayoutAndroid>
  );
};

export default MyDrawerLayout;
```

### Key Implementation Points

1. **Ref Usage**: Use `useRef` to get a reference to the DrawerLayoutAndroid component for programmatic control
2. **renderNavigationView**: Pass a function that returns the drawer content (navigation view)
3. **Direct Children**: The direct children of DrawerLayoutAndroid are the main view content
4. **Drawer Width**: Customize drawer width with the `drawerWidth` prop
5. **Position**: Choose drawer position with `drawerPosition` ('left' or 'right')
6. **Background**: Set drawer background color, optionally with rgba for transparency
```

--------------------------------

### Install iOS Dependencies with CocoaPods

Source: https://reactnative.dev/docs/0.77/getting-started-without-a-framework

Navigate to the iOS folder and install iOS dependencies using Bundler and CocoaPods. Run these commands sequentially to resolve iOS-related issues during project setup.

```shell
cd ios
bundle install
bundle exec pod install
```

--------------------------------

### Hello World React Native Component

Source: https://reactnative.dev/docs/0.77/getting-started

A basic React Native component demonstrating a centered View with Text element. This interactive example uses flexbox styling to center content on the screen and serves as an entry point for beginners to understand component structure and styling in React Native.

```javascript
import React from 'react';
import {Text, View} from 'react-native';

const YourApp = () => {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
      }}>
      <Text>Try editing me! 🎉</Text>
    </View>
  );
};

export default YourApp;
```

--------------------------------

### Complete Shadow Implementation Example

Source: https://reactnative.dev/docs/0.81/shadow-props

A comprehensive example demonstrating how to use shadow props together to create a complete shadow effect on a View component.

```APIDOC
## Complete Shadow Example

### iOS Shadow Implementation
Use all four shadow props together for optimal cross-platform shadow effect:

```
const styles = StyleSheet.create({
  shadowedView: {
    shadowColor: "#000000",
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 8
  }
});
```

### Android Shadow Implementation (API 28+)
For Android, use shadowColor:

```
const styles = StyleSheet.create({
  shadowedView: {
    shadowColor: "#000000"
  }
});
```

### Alternative: boxShadow (iOS & Android)
```
const styles = StyleSheet.create({
  shadowedView: {
    boxShadow: "0px 4px 8px rgba(0, 0, 0, 0.3)"
  }
});
```

### Recommendation
- For straightforward shadows: Use native `shadow` props (iOS) or `shadowColor` (Android)
- For more control and cross-platform support: Use `boxShadow`
- For Android-specific alpha-mask shadows: Use `dropShadow` filter
```

--------------------------------

### Start Metro Development Server with npm

Source: https://reactnative.dev/docs/0.77/getting-started-without-a-framework

Initialize the Metro JavaScript build tool development server using npm. Metro is the bundler for React Native and must run in its own terminal during development.

```shell
npm start
```

--------------------------------

### Install iOS Dependencies with Bundler and CocoaPods

Source: https://reactnative.dev/docs/0.79/getting-started-without-a-framework

Installs iOS project dependencies using Bundler and CocoaPods. Navigate to the ios folder, install Bundler, then install iOS dependencies managed by CocoaPods. Use this troubleshooting step if encountering iOS-related issues.

```shell
cd ios && bundle install && bundle exec pod install
```

--------------------------------

### Create a New React Native Project with Expo

Source: https://reactnative.dev/docs/next/environment-setup

This command initializes a new React Native project using the Expo CLI. Expo is a recommended framework that provides a comprehensive set of tools and APIs for building and deploying React Native applications, simplifying the development process by abstracting away many native complexities. This command is executed in a terminal.

```shell
npx create-expo-app@latest

```

--------------------------------

### Start React Native HeadlessJsTaskService for Android

Source: https://reactnative.dev/docs/0.77/headless-js-android

This example illustrates how to programmatically start the `HeadlessJsTaskService` on Android, such as from a periodic task or system event. It shows how to create an `Intent`, bundle data, and launch the service, optionally as a foreground service.

```java
Intent service = new Intent(getApplicationContext(), MyTaskService.class);  
Bundle bundle = new Bundle();  
  
bundle.putString("foo", "bar");  
service.putExtras(bundle);  
  
getApplicationContext().startForegroundService(service);  
```

```kotlin
val service = Intent(applicationContext, MyTaskService::class.java)  
val bundle = Bundle()  
  
bundle.putString("foo", "bar")  
  
service.putExtras(bundle)  
  
applicationContext.startForegroundService(service)  
```

--------------------------------

### Initialize React Native Project with Specific Version

Source: https://reactnative.dev/docs/0.77/getting-started-without-a-framework

Create a new React Native project with a specific version number using the --version argument. Replace X.XX.X with your desired React Native version.

```shell
npx @react-native-community/cli@X.XX.X init AwesomeProject --version X.XX.X
```

--------------------------------

### React Native Systrace Profiling Example with UI Controls

Source: https://reactnative.dev/docs/0.77/systrace

Complete example demonstrating how to use the Systrace API to enable and disable JavaScript profiling. Shows integration with React Native UI components including buttons to start/stop profiling, with event marking using beginEvent, counterEvent, and endEvent methods. Includes styling and safe area context setup.

```javascript
import React from 'react';
import {Button, Text, View, StyleSheet, Systrace} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const enableProfiling = () => {
    Systrace.setEnabled(true); // Call setEnabled to turn on the profiling.
    Systrace.beginEvent('event_label');
    Systrace.counterEvent('event_label', 10);
  };

  const stopProfiling = () => {
    Systrace.endEvent();
  };

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Text style={[styles.header, styles.paragraph]}>
          React Native Systrace API
        </Text>
        <View style={styles.buttonsColumn}>
          <Button
            title="Capture the non-Timed JS events in EasyProfiler"
            onPress={() => enableProfiling()}
          />
          <Button
            title="Stop capturing"
            onPress={() => stopProfiling()}
            color="#FF0000"
          />
        </View>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
    padding: 8,
    gap: 16,
  },
  header: {
    fontSize: 18,
    fontWeight: 'bold',
    textAlign: 'center',
  },
  paragraph: {
    fontSize: 25,
    textAlign: 'center',
  },
  buttonsColumn: {
    gap: 16,
  },
});

export default App;
```

--------------------------------

### Install OpenJDK Zulu 17 via Homebrew

Source: https://reactnative.dev/docs/0.78/set-up-your-environment

Install Azul Zulu OpenJDK 17 distribution using Homebrew, then locate the installer package. Supports both Intel and M1 Mac architectures for optimized builds.

```shell
brew install --cask zulu@17

# Get path to where cask was installed to find the JDK installer
brew info --cask zulu@17

# ==> zulu@17: <version number>
# https://www.azul.com/downloads/
# Installed
# /opt/homebrew/Caskroom/zulu@17/<version number> (185.8MB) (note that the path is /usr/local/Caskroom on non-Apple Silicon Macs)
# Installed using the formulae.brew.sh API on 2024-06-06 at 10:00:00

# Navigate to the folder
open /opt/homebrew/Caskroom/zulu@17/<version number>
```

--------------------------------

### Install dependencies for local library linking

Source: https://reactnative.dev/docs/0.77/legacy/local-library-setup

Commands to install project dependencies after configuring local library paths in package.json. Required to establish the symlink and enable autolinking for npm and Yarn package managers.

```shell
npm install
```

```shell
yarn install
```

--------------------------------

### Start Metro Development Server with Yarn

Source: https://reactnative.dev/docs/0.77/getting-started-without-a-framework

Initialize the Metro JavaScript build tool development server using Yarn package manager. Metro is the bundler for React Native and must run in its own terminal during development.

```shell
yarn start
```

--------------------------------

### Bootstrap React Native Module Dependencies

Source: https://reactnative.dev/docs/0.78/legacy/native-modules-setup

Installs and sets up all project dependencies using Yarn package manager. This command should be executed after navigating into the newly created 'react-native-awesome-module' directory to prepare the project for development and example app execution.

```shell
yarn
```

--------------------------------

### Install dependencies and build React Native library

Source: https://reactnative.dev/docs/next/the-new-architecture/create-module-library

Installs project dependencies and prepares the library for distribution using yarn commands configured by create-react-native-library. The prepare script handles compilation and bundling of the React Native library.

```bash
yarn install
yarn prepare
```

--------------------------------

### Platform API Complete Example

Source: https://reactnative.dev/docs/next/platform

Complete example demonstrating how to use the Platform API to detect device properties including OS, version, device type, and platform-specific constants.

```APIDOC
## Platform API Complete Example

### Description
Complete working example showing how to use all Platform API properties and methods.

### Code Example
```javascript
import React from 'react';
import {Platform, StyleSheet, Text, ScrollView} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.safeArea}>
        <ScrollView contentContainerStyle={styles.container}>
          <Text>OS</Text>
          <Text style={styles.value}>{Platform.OS}</Text>
          
          <Text>OS Version</Text>
          <Text style={styles.value}>{Platform.Version}</Text>
          
          <Text>isTV</Text>
          <Text style={styles.value}>{Platform.isTV.toString()}</Text>
          
          {Platform.OS === 'ios' && (
            <>
              <Text>isPad</Text>
              <Text style={styles.value}>{Platform.isPad.toString()}</Text>
            </>
          )}
          
          <Text>Constants</Text>
          <Text style={styles.value}>
            {JSON.stringify(Platform.constants, null, 2)}
          </Text>
        </ScrollView>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  value: {
    fontWeight: '600',
    padding: 4,
    marginBottom: 8,
  },
  safeArea: {
    flex: 1,
  },
});

export default App;
```

### What This Example Does
1. Displays the current operating system (iOS or Android)
2. Shows the OS version number
3. Indicates whether the device is a TV
4. For iOS, shows whether the device is an iPad
5. Displays all platform constants as JSON

### Platform Detection Pattern
```javascript
// Conditional rendering based on platform
if (Platform.OS === 'ios') {
  // iOS-specific implementation
} else {
  // Android-specific implementation
}

// Device type detection
if (Platform.isTV) {
  // TV-specific UI
} else if (Platform.isPad) {
  // Tablet-specific UI
} else {
  // Phone UI
}
```
```

--------------------------------

### Create new Expo project with create-expo-app

Source: https://reactnative.dev/docs/0.78/environment-setup

Initialize a new React Native project using Expo's create-expo-app command. This sets up a production-grade React Native framework with built-in developer tooling, file-based routing, and native module support. Run this command in your terminal to scaffold a new Expo application.

```shell
npx create-expo-app@latest
```

--------------------------------

### Example Android Gradle Shell Command Unresponsive Exception

Source: https://reactnative.dev/docs/0.78/troubleshooting

This code block displays an example of the ShellCommandUnresponsiveException error message, which often occurs during the Android build process with tasks like installDebug. This error can be a symptom of various issues, including incompatible Gradle versions. The suggested fix is to downgrade Gradle to 1.2.3.

```text
Execution failed for task ':app:installDebug'.
  com.android.builder.testing.api.DeviceException: com.android.ddmlib.ShellCommandUnresponsiveException
```

--------------------------------

### Initialize New React Native Library with create-react-native-library

Source: https://reactnative.dev/docs/0.77/the-new-architecture/create-module-library

This command uses the `npx create-react-native-library` tool to start the interactive process of generating a new React Native library. It requires a library name and guides the user through configuration options like module type (Turbo or Legacy), platform access, and setting up a test application.

```sh
npx create-react-native-library@latest <Name of Your Library>
```

--------------------------------

### Install Ruby Gems and CocoaPods Dependencies

Source: https://reactnative.dev/docs/0.77/integration-with-existing-apps

Installs the Ruby dependencies specified in the `Gemfile` using `bundle install`, and then integrates the React Native framework into the iOS project by running `pod install`. These commands ensure all native dependencies are correctly configured and linked.

```sh
bundle install
bundle exec pod install
```

--------------------------------

### Apply React Native Gradle Plugin

Source: https://reactnative.dev/docs/0.77/react-native-gradle-plugin

Basic plugin application and configuration block setup in the android/app/build.gradle file. This is the entry point for configuring the React Native Gradle Plugin with custom settings.

```groovy
apply plugin: "com.facebook.react"

/**
 * This is the configuration block to customize your React Native Android app.
 * By default you don't need to apply any configuration, just uncomment the lines you need.
 */
react {
  // Custom configuration goes here.
}
```

--------------------------------

### Run React Native App on Android Emulator with npm

Source: https://reactnative.dev/docs/0.77/getting-started-without-a-framework

Build and launch the React Native application on an Android emulator or connected device using npm. Execute this command in a separate terminal while Metro is running.

```shell
npm run android
```

--------------------------------

### Create React Navigation starter app with Expo

Source: https://reactnative.dev/docs/0.77/navigation

Bootstrap a new React Native project with React Navigation pre-configured using Expo's create-expo-app command. This template provides a quick start for navigation setup.

```shell
npx create-expo-app@latest --template react-navigation/template
```

--------------------------------

### Configure React Native Directory Path

Source: https://reactnative.dev/docs/0.77/react-native-gradle-plugin

Specifies the folder where the react-native package is installed. Default is ../node_modules/react-native. Customize this for monorepo environments or non-standard package manager setups.

```groovy
reactNativeDir = file("../node_modules/react-native")
```

--------------------------------

### AppState Basic Usage Example

Source: https://reactnative.dev/docs/0.80/appstate

Complete React component example demonstrating how to monitor app state changes, detect when the app returns to foreground, and properly clean up event subscriptions using React hooks.

```APIDOC
## AppState Complete Example

### Description
Complete React component demonstrating AppState usage including listening for state changes, detecting foreground transitions, and proper subscription cleanup.

### Key Features
- Monitor current app state with useRef
- Listen for 'change' events
- Detect transition from background/inactive to active
- Properly clean up subscriptions
- Display current state in UI

### Code
```javascript
import React, {useRef, useState, useEffect} from 'react';
import {AppState, StyleSheet, Text} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const AppStateExample = () => {
  const appState = useRef(AppState.currentState);
  const [appStateVisible, setAppStateVisible] = useState(appState.current);

  useEffect(() => {
    const subscription = AppState.addEventListener('change', nextAppState => {
      if (
        appState.current.match(/inactive|background/) &&
        nextAppState === 'active'
      ) {
        console.log('App has come to the foreground!');
      }

      appState.current = nextAppState;
      setAppStateVisible(appState.current);
      console.log('AppState', appState.current);
    });

    return () => {
      subscription.remove();
    };
  }, []);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Text>Current state is: {appStateVisible}</Text>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});

export default AppStateExample;
```

### Important Notes
- currentState may be null momentarily at app launch
- The component will display 'active' when visible since the app only shows UI in active state
- Always clean up subscriptions in useEffect return function
- Use device testing for complete state transition testing
```

--------------------------------

### Start Headless JS Task from Android Native (Java/Kotlin)

Source: https://reactnative.dev/docs/0.78/headless-js-android

These examples demonstrate how to programmatically start the `MyTaskService` from native Android code. An `Intent` is used to specify the service, and a `Bundle` can be attached to pass data (extras) to the JavaScript task. The `startForegroundService` method is called to initiate the background task.

```java
Intent service = new Intent(getApplicationContext(), MyTaskService.class);  
Bundle bundle = new Bundle();  
  
bundle.putString("foo", "bar");  
service.putExtras(bundle);  
  
getApplicationContext().startForegroundService(service);
```

```kotlin
val service = Intent(applicationContext, MyTaskService::class.java)  
val bundle = Bundle()  
  
bundle.putString("foo", "bar")  
  
service.putExtras(bundle)  
  
applicationContext.startForegroundService(service)
```

--------------------------------

### Example JDK Home Path Output (macOS)

Source: https://reactnative.dev/docs/0.79/signed-apk-android

This is an illustrative example of the output you might receive from the `java_home` command on macOS. This path needs to be used with a `cd` command to change the current directory before running `keytool` if it's not in your system's PATH.

```shell
/Library/Java/JavaVirtualMachines/jdkX.X.X_XXX.jdk/Contents/Home
```

--------------------------------

### ToastAndroid Complete Usage Example

Source: https://reactnative.dev/docs/0.80/toastandroid

Full React Native application example demonstrating all three ToastAndroid methods with buttons to trigger different toast notifications with various configurations.

```APIDOC
## EXAMPLE Complete ToastAndroid Implementation

### Description
Complete React Native application demonstrating all ToastAndroid methods with interactive buttons.

### Code Example
```javascript
import React from 'react';
import {StyleSheet, ToastAndroid, Button, StatusBar} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const showToast = () => {
    ToastAndroid.show('A pikachu appeared nearby !', ToastAndroid.SHORT);
  };

  const showToastWithGravity = () => {
    ToastAndroid.showWithGravity(
      'All Your Base Are Belong To Us',
      ToastAndroid.SHORT,
      ToastAndroid.CENTER,
    );
  };

  const showToastWithGravityAndOffset = () => {
    ToastAndroid.showWithGravityAndOffset(
      'A wild toast appeared!',
      ToastAndroid.LONG,
      ToastAndroid.BOTTOM,
      25,
      50,
    );
  };

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Button title="Toggle Toast" onPress={() => showToast()} />
        <Button
          title="Toggle Toast With Gravity"
          onPress={() => showToastWithGravity()}
        />
        <Button
          title="Toggle Toast With Gravity & Offset"
          onPress={() => showToastWithGravityAndOffset()}
        />
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingTop: StatusBar.currentHeight,
    backgroundColor: '#888888',
    padding: 8,
  },
});

export default App;
```

### Features
- Three buttons demonstrating different toast methods
- Basic toast with SHORT duration
- Toast with CENTER gravity
- Toast with BOTTOM gravity and pixel offsets
- SafeAreaView for proper device layout handling
```

--------------------------------

### Settings Example - React Native Persistent Storage

Source: https://reactnative.dev/docs/0.77/settings

Complete example demonstrating how to use the Settings API to store and retrieve values from NSUserDefaults. The example initializes state with a stored value, provides buttons to update the stored data, and displays the current value. Uses SafeAreaView for proper layout and Settings.get()/Settings.set() for data persistence.

```javascript
import React, {useState} from 'react';
import {Button, Settings, StyleSheet, Text} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const [data, setData] = useState(() => Settings.get('data'));

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Text>Stored value:</Text>
        <Text style={styles.value}>{data}</Text>
        <Button
          onPress={() => {
            Settings.set({data: 'React'});
            setData(Settings.get('data'));
          }}
          title="Store 'React'"
        />
        <Button
          onPress={() => {
            Settings.set({data: 'Native'});
            setData(Settings.get('data'));
          }}
          title="Store 'Native'"
        />
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  value: {
    fontSize: 24,
    marginVertical: 12,
  },
});

export default App;
```

--------------------------------

### openURL()

Source: https://reactnative.dev/docs/linking

Attempts to open the given URL with any installed app. Returns a Promise that resolves on success or rejects on failure.

```APIDOC
## Function Call openURL()

### Description
Try to open the given `url` with any of the installed apps.

### Method
Function Call

### Endpoint
`static openURL(url: string): Promise<any>`

### Parameters
#### Path Parameters
_None_

#### Query Parameters
_None_

#### Request Body
- **url** (string) - Required - The URL to open (e.g., "https://example.com", "geo:lat,lon", "tel:1234567890").

### Request Example
_Not Applicable_

### Response
#### Success Response (Promise<any>)
- _No specific return value_ - The Promise resolves if the URL is successfully opened or the user confirms an open dialog.

#### Response Example
_No direct response, action is opening an app_
```

--------------------------------

### Configure React Native CLI Entrypoint File

Source: https://reactnative.dev/docs/0.77/react-native-gradle-plugin

Sets the entrypoint file for the React Native CLI, which is required for bundling and app creation. Default is ../node_modules/react-native/cli.js. Customize for monorepo or alternative package manager setups.

```groovy
cliFile = file("../node_modules/react-native/cli.js")
```

--------------------------------

### Install React Native navigation peer dependencies

Source: https://reactnative.dev/docs/next/navigation

Installs necessary peer dependencies such as `react-native-screens` and `react-native-safe-area-context` required by React Navigation. The command varies based on whether your project is Expo managed or a bare React Native setup.

```shell
npx expo install react-native-screens react-native-safe-area-context
```

```shell
npm install react-native-screens react-native-safe-area-context
```

--------------------------------

### Keyboard Module Usage Example

Source: https://reactnative.dev/docs/0.78/keyboard

Complete example demonstrating how to use the Keyboard module to listen for keyboard events, dismiss the keyboard, and track keyboard visibility status in a React Native application.

```APIDOC
## Keyboard Module - Complete Usage Example

### Description
This example demonstrates listening for keyboard show/hide events and dismissing the keyboard on text submission.

### Code Example
```javascript
import React, {useState, useEffect} from 'react';
import {Keyboard, Text, TextInput, StyleSheet} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const Example = () => {
  const [keyboardStatus, setKeyboardStatus] = useState('Keyboard Hidden');

  useEffect(() => {
    const showSubscription = Keyboard.addListener('keyboardDidShow', () => {
      setKeyboardStatus('Keyboard Shown');
    });
    const hideSubscription = Keyboard.addListener('keyboardDidHide', () => {
      setKeyboardStatus('Keyboard Hidden');
    });

    return () => {
      showSubscription.remove();
      hideSubscription.remove();
    };
  }, []);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={style.container}>
        <TextInput
          style={style.input}
          placeholder="Click here…"
          onSubmitEditing={Keyboard.dismiss}
        />
        <Text style={style.status}>{keyboardStatus}</Text>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const style = StyleSheet.create({
  container: {
    flex: 1,
    padding: 36,
  },
  input: {
    padding: 10,
    borderWidth: 0.5,
    borderRadius: 4,
  },
  status: {
    padding: 16,
    textAlign: 'center',
  },
});

export default Example;
```

### Key Features
- Listens for `keyboardDidShow` and `keyboardDidHide` events
- Updates state to track keyboard visibility
- Dismisses keyboard on text submission
- Properly cleans up listeners on component unmount
```

--------------------------------

### Configure React Native Initialization in MainApplication

Source: https://reactnative.dev/docs/0.81/integration-with-existing-apps

This code snippet demonstrates how to modify your `MainApplication` class to integrate React Native, including setting up `ReactNativeHost` and `ReactHost`, enabling new architecture, and initializing SoLoader. It provides examples for both Java and Kotlin, showing the necessary imports and method overrides.

```java
package <your-package-here>;

import android.app.Application;
import com.facebook.react.PackageList;
import com.facebook.react.ReactApplication;
import com.facebook.react.ReactHost;
import com.facebook.react.ReactNativeHost;
import com.facebook.react.ReactPackage;
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint;
import com.facebook.react.defaults.DefaultReactHost;
import com.facebook.react.defaults.DefaultReactNativeHost;
import com.facebook.soloader.SoLoader;
import com.facebook.react.soloader.OpenSourceMergedSoMapping;
import java.util.List;

class MainApplication extends Application implements ReactApplication {
 @Override
 public ReactNativeHost getReactNativeHost() {
   return new DefaultReactNativeHost(this) {
     @Override
     protected List<ReactPackage> getPackages() { return new PackageList(this).getPackages(); }
     @Override
     protected String getJSMainModuleName() { return "index"; }
     @Override
     public boolean getUseDeveloperSupport() { return BuildConfig.DEBUG; }
     @Override
     protected boolean isNewArchEnabled() { return BuildConfig.IS_NEW_ARCHITECTURE_ENABLED; }
     @Override
     protected Boolean isHermesEnabled() { return BuildConfig.IS_HERMES_ENABLED; }
   };
 }

 @Override
 public ReactHost getReactHost() {
   return DefaultReactHost.getDefaultReactHost(getApplicationContext(), getReactNativeHost());
 }

  @Override
  public void onCreate() {
    super.onCreate();
   SoLoader.init(this, OpenSourceMergedSoMapping);
   if (BuildConfig.IS_NEW_ARCHITECTURE_ENABLED) {
     DefaultNewArchitectureEntryPoint.load();
   }
  }
}
```

```kotlin
package <your-package-here>
  
import android.app.Application
import com.facebook.react.PackageList
import com.facebook.react.ReactApplication
import com.facebook.react.ReactHost
import com.facebook.react.ReactNativeHost
import com.facebook.react.ReactPackage
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint.load
import com.facebook.react.defaults.DefaultReactHost.getDefaultReactHost
import com.facebook.react.defaults.DefaultReactNativeHost
import com.facebook.soloader.SoLoader
import com.facebook.react.soloader.OpenSourceMergedSoMapping
  
class MainApplication : Application(), ReactApplication {
  
 override val reactNativeHost: ReactNativeHost =
      object : DefaultReactNativeHost(this) {
        override fun getPackages(): List<ReactPackage> = PackageList(this).packages
        override fun getJSMainModuleName(): String = "index"
        override fun getUseDeveloperSupport(): Boolean = BuildConfig.DEBUG
        override val isNewArchEnabled: Boolean = BuildConfig.IS_NEW_ARCHITECTURE_ENABLED
        override val isHermesEnabled: Boolean = BuildConfig.IS_HERMES_ENABLED
      }
  
 override val reactHost: ReactHost
   get() = getDefaultReactHost(applicationContext, reactNativeHost)
  
  override fun onCreate() {
    super.onCreate()
   SoLoader.init(this, OpenSourceMergedSoMapping)
   if (BuildConfig.IS_NEW_ARCHITECTURE_ENABLED) {
     load()
   }
  }
}
```

--------------------------------

### Transform and TransformOrigin Implementation Example

Source: https://reactnative.dev/docs/0.80/transforms

Complete example demonstrating the use of transform and transformOrigin properties with animated rotations in React Native. Shows how to create a spinning animation using Animated API.

```APIDOC
## Animated Transform Example

### Description
This example demonstrates how to use the `transform` property with the `Animated` API to create a continuous rotation animation. The `transformOrigin` property is set to 'top' to rotate the view around its top edge.

### Implementation

### Imports
```javascript
import React, {useEffect, useRef} from 'react';
import {Animated, View, StyleSheet, Easing} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';
```

### Setup
1. Create an animated value using `useRef` and `Animated.Value`
2. Use `useEffect` to set up an animation loop with `Animated.timing`
3. Interpolate the animated value to a rotation string
4. Apply the rotation transform to an `Animated.View`

### Key Code Sections

#### Animation Setup
```javascript
const rotateAnim = useRef(new Animated.Value(0)).current;

useEffect(() => {
  Animated.loop(
    Animated.timing(rotateAnim, {
      toValue: 1,
      duration: 5000,
      easing: Easing.linear,
      useNativeDriver: true,
    }),
  ).start();
}, [rotateAnim]);
```

#### Value Interpolation
```javascript
const spin = rotateAnim.interpolate({
  inputRange: [0, 1],
  outputRange: ['0deg', '360deg'],
});
```

#### Applying Transform
```javascript
<Animated.View
  style={[
    styles.transformOriginView,
    {
      transform: [{rotate: spin}],
    },
  ]}
/>
```

#### Styling
```javascript
const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  transformOriginWrapper: {
    borderWidth: 1,
    borderColor: 'rgba(0, 0, 0, 0.5)',
  },
  transformOriginView: {
    backgroundColor: 'pink',
    width: 100,
    height: 100,
    transformOrigin: 'top',
  },
});
```

### Result
A pink square that rotates 360 degrees continuously over 5 seconds, rotating around its top edge rather than its center.
```

--------------------------------

### Start Android Foreground Service with Network Information (Kotlin)

Source: https://reactnative.dev/docs/0.77/headless-js-android

This code snippet demonstrates how to start an Android foreground service, passing network connectivity information as an extra. It first checks network availability using a helper function, then creates an Intent for the specified service, adds the 'hasInternet' status as an extra, and starts the service. Finally, it acquires a wake lock to ensure the background task completes, which is critical for long-running operations.

```kotlin
val hasInternet = isNetworkAvailable(context)
val serviceIntent = Intent(context, MyTaskService::class.java)
serviceIntent.putExtra("hasInternet", hasInternet)
context.startForegroundService(serviceIntent)
HeadlessJsTaskService.acquireWakeLockNow(context)
```

--------------------------------

### Install NPM Dependencies with npm

Source: https://reactnative.dev/docs/0.78/integration-with-existing-apps

Installs all JavaScript dependencies defined in package.json by running npm install from the root directory. Creates a node_modules folder containing all required packages for building the React Native project.

```shell
npm install
```

--------------------------------

### ActionSheetIOS Usage Example

Source: https://reactnative.dev/docs/0.79/actionsheetios

Complete working example demonstrating ActionSheetIOS implementation with state management, button handling, and UI styling for displaying and managing an action sheet.

```APIDOC
## ActionSheetIOS Complete Example

### Description
Full React Native application example showing how to implement ActionSheetIOS with state management and event handling.

### Implementation
```javascript
import React, { useState } from 'react';
import { ActionSheetIOS, Button, StyleSheet, Text } from 'react-native';
import { SafeAreaView, SafeAreaProvider } from 'react-native-safe-area-context';

const App = () => {
  const [result, setResult] = useState('🔮');

  const onPress = () =>
    ActionSheetIOS.showActionSheetWithOptions(
      {
        options: ['Cancel', 'Generate number', 'Reset'],
        destructiveButtonIndex: 2,
        cancelButtonIndex: 0,
        userInterfaceStyle: 'dark',
      },
      buttonIndex => {
        if (buttonIndex === 0) {
          // cancel action - do nothing
        } else if (buttonIndex === 1) {
          // Generate random number
          setResult(String(Math.floor(Math.random() * 100) + 1));
        } else if (buttonIndex === 2) {
          // Reset to original state
          setResult('🔮');
        }
      },
    );

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Text style={styles.result}>{result}</Text>
        <Button onPress={onPress} title="Show Action Sheet" />
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
  },
  result: {
    fontSize: 64,
    textAlign: 'center',
  },
});

export default App;
```

### Key Features
- State management with `useState` hook
- ActionSheetIOS display with three button options
- Button index handling for different actions
- Destructive button styling (Reset button)
- Safe area view for proper layout
- Dark mode UI style support
```

--------------------------------

### Setup ReactViewController with React Native Factory in Objective-C

Source: https://reactnative.dev/docs/0.78/integration-with-existing-apps

Initializes a React Native factory and configures the ReactViewController to display React Native components. Imports necessary React framework headers and sets up the factory delegate with app dependency provider. Handles bundle URL resolution for both debug and release builds.

```Objective-C
#import "ReactViewController.h"
#import <React/RCTBundleURLProvider.h>
#import <RCTReactNativeFactory.h>
#import <RCTDefaultReactNativeFactoryDelegate.h>
#import <RCTAppDependencyProvider.h>

@interface ReactViewController ()

@end

@interface ReactNativeFactoryDelegate: RCTDefaultReactNativeFactoryDelegate
@end

@implementation ReactViewController {
  RCTReactNativeFactory *_factory;
  id<RCTReactNativeFactoryDelegate> _factoryDelegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _factoryDelegate = [ReactNativeFactoryDelegate new];
    _factoryDelegate.dependencyProvider = [RCTAppDependencyProvider new];
    _factory = [[RCTReactNativeFactory alloc] initWithDelegate:_factoryDelegate];
    self.view = [_factory.rootViewFactory viewWithModuleName:@"HelloWorld"];
}

@end

@implementation ReactNativeFactoryDelegate

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
  return [self bundleURL];
}

- (NSURL *)bundleURL
{
#if DEBUG
  return [RCTBundleURLProvider.sharedSettings jsBundleURLForBundleRoot:@"index"];
#else
  return [NSBundle.mainBundle URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
```

--------------------------------

### FlatList with ItemSeparator and renderItem example

Source: https://reactnative.dev/docs/flatlist

Complete example demonstrating FlatList usage with ItemSeparatorComponent, data array, and renderItem function. Shows how to use separators for highlighting items and handle touch interactions with TouchableHighlight.

```typescript
<FlatList
  ItemSeparatorComponent={
    Platform.OS !== 'android' &&
    (({highlighted}) => (
      <View
        style={[style.separator, highlighted && {marginLeft: 0}]}
      />
    ))
  }
  data={[{title: 'Title Text', key: 'item1'}]}
  renderItem={({item, index, separators}) => (
    <TouchableHighlight
      key={item.key}
      onPress={() => this._onPress(item)}
      onShowUnderlay={separators.highlight}
      onHideUnderlay={separators.unhighlight}>
      <View style={{backgroundColor: 'white'}}>
        <Text>{item.title}</Text>
      </View>
    </TouchableHighlight>
  )}
/>
```

--------------------------------

### Initialize React Native Project for Turbo Modules

Source: https://reactnative.dev/docs/0.77/turbo-native-modules-introduction_language=typescript&platforms=ios

This shell command initializes a new React Native project named `TurboModuleExample`, specifically targeting version `0.76.0`. This setup is crucial for developing Turbo Native Modules and ensures compatibility with the Codegen toolchain discussed in the guide.

```shell
npx @react-native-community/cli@latest init TurboModuleExample --version 0.76.0
```

--------------------------------

### openSettings()

Source: https://reactnative.dev/docs/linking

Opens the device's Settings app, specifically displaying the app's custom settings if available. Returns a Promise.

```APIDOC
## Function Call openSettings()

### Description
Open the Settings app and displays the app’s custom settings, if it has any.

### Method
Function Call

### Endpoint
`static openSettings(): Promise<void>`

### Parameters
#### Path Parameters
_None_

#### Query Parameters
_None_

#### Request Body
_None_

### Request Example
_Not Applicable_

### Response
#### Success Response (Promise<void>)
- _No specific return value_ - The Promise resolves when the settings app is opened.

#### Response Example
_No direct response, action is opening an app_
```

--------------------------------

### Run React Native App on Android Emulator with Yarn

Source: https://reactnative.dev/docs/0.77/getting-started-without-a-framework

Build and launch the React Native application on an Android emulator or connected device using Yarn. Execute this command in a separate terminal while Metro is running.

```shell
yarn android
```

--------------------------------

### runApplication() Method

Source: https://reactnative.dev/docs/0.77/appregistry

Loads the JavaScript bundle and executes the React Native application. This is typically called to start the main application with the specified app key and parameters.

```APIDOC
## runApplication()

### Description
Loads the JavaScript bundle and runs the app.

### Method
static

### Signature
```typescript
static runApplication(appKey: string, appParameters: any): void;
```

### Parameters
#### Required Parameters
- **appKey** (string) - The key identifier for the registered application to run
- **appParameters** (any) - Configuration parameters to pass to the application

### Return Value
void
```

--------------------------------

### TouchableOpacity Basic Usage Example

Source: https://reactnative.dev/docs/0.81/touchableopacity

This example demonstrates a basic TouchableOpacity implementation with a counter that increments on button press. It shows how to use the component with styling and event handlers.

```APIDOC
# TouchableOpacity Basic Example

## Description
A functional component demonstrating TouchableOpacity usage with state management and styling.

## Code Example

```javascript
import React, {useState} from 'react';
import {StyleSheet, Text, TouchableOpacity, View} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const [count, setCount] = useState(0);
  const onPress = () => setCount(prevCount => prevCount + 1);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <View style={styles.countContainer}>
          <Text>Count: {count}</Text>
        </View>
        <TouchableOpacity style={styles.button} onPress={onPress}>
          <Text>Press Here</Text>
        </TouchableOpacity>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: 10,
  },
  button: {
    alignItems: 'center',
    backgroundColor: '#DDDDDD',
    padding: 10,
  },
  countContainer: {
    alignItems: 'center',
    padding: 10,
  },
});

export default App;
```

## Component Breakdown

**State Management**
- Uses `useState` hook to maintain counter state
- Counter increments on each button press

**TouchableOpacity Configuration**
- `onPress={onPress}` - Callback handler for touch events
- `style={styles.button}` - Custom styling applied to the button
- Children components display button text

**Styling Applied**
- `button`: Centered alignment, light gray background, padding
- `countContainer`: Centered display of current count
- `container`: Flex layout with centered content

**Output Behavior**
- Button opacity decreases on press (default activeOpacity: 0.2)
- Visual dimming provides tactile feedback
- Counter value updates on each press
```

--------------------------------

### Create New Expo App with TypeScript Template

Source: https://reactnative.dev/docs/0.81/typescript

This command initializes a new React Native project using Expo CLI, designed to start with TypeScript support. It simplifies the setup process by providing a pre-configured TypeScript environment.

```shell
npx create-expo-app --template  
```

--------------------------------

### Reference iOS AppDelegate Default Structure (Objective-C, Swift)

Source: https://reactnative.dev/docs/0.77/integration-with-existing-apps

These code examples illustrate the standard `AppDelegate` implementation for an iOS application, presented in both Objective-C and Swift. They show how `UIWindow` and a root `ViewController` are initialized, providing a baseline understanding before applying React Native-specific modifications.

```objectivec
#import "AppDelegate.h"  
#import "ViewController.h"  
  
@interface AppDelegate ()  
  
@end  
  
@implementation AppDelegate {  
  UIWindow *window;  
}  
  
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {  
  window = [UIWindow new];  
  window.rootViewController = [ViewController new];  
  [window makeKeyAndVisible];  
  return YES;  
}  
  
@end  
```

```swift
import UIKit  
  
@main  
class AppDelegate: UIResponder, UIApplicationDelegate {  
  
  var window: UIWindow?  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchKey: Any]?) -> Bool {  
    // Override point for customization after application launch.  
    window = UIWindow()  
    window?.rootViewController = ViewController()  
    window?.makeKeyAndVisible()  
    return true  
  }
}  
```

--------------------------------

### useMemo dependency update example with Fast Refresh

Source: https://reactnative.dev/docs/0.77/fast-refresh

Demonstrates how useMemo re-runs during Fast Refresh even when dependencies haven't changed. When editing the computation function from x * 2 to x * 10, Fast Refresh forces re-execution to reflect changes on screen, ignoring the dependency list.

```javascript
// Before edit
useMemo(() => x * 2, [x])

// After edit - will re-run during Fast Refresh
useMemo(() => x * 10, [x])
```

--------------------------------

### Systrace Complete Example

Source: https://reactnative.dev/docs/0.78/systrace

A complete React Native example demonstrating how to use the Systrace API with buttons to enable and disable profiling, including synchronous and counter events.

```APIDOC
## Complete Systrace Example

### Description
A full React Native application example showing how to use the Systrace API with UI controls to start and stop profiling.

### Example Implementation
```javascript
import React from 'react';
import {Button, Text, View, StyleSheet, Systrace} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const enableProfiling = () => {
    Systrace.setEnabled(true);
    Systrace.beginEvent('event_label');
    Systrace.counterEvent('event_label', 10);
  };

  const stopProfiling = () => {
    Systrace.endEvent();
  };

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Text style={[styles.header, styles.paragraph]}>
          React Native Systrace API
        </Text>
        <View style={styles.buttonsColumn}>
          <Button
            title="Capture the non-Timed JS events in EasyProfiler"
            onPress={() => enableProfiling()}
          />
          <Button
            title="Stop capturing"
            onPress={() => stopProfiling()}
            color="#FF0000"
          />
        </View>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
    padding: 8,
    gap: 16,
  },
  header: {
    fontSize: 18,
    fontWeight: 'bold',
    textAlign: 'center',
  },
  paragraph: {
    fontSize: 25,
    textAlign: 'center',
  },
  buttonsColumn: {
    gap: 16,
  },
});

export default App;
```

### Key Features
- Calls `setEnabled(true)` to activate profiling
- Uses `beginEvent()` to mark profiling start
- Registers a counter with `counterEvent()`
- Calls `endEvent()` to complete the profile measurement
- Provides UI buttons to control profiling state
```

--------------------------------

### canOpenURL()

Source: https://reactnative.dev/docs/linking

Determines whether an installed app can handle a given URL, returning a Promise that resolves to a boolean.

```APIDOC
## Function Call canOpenURL()

### Description
Determine whether or not an installed app can handle a given URL.

### Method
Function Call

### Endpoint
`static canOpenURL(url: string): Promise<boolean>`

### Parameters
#### Path Parameters
_None_

#### Query Parameters
_None_

#### Request Body
- **url** (string) - Required - The URL to check if it can be opened.

### Request Example
_Not Applicable_

### Response
#### Success Response (Promise<boolean>)
- **canOpen** (boolean) - `true` if the URL can be opened by an installed app, `false` otherwise.

#### Response Example
`true`
```

--------------------------------

### Handle ShellCommandUnresponsiveException by downgrading Gradle

Source: https://reactnative.dev/docs/0.77/troubleshooting

Resolve ShellCommandUnresponsiveException errors during Android app installation by downgrading Gradle version to 1.2.3 in the android/build.gradle configuration file.

```gradle
// In android/build.gradle
// Downgrade to Gradle version 1.2.3
```

--------------------------------

### Install Node and Watchman via Homebrew

Source: https://reactnative.dev/docs/0.77/set-up-your-environment

Installs Node.js and Watchman package manager dependencies using Homebrew. Node should be version 18.18 or newer, and Watchman is a Facebook tool for monitoring filesystem changes to improve development performance. Run these commands in a Terminal after Homebrew installation.

```shell
brew install node
brew install watchman
```

--------------------------------

### PixelRatio Complete Example

Source: https://reactnative.dev/docs/0.80/pixelratio

A comprehensive React Native example demonstrating all PixelRatio methods in action, including displaying device pixel ratio, font scale, and properly sized images with pixel-aware dimensions.

```APIDOC
## Complete PixelRatio Example

### Description
Full example application showing how to use all PixelRatio methods to display device information and properly scale images.

### Code Example
```javascript
import React from 'react';
import {
  Image,
  PixelRatio,
  ScrollView,
  StyleSheet,
  Text,
  View,
} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const size = 50;
const cat = {
  uri: 'https://reactnative.dev/docs/assets/p_cat1.png',
  width: size,
  height: size,
};

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <ScrollView style={styles.scrollContainer}>
        <View style={styles.container}>
          <Text>Current Pixel Ratio is:</Text>
          <Text style={styles.value}>{PixelRatio.get()}</Text>
        </View>
        <View style={styles.container}>
          <Text>Current Font Scale is:</Text>
          <Text style={styles.value}>{PixelRatio.getFontScale()}</Text>
        </View>
        <View style={styles.container}>
          <Text>On this device images with a layout width of</Text>
          <Text style={styles.value}>{size} px</Text>
          <Image source={cat} />
        </View>
        <View style={styles.container}>
          <Text>require images with a pixel width of</Text>
          <Text style={styles.value}>
            {PixelRatio.getPixelSizeForLayoutSize(size)} px
          </Text>
          <Image
            source={cat}
            style={{
              width: PixelRatio.getPixelSizeForLayoutSize(size),
              height: PixelRatio.getPixelSizeForLayoutSize(size),
            }}
          />
        </View>
      </ScrollView>
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  scrollContainer: {
    flex: 1,
  },
  container: {
    justifyContent: 'center',
    alignItems: 'center',
  },
  value: {
    fontSize: 24,
    marginBottom: 12,
    marginTop: 4,
  },
});

export default App;
```
```

--------------------------------

### openSettings() - Launch System Settings

Source: https://reactnative.dev/docs/linking

Opens the device's Settings application and displays the app's custom settings page if available. This method returns a Promise<void> and is useful for directing users to configure app permissions or preferences.

```typescript
static openSettings(): Promise<void>;
```

--------------------------------

### Install ccache on macOS

Source: https://reactnative.dev/docs/0.78/build-speed

This command installs `ccache` using Homebrew on macOS. `ccache` acts as a compiler cache, speeding up subsequent native builds by storing and reusing compilation results.

```shell
brew install ccache
```

--------------------------------

### Remove Global react-native-cli Package

Source: https://reactnative.dev/docs/0.77/getting-started-without-a-framework

Uninstall the global react-native-cli package to prevent potential conflicts and unexpected issues. This step should be completed before creating a new React Native project.

```shell
npm uninstall -g react-native-cli @react-native-community/cli
```

--------------------------------

### Run Codegen and Install Pods for React Native iOS

Source: https://reactnative.dev/docs/0.77/fabric-native-components-introduction

This bash script demonstrates the commands to navigate into the `ios` directory, install Ruby gems with `bundle install`, and then install CocoaPods dependencies using `bundle exec pod install`. These steps are essential for preparing a React Native iOS project to integrate native modules, including running Codegen which generates necessary files for Xcode to build native components like `RCTWebView`.

```bash
cd ios  
bundle install  
bundle exec pod install
```

--------------------------------

### Install React Native Library (npm & Yarn)

Source: https://reactnative.dev/docs/0.78/libraries

These commands install a React Native library, such as `react-native-webview`, into your project using either npm or Yarn package managers. They add the package to your `node_modules` directory and update `package.json`.

```shell
npm install react-native-webview
```

```shell
yarn add react-native-webview
```

--------------------------------

### Setup ReactViewController with imports and factory initialization - Objective-C

Source: https://reactnative.dev/docs/0.81/integration-with-existing-apps

Configure ReactViewController.m by importing necessary React headers and initializing RCTReactNativeFactory with a custom factory delegate. This sets up the React Native root view with the HelloWorld module. The factory delegate handles bundle URL resolution for both DEBUG and production environments.

```objectivec
#import "ReactViewController.h"
#import <React/RCTBundleURLProvider.h>
#import <RCTReactNativeFactory.h>
#import <RCTDefaultReactNativeFactoryDelegate.h>
#import <RCTAppDependencyProvider.h>

@interface ReactViewController ()

@end

@interface ReactNativeFactoryDelegate: RCTDefaultReactNativeFactoryDelegate
@end

@implementation ReactViewController {
  RCTReactNativeFactory *_factory;
  id<RCTReactNativeFactoryDelegate> _factoryDelegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _factoryDelegate = [ReactNativeFactoryDelegate new];
    _factoryDelegate.dependencyProvider = [RCTAppDependencyProvider new];
    _factory = [[RCTReactNativeFactory alloc] initWithDelegate:_factoryDelegate];
    self.view = [_factory.rootViewFactory viewWithModuleName:@"HelloWorld"];
}

@end

@implementation ReactNativeFactoryDelegate

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
  return [self bundleURL];
}

- (NSURL *)bundleURL
{
#if DEBUG
  return [RCTBundleURLProvider.sharedSettings jsBundleURLForBundleRoot:@"index"];
#else
  return [NSBundle.mainBundle URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
```

--------------------------------

### onStartReached Callback - React Native VirtualizedList

Source: https://reactnative.dev/docs/virtualizedlist

Triggered once when the scroll position gets within onStartReachedThreshold from the logical start of the list. Provides the distance from start in the callback object for custom handling.

```typescript
(info: {distanceFromStart: number}) => void
```

--------------------------------

### Initialize React Native Project for Native Components

Source: https://reactnative.dev/docs/0.80/fabric-native-components-introduction

This command initializes a new React Native project named 'Demo'. It's a foundational step to set up the development environment required for building and integrating custom Fabric Native Components. The '--install-pods false' flag prevents immediate pod installation, allowing for manual configuration later.

```bash
npx @react-native-community/cli@latest init Demo --install-pods false  
```

--------------------------------

### Comprehensive React Native PlatformColor Example for Styling

Source: https://reactnative.dev/docs/0.77/platformcolor

A complete React Native application example showcasing the practical implementation of `PlatformColor`. This code demonstrates how to apply platform-specific colors for text and background styles using `Platform.select`, ensuring the UI adapts correctly to iOS and Android native themes and design systems.

```javascript
import React from 'react';
import {Platform, PlatformColor, StyleSheet, Text} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <Text style={styles.label}>I am a special label color!</Text>
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  label: {
    padding: 16,
    fontWeight: '800',
    ...Platform.select({
      ios: {
        color: PlatformColor('label'),
        backgroundColor: PlatformColor('systemTealColor')
      },
      android: {
        color: PlatformColor('?android:attr/textColor'),
        backgroundColor: PlatformColor('@android:color/holo_blue_bright')
      },
      default: {color: 'black'}
    })
  },
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center'
  }
});

export default App;
```

--------------------------------

### Initialize React Native 0.81 Project for Turbo Native Module Development

Source: https://reactnative.dev/docs/0.81/turbo-native-modules-introduction_language=typescript&platforms=android

Provides the command to initialize a new React Native application specifically for version 0.81, serving as the foundational project setup required to follow the Turbo Native Module development guide. This ensures compatibility with the discussed module creation process.

```shell
npx @react-native-community/cli@latest init TurboModuleExample --version 0.81
```

--------------------------------

### TouchableHighlight Complete Example

Source: https://reactnative.dev/docs/0.78/touchablehighlight

Full working example demonstrating TouchableHighlight implementation with state management, styling, and touch event handling. Shows how to create an interactive button with press counter.

```APIDOC
## Complete TouchableHighlight Example

### Implementation
```tsx
import React, {useState} from 'react';
import {StyleSheet, Text, TouchableHighlight, View} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const TouchableHighlightExample = () => {
  const [count, setCount] = useState(0);
  const onPress = () => setCount(count + 1);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <TouchableHighlight onPress={onPress}>
          <View style={styles.button}>
            <Text>Touch Here</Text>
          </View>
        </TouchableHighlight>
        <View style={styles.countContainer}>
          <Text style={styles.countText}>{count || null}</Text>
        </View>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: 10,
  },
  button: {
    alignItems: 'center',
    backgroundColor: '#DDDDDD',
    padding: 10,
  },
  countContainer: {
    alignItems: 'center',
    padding: 10,
  },
  countText: {
    color: '#FF00FF',
  },
});

export default TouchableHighlightExample;
```

### Features Demonstrated
- **State Management**: Uses `useState` hook to track press count
- **Touch Handling**: `onPress` callback updates component state
- **Styling**: Custom styles for button and text display
- **Layout**: SafeAreaView ensures proper spacing on all devices
- **Visual Feedback**: Button background provides visual feedback on touch
```

--------------------------------

### Setup ReactViewController with React Native Factory in Swift

Source: https://reactnative.dev/docs/0.78/integration-with-existing-apps

Initializes a React Native factory and configures the ReactViewController to display React Native components using Swift syntax. Creates a custom delegate class inheriting from RCTDefaultReactNativeFactoryDelegate to manage bundle URL resolution. Supports both debug development server and production bundle configurations.

```Swift
import UIKit
import React
import React_RCTAppDelegate

class ReactViewController: UIViewController {
  var reactNativeFactory: RCTReactNativeFactory?
  var reactNativeFactoryDelegate: RCTReactNativeFactoryDelegate?

  override func viewDidLoad() {
    super.viewDidLoad()
    reactNativeFactoryDelegate = ReactNativeDelegate()
    reactNativeFactory = RCTReactNativeFactory(delegate: reactNativeFactoryDelegate!)
    view = reactNativeFactory!.rootViewFactory.view(withModuleName: "HelloWorld")

  }
}

class ReactNativeDelegate: RCTDefaultReactNativeFactoryDelegate {
    override func sourceURL(for bridge: RCTBridge) -> URL? {
      self.bundleURL()
    }

    override func bundleURL() -> URL? {
      #if DEBUG
      RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index")
      #else
      Bundle.main.url(forResource: "main", withExtension: "jsbundle")
      #endif
    }

}
```

--------------------------------

### Directory structure for React Native local library setup

Source: https://reactnative.dev/docs/0.77/legacy/local-library-setup

Shows the recommended folder structure for a React Native project with a local library. The local library (awesome-module) is placed in a modules folder at the project root, separate from android/ and ios/ directories.

```plaintext
MyApp
├── node_modules
├── modules <-- folder for your local libraries
│ └── awesome-module <-- your local library
├── android
├── ios
├── src
├── index.js
└── package.json
```

--------------------------------

### Implement Basic FlatList in React Native

Source: https://reactnative.dev/docs/0.77/using-a-listview

This example demonstrates a basic implementation of the FlatList component in React Native. It uses hardcoded data, applies styling for the container and list items, and renders each item as a Text component using the renderItem prop. This setup allows for displaying a scrollable list of names.

```javascript
import React from 'react';
import {FlatList, StyleSheet, Text, View} from 'react-native';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: 22,
  },
  item: {
    padding: 10,
    fontSize: 18,
    height: 44,
  },
});

const FlatListBasics = () => {
  return (
    <View style={styles.container}>
      <FlatList
        data={[
          {key: 'Devin'},
          {key: 'Dan'},
          {key: 'Dominic'},
          {key: 'Jackson'},
          {key: 'James'},
          {key: 'Joel'},
          {key: 'John'},
          {key: 'Jillian'},
          {key: 'Jimmy'},
          {key: 'Julie'},
        ]}
        renderItem={({item}) => <Text style={styles.item}>{item.key}</Text>}
      />
    </View>
  );
};

export default FlatListBasics;
```

--------------------------------

### Initialize React Native 0.78 Project using CLI

Source: https://reactnative.dev/docs/0.78/the-new-architecture/pure-cxx-modules

This shell command initializes a new React Native project named 'SampleApp' with the specified version 0.78. This project serves as the foundational setup required for developing and integrating cross-platform native modules.

```shell
npx @react-native-community/cli@latest init SampleApp --version 0.78
```

--------------------------------

### Alert Implementation Example - Dismissable Alert

Source: https://reactnative.dev/docs/0.79/alert

Complete working example demonstrating how to implement a dismissable alert with React Native using the Alert API, SafeAreaView, and button callbacks.

```APIDOC
## Complete Alert Implementation Example

### Description
This example demonstrates a fully functional React Native application that displays a dismissable alert dialog with cancel button and onDismiss callback handling.

### Full Code Example
```javascript
import React from 'react';
import {StyleSheet, Button, Alert} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const showAlert = () =>
  Alert.alert(
    'Alert Title',
    'My Alert Msg',
    [
      {
        text: 'Cancel',
        onPress: () => Alert.alert('Cancel Pressed'),
        style: 'cancel'
      }
    ],
    {
      cancelable: true,
      onDismiss: () =>
        Alert.alert(
          'This alert was dismissed by tapping outside of the alert dialog.'
        )
    }
  );

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <Button title="Show alert" onPress={showAlert} />
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center'
  }
});

export default App;
```

### Key Features
- **SafeAreaProvider & SafeAreaView**: Ensures content is displayed safely within device safe areas.
- **Alert Configuration**: Demonstrates all Alert.alert() parameters including title, message, buttons array, and options.
- **Dismissable**: The `cancelable: true` option allows users to dismiss by tapping outside the alert.
- **Callbacks**: Shows both button onPress callbacks and onDismiss callback handling.
- **Button Styling**: Uses 'cancel' style for the cancel button (iOS specific).
```

--------------------------------

### Alert Implementation Example

Source: https://reactnative.dev/docs/0.81/alert

Complete React Native component demonstrating how to implement the Alert API with multiple button configurations, including both two-button and three-button alert examples with proper styling and callbacks.

```APIDOC
## Complete Alert Implementation

### Description
Full working example of implementing the Alert API in a React Native application with multiple button configurations.

### Code Example
```javascript
import React from 'react';
import {StyleSheet, Button, Alert} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const createTwoButtonAlert = () =>
    Alert.alert('Alert Title', 'My Alert Msg', [
      {
        text: 'Cancel',
        onPress: () => console.log('Cancel Pressed'),
        style: 'cancel',
      },
      {text: 'OK', onPress: () => console.log('OK Pressed')},
    ]);

  const createThreeButtonAlert = () =>
    Alert.alert('Alert Title', 'My Alert Msg', [
      {
        text: 'Ask me later',
        onPress: () => console.log('Ask me later pressed'),
      },
      {
        text: 'Cancel',
        onPress: () => console.log('Cancel Pressed'),
        style: 'cancel',
      },
      {text: 'OK', onPress: () => console.log('OK Pressed')},
    ]);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Button title={'2-Button Alert'} onPress={createTwoButtonAlert} />
        <Button title={'3-Button Alert'} onPress={createThreeButtonAlert} />
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'space-around',
    alignItems: 'center',
  },
});

export default App;
```

### Usage Notes
- Import Alert from 'react-native'
- Each button configuration should include text, onPress callback, and optional style
- Use 'cancel' style on iOS to indicate the cancel button
- Organize buttons in appropriate order for your platform (iOS flexible, Android limited to 3)
- SafeAreaView ensures proper spacing on devices with notches
```

--------------------------------

### Run Android Build with Verbose Logging (npm and Yarn)

Source: https://reactnative.dev/docs/0.77/troubleshooting

To debug processes or get more information about errors during the Android build, use the `--verbose` option. This command outputs detailed logs to help pinpoint issues, whether using npm or Yarn in your project's root directory.

```shell
npm run android -- --verbose
```

```shell
yarn android --verbose
```

--------------------------------

### Create React Native Library Project Setup

Source: https://reactnative.dev/docs/0.78/legacy/native-modules-setup

Initializes a new React Native native module project using the create-react-native-library tool. This command generates the basic project structure with placeholder name 'react-native-awesome-module' that should be replaced with your desired module name. The tool sets up the necessary boilerplate for npm package distribution.

```shell
npx create-react-native-library@latest react-native-awesome-module
```

--------------------------------

### Install Node.js LTS and OpenJDK 17 on Windows with Chocolatey

Source: https://reactnative.dev/docs/0.78/set-up-your-environment

This PowerShell command leverages Chocolatey, a Windows package manager, to install the Long Term Support (LTS) version of Node.js and OpenJDK 17. It's crucial for setting up the necessary JavaScript runtime and Java Development Kit for React Native development on Windows. Execute this in an Administrator Command Prompt.

```powershell
choco install -y nodejs-lts microsoft-openjdk17  

```

--------------------------------

### Transform with Animated Values Example

Source: https://reactnative.dev/docs/0.81/transforms

Complete example demonstrating how to use React Native's Animated API with transform properties to create smooth rotation animations using transformOrigin to control the pivot point.

```APIDOC
## Animated Transform with TransformOrigin

### Description
Demonstrates creating continuous rotation animations using Animated.Value, timing, and transform properties with custom transformOrigin.

### Implementation

```javascript
import React, {useEffect, useRef} from 'react';
import {
  Animated,
  View,
  StyleSheet,
  Easing,
} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const rotateAnim = useRef(new Animated.Value(0)).current;

  useEffect(() => {
    Animated.loop(
      Animated.timing(rotateAnim, {
        toValue: 1,
        duration: 5000,
        easing: Easing.linear,
        useNativeDriver: true,
      }),
    ).start();
  }, [rotateAnim]);

  const spin = rotateAnim.interpolate({
    inputRange: [0, 1],
    outputRange: ['0deg', '360deg'],
  });

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <View style={styles.transformOriginWrapper}>
          <Animated.View
            style={[
              styles.transformOriginView,
              {
                transform: [{rotate: spin}],
              },
            ]}
          />
        </View>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  transformOriginWrapper: {
    borderWidth: 1,
    borderColor: 'rgba(0, 0, 0, 0.5)',
  },
  transformOriginView: {
    backgroundColor: 'pink',
    width: 100,
    height: 100,
    transformOrigin: 'top',
  },
});

export default App;
```

### Key Components
- **Animated.Value** - Stores animation value (0 to 1)
- **Animated.timing** - Creates time-based animation
- **interpolate** - Maps animation value to rotation degrees
- **Animated.loop** - Repeats animation continuously
- **transform** - Applies rotation based on interpolated value
- **transformOrigin** - Sets rotation pivot point to 'top'
```

--------------------------------

### Install React Native Library with Yarn

Source: https://reactnative.dev/docs/0.77/libraries

Install a React Native library from the npm registry using Yarn Classic package manager. Yarn may provide faster install times and additional features compared to npm CLI. Replace 'react-native-webview' with any desired library name.

```shell
yarn add react-native-webview
```

--------------------------------

### openURL() - Open URL with Installed Apps

Source: https://reactnative.dev/docs/linking

Attempts to open a given URL using any compatible installed application. Supports various URL schemes including http/https, geo locations, and contacts. Returns a Promise that resolves if the user confirms or the URL opens automatically, and rejects if no handler exists or the user cancels. Best used with canOpenURL() validation for non-http schemes.

```typescript
static openURL(url: string): Promise<any>;
```

--------------------------------

### Animated.sequence()

Source: https://reactnative.dev/docs/0.79/animated

Starts an array of animations in order, waiting for each to complete before starting the next. If the current running animation is stopped, no following animations will be started.

```APIDOC
## Animated.sequence()

### Description
Starts an array of animations in order, waiting for each to complete before starting the next. If the current running animation is stopped, no following animations will be started.

### Method
Static Method

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
- **animations** (`CompositeAnimation[]`) - Required - An array of animations to run in sequence.

### Request Example
```tsx
Animated.sequence([
  Animated.timing(this.state.x, { toValue: 100, duration: 500, useNativeDriver: true }),
  Animated.spring(this.state.y, { toValue: 200, useNativeDriver: true })
]).start();
```

### Response
#### Success Response (Returns CompositeAnimation)
- **CompositeAnimation** (object) - A composite animation object that can be started.

#### Response Example
```json
// The method returns a CompositeAnimation instance, not a direct JSON response.
// Its effect is observed visually.
```
```

--------------------------------

### iOS Codegen Artifacts Generation Command Example

Source: https://reactnative.dev/docs/0.78/the-new-architecture/using-codegen

Example command to generate iOS Codegen artifacts with specific parameters. This generates files in the ios/build directory using the current directory as the project root and ios as the target platform.

```bash
node node_modules/react-native/scripts/generate-codegen-artifacts.js \
    --path . \
    --outputPath ios/ \
    --targetPlatform ios
```

--------------------------------

### Install React Navigation with npm

Source: https://reactnative.dev/docs/0.77/navigation

Install the core React Navigation library and native stack navigator package for React Native projects. This is the first step in setting up navigation in your app.

```shell
npm install @react-navigation/native @react-navigation/native-stack
```

--------------------------------

### Configure Root Directory in Gradle

Source: https://reactnative.dev/docs/0.77/react-native-gradle-plugin

Sets the root folder of the React Native project where the package.json file is located. Default is the parent directory (..). Use this to customize the project root path in monorepo setups.

```groovy
root = file("../")
```

--------------------------------

### Configure CocoaPods Podfile with React Native subspecs

Source: https://reactnative.dev/docs/0.77/troubleshooting

Define React Native dependencies in Podfile with specific subspecs (RCTText, RCTImage, RCTNetwork, RCTWebSocket) for proper library linking in iOS projects. Run pod install after configuration.

```ruby
pod 'React', :path => '../node_modules/react-native', :subspecs => [
  'RCTText',
  'RCTImage',
  'RCTNetwork',
  'RCTWebSocket',
]
```

--------------------------------

### Load Shell Configuration and Verify ANDROID_HOME Setup

Source: https://reactnative.dev/docs/0.80/set-up-your-environment

Commands to reload shell configuration and verify that ANDROID_HOME environment variable and PATH directories have been correctly set. Use source command for bash or zsh shells to load the updated configuration into the current session.

```shell
source $HOME/.bash_profile
echo $ANDROID_HOME
echo $PATH
```

--------------------------------

### sequence() - Start Animations in Sequential Order

Source: https://reactnative.dev/docs/0.77/animated

Starts an array of animations in order, waiting for each to complete before starting the next. If any running animation is stopped, subsequent animations will not be started. This is useful for chaining dependent animations.

```typescript
static sequence(animations: CompositeAnimation[]): CompositeAnimation;
```

--------------------------------

### Animated.sequence()

Source: https://reactnative.dev/docs/animated

Starts animations in order, waiting for each to complete before starting the next. Creates sequential animation chains.

```APIDOC
## Animated.sequence()

### Description
Starts the animations in order, waiting for each to complete before starting the next one in the sequence.

### Method
Static method

### Signature
```typescript
static sequence(animations): CompositeAnimation;
```

### Parameters
- **animations** (array) - Required - Array of animation objects to run sequentially

### Behavior
- Each animation waits for the previous one to complete
- If one animation is interrupted, subsequent animations are not started

### Usage Example
```typescript
const animatedValue = new Animated.Value(0);
Animated.sequence([
  Animated.timing(animatedValue, { toValue: 100, duration: 1000, useNativeDriver: false }),
  Animated.timing(animatedValue, { toValue: 0, duration: 1000, useNativeDriver: false })
]).start();
```

### Returns
- **CompositeAnimation** - A composite animation object that can be started or stopped
```

--------------------------------

### Start Headless Service from Kotlin

Source: https://reactnative.dev/docs/0.79/headless-js-android

Create an Intent targeting MyTaskService using Kotlin syntax, bundle data parameters, and start the service using startForegroundService(). Data passed in the bundle becomes available to the JavaScript task handler.

```kotlin
val service = Intent(applicationContext, MyTaskService::class.java)
val bundle = Bundle()

bundle.putString("foo", "bar")

service.putExtras(bundle)

applicationContext.startForegroundService(service)
```

--------------------------------

### Implement Custom Dynamic Text Colors (React Native, iOS)

Source: https://reactnative.dev/docs/0.77/dynamiccolorios

This example demonstrates practical usage of `DynamicColorIOS` to create custom dynamic text colors in a React Native application. It shows two scenarios: a basic setup for light and dark modes, and an advanced configuration that includes specific colors for high contrast accessibility settings on iOS, providing adaptable UI elements.

```tsx
import {DynamicColorIOS} from 'react-native';
  
const customDynamicTextColor = DynamicColorIOS({
  dark: 'lightskyblue',
  light: 'midnightblue'
});
  
const customContrastDynamicTextColor = DynamicColorIOS({
  dark: 'darkgray',
  light: 'lightgray',
  highContrastDark: 'black',
  highContrastLight: 'white'
});
```

--------------------------------

### Install Node.js LTS and OpenJDK 17 on Windows with Chocolatey

Source: https://reactnative.dev/docs/0.77/set-up-your-environment

This PowerShell command uses Chocolatey, a package manager for Windows, to install the Long Term Support (LTS) version of Node.js and OpenJDK 17. This is the recommended method for setting up the essential dependencies for React Native development on a Windows machine. Run this command in an Administrator Command Prompt.

```powershell
choco install -y nodejs-lts microsoft-openjdk17
```

--------------------------------

### Install React Native and React packages with npm

Source: https://reactnative.dev/docs/0.81/upgrading

Install specific versions of react-native and react packages using npm. Replace {{VERSION}} with the target React Native version and {{REACT_VERSION}} with the target React version from the Upgrade Helper diff.

```shell
# {{VERSION}} and {{REACT_VERSION}} are the release versions showing in the diff
npm install react-native@{{VERSION}}
npm install react@{{REACT_VERSION}}
```

--------------------------------

### Create React Native Entry Point (index.js)

Source: https://reactnative.dev/docs/0.77/integration-with-existing-apps

This snippet provides the basic structure for an `index.js` file, which serves as the entry point for React Native applications. It imports `AppRegistry` from `react-native` and registers the main application component, `App`, under the name 'HelloWorld'.

```javascript
import {AppRegistry} from 'react-native';  
import App from './App';  
  
AppRegistry.registerComponent('HelloWorld', () => App);
```

--------------------------------

### Install iOS dependencies with CocoaPods

Source: https://reactnative.dev/docs/next/turbo-native-modules-introduction

Installs iOS project dependencies using CocoaPods package manager from the ios folder. Requires CocoaPods and Ruby gems to be installed on the system. After installation, opens the Xcode workspace file for the project.

```bash
cd ios
bundle exec pod install
open SampleApp.xcworkspace
```

--------------------------------

### Install peer dependencies for bare React Native project

Source: https://reactnative.dev/docs/0.78/navigation

Install required peer dependencies when using React Navigation with a bare React Native project. Includes additional steps for iOS with CocoaPods pod installation.

```shell
npm install react-native-screens react-native-safe-area-context
```

```shell
cd ios
pod install
cd ..
```

--------------------------------

### Access a Specific Native Module from NativeModules

Source: https://reactnative.dev/docs/0.79/legacy/native-modules-android

Once `NativeModules` is imported, you can access individual native modules by destructuring them from the `NativeModules` object. This example shows how to get the `CalendarModule`, which should correspond to the name you registered in your native Android code.

```tsx
const {CalendarModule} = NativeModules;
```

--------------------------------

### Configure Metro bundler to use custom port with npm and Yarn

Source: https://reactnative.dev/docs/0.77/troubleshooting

Change the default Metro bundler port from 8081 to a custom port (e.g., 8088) using npm or Yarn start commands with the port parameter.

```shell
npm start -- --port=8088
```

```shell
yarn start --port 8088
```

--------------------------------

### Initialize a React Native project with npx

Source: https://reactnative.dev/docs/the-new-architecture/using-codegen

This command initializes a new React Native project named 'SampleApp' using the specified CLI version. It's a prerequisite for running Codegen, as Codegen scripts are tightly coupled with the React Native NPM package.

```shell
npx @react-native-community/cli@latest init SampleApp --version 0.82
```

--------------------------------

### Verify ANDROID_HOME Configuration in Shell

Source: https://reactnative.dev/docs/0.78/set-up-your-environment

Validate that the ANDROID_HOME environment variable has been properly set and that the Android SDK paths have been added to the system PATH. Run these commands after sourcing your shell configuration file to confirm the setup.

```shell
echo $ANDROID_HOME
echo $PATH
```

--------------------------------

### Install iOS Pods and Open Xcode Workspace

Source: https://reactnative.dev/docs/0.79/turbo-native-modules-introduction

This sequence of commands is used to install native iOS dependencies via CocoaPods and then open the generated Xcode workspace file. It's typically executed from within the 'ios' directory of a React Native project to prepare the native environment for compilation. Ensure CocoaPods is installed and configured.

```bash
bundle exec pod install
open SampleApp.xcworkspace
```

--------------------------------

### Install iOS CocoaPods Dependencies for Local Library

Source: https://reactnative.dev/docs/the-new-architecture/create-module-library

Install CocoaPods dependencies for a React Native library that contains native iOS code. Run this command in the App/ios folder after adding a library with native dependencies. This ensures all native iOS modules are properly linked.

```bash
bundle exec pod install
```

--------------------------------

### Get Correctly Sized Image for Device Pixel Density (React Native)

Source: https://reactnative.dev/docs/0.78/pixelratio

This React Native example demonstrates how to use `PixelRatio.getPixelSizeForLayoutSize` to fetch an image that is correctly sized for the device's pixel density. It ensures higher resolution images are used on high pixel density screens to maintain visual clarity without blurring. The image is then displayed with standard layout dimensions.

```tsx
const image = getImage({
  width: PixelRatio.getPixelSizeForLayoutSize(200),
  height: PixelRatio.getPixelSizeForLayoutSize(100),
});
<Image source={image} style={{width: 200, height: 100}} />;
```

--------------------------------

### Register React Native Package in MainApplication (Java/Kotlin)

Source: https://reactnative.dev/docs/0.79/turbo-native-modules-introduction_language=typescript&platforms=android

These code examples demonstrate how to register a custom React Native package within the Android `MainApplication`. The Java snippet shows adding `NativeLocalStoragePackage` to the list returned by `getPackages()` in `DefaultReactNativeHost`. The Kotlin snippet initiates the `MainApplication` class and its `reactNativeHost` override, signaling the start of package registration, though the complete `getPackages` implementation is not fully provided.

```java
package com.inappmodule;  
  
import android.app.Application;  
import com.facebook.react.PackageList;  
import com.facebook.react.ReactApplication;  
import com.facebook.react.ReactHost;  
import com.facebook.react.ReactNativeHost;  
import com.facebook.react.ReactPackage;  
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint;  
import com.facebook.react.defaults.DefaultReactHost;  
import com.facebook.react.defaults.DefaultReactNativeHost;  
import com.facebook.soloader.SoLoader;  
import com.nativelocalstorage.NativeLocalStoragePackage;  
  
import java.util.ArrayList;  
import java.util.List;  
  
public class MainApplication extends Application implements ReactApplication {  
  
  private final ReactNativeHost reactNativeHost = new DefaultReactNativeHost(this) {  
    @Override  
    public List<ReactPackage> getPackages() {  
      List<ReactPackage> packages = new PackageList(this).getPackages();  
      // Packages that cannot be autolinked yet can be added manually here, for example:  
      // packages.add(new MyReactNativePackage());  
      packages.add(new NativeLocalStoragePackage());  
      return packages;  
    }  
  
    @Override  
    public String getJSMainModuleName() {  
      return "index";  
    }  
  
    @Override  
    public boolean getUseDeveloperSupport() {  
      return BuildConfig.DEBUG;  
    }  
  
    @Override  
    public boolean isNewArchEnabled() {  
      return BuildConfig.IS_NEW_ARCHITECTURE_ENABLED;  
    }  
  
    @Override  
    public boolean isHermesEnabled() {  
      return BuildConfig.IS_HERMES_ENABLED;  
    }  
  };  
  
  @Override  
  public ReactHost getReactHost() {  
    return DefaultReactHost.getDefaultReactHost(getApplicationContext(), reactNativeHost);  
  }
  
  @Override  
  public void onCreate() {  
    super.onCreate();  
    SoLoader.init(this, false);  
    if (BuildConfig.IS_NEW_ARCHITECTURE_ENABLED) {  
      // If you opted-in for the New Architecture, we load the native entry point for this app.  
      DefaultNewArchitectureEntryPoint.load();  
    }  
  }
}
```

```kotlin
package com.inappmodule  
  
import android.app.Application  
import com.facebook.react.PackageList  
import com.facebook.react.ReactApplication  
import com.facebook.react.ReactHost  
import com.facebook.react.ReactNativeHost  
import com.facebook.react.ReactPackage  
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint.load  
import com.facebook.react.defaults.DefaultReactHost.getDefaultReactHost  
import com.facebook.react.defaults.DefaultReactNativeHost  
import com.facebook.soloader.SoLoader  
import com.nativelocalstorage.NativeLocalStoragePackage  
  
class MainApplication : Application(), ReactApplication {  
  
  override val reactNativeHost: ReactNativeHost =
```

--------------------------------

### Install CocoaPods for iOS bare React Native

Source: https://reactnative.dev/docs/0.77/navigation

Complete the installation for iOS in a bare React Native project by installing CocoaPods dependencies. Run these commands from the iOS directory of your project.

```shell
cd ios
pod install
cd ..
```

--------------------------------

### PanResponder Draggable Component Example

Source: https://reactnative.dev/docs/0.81/panresponder

Complete working example demonstrating how to create a draggable box using PanResponder with Animated values. Shows integration with React Native components and gesture handling.

```APIDOC
## PanResponder Draggable Component Example

### Description
This example demonstrates a complete implementation of a draggable UI component using PanResponder with Animated values for smooth position tracking.

### Implementation
```javascript
import React, {useRef} from 'react';
import {Animated, View, StyleSheet, PanResponder, Text} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  // Create animated value for tracking X and Y position
  const pan = useRef(new Animated.ValueXY()).current;

  // Create pan responder with gesture handlers
  const panResponder = useRef(
    PanResponder.create({
      // Set responder on any movement
      onMoveShouldSetPanResponder: () => true,
      // Update animated values based on drag delta
      onPanResponderMove: Animated.event([null, {dx: pan.x, dy: pan.y}]),
      // Lock position after release
      onPanResponderRelease: () => {
        pan.extractOffset();
      },
    }),
  ).current;

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Text style={styles.titleText}>Drag this box!</Text>
        <Animated.View
          style={{
            transform: [{translateX: pan.x}, {translateY: pan.y}],
          }}
          {...panResponder.panHandlers}>
          <View style={styles.box} />
        </Animated.View>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  titleText: {
    fontSize: 14,
    lineHeight: 24,
    fontWeight: 'bold',
  },
  box: {
    height: 150,
    width: 150,
    backgroundColor: 'blue',
    borderRadius: 5,
  },
});

export default App;
```

### Key Components

**Animated.ValueXY**
- Creates a 2D animated value for tracking X and Y coordinates
- Provides smooth animation tracking during drag gestures

**PanResponder.create()**
- onMoveShouldSetPanResponder: Returns true to activate on any movement
- onPanResponderMove: Animated.event updates pan.x and pan.y with dx and dy deltas
- onPanResponderRelease: Calls extractOffset() to lock position after drag completes

**Animated.View**
- Applies transform with translateX and translateY based on pan values
- Spreads panResponder.panHandlers to enable gesture detection

### Gesture Flow
1. User touches and moves finger on blue box
2. onMoveShouldSetPanResponder returns true, activating responder
3. onPanResponderMove fires repeatedly, updating pan.x and pan.y
4. Transform animates box position in real-time
5. User lifts finger, onPanResponderRelease fires
6. extractOffset() saves current position as new baseline
7. Box remains at final position

### Result
A smooth, draggable blue box that follows finger movement and maintains position after release.
```

--------------------------------

### Present React Native View Controller in iOS ViewController

Source: https://reactnative.dev/docs/0.80/integration-with-existing-apps

Demonstrates how to integrate and present a React Native view controller (`ReactViewController`) from a native iOS `ViewController` using a button tap. Includes Objective-C and Swift implementations for UI setup, adding layout constraints, and handling the view presentation logic. This requires an existing `ReactViewController` to be available.

```Objective-C
#import "ViewController.h"
#import "ReactViewController.h"
  
@interface ViewController ()
  
@end
  
@implementation ViewController {
  ReactViewController *reactViewController;
}
  
- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.view.backgroundColor = UIColor.systemBackgroundColor;
  UIButton *button = [UIButton new];
  [button setTitle:@"Open React Native" forState:UIControlStateNormal];
  [button setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
  [button setTitleColor:UIColor.blueColor forState:UIControlStateHighlighted];
  [button addTarget:self action:@selector(presentReactNative) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
  
  button.translatesAutoresizingMaskIntoConstraints = NO;
  [NSLayoutConstraint activateConstraints:@[
    [button.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
    [button.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
    [button.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
    [button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor]
  ]];
}
  
- (void)presentReactNative
{
  if (reactViewController == NULL) {
    reactViewController = [ReactViewController new];
  }
  [self presentViewController:reactViewController animated:YES];
}
  
@end
```

```Swift
import UIKit
  
class ViewController: UIViewController {
  
  var reactViewController: ReactViewController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.view.backgroundColor = .systemBackground
  
    let button = UIButton()
    button.setTitle("Open React Native", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    button.addAction(UIAction { [weak self] _ in
      guard let self else { return }
      if reactViewController == nil {
       reactViewController = ReactViewController()
      }
      present(reactViewController!, animated: true)
    }, for: .touchUpInside)
    self.view.addSubview(button)
  
    button.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
    ])
  }
}
```

--------------------------------

### Start Headless Task in React Native

Source: https://reactnative.dev/docs/0.77/appregistry

Starts a background headless task, typically invoked from native code. It takes a unique `taskId`, a `taskKey` to identify the task, and `data` to pass as arguments, facilitating background operations without an active UI.

```tsx
static startHeadlessTask(
  taskId: number,
  taskKey: string,
  data: any,
);
```

--------------------------------

### TouchableWithoutFeedback Complete Example

Source: https://reactnative.dev/docs/0.77/touchablewithoutfeedback

Full working example of TouchableWithoutFeedback with state management, styling, and event handling. Demonstrates a counter component that increments on touch.

```APIDOC
## TouchableWithoutFeedback Complete Example

### Description
Complete functional example showing TouchableWithoutFeedback implementation with React hooks for state management and custom styling.

### Implementation
```tsx
import React, {useState} from 'react';
import {StyleSheet, TouchableWithoutFeedback, Text, View} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const TouchableWithoutFeedbackExample = () => {
  const [count, setCount] = useState(0);

  const onPress = () => {
    setCount(count + 1);
  };

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <View style={styles.countContainer}>
          <Text style={styles.countText}>Count: {count}</Text>
        </View>
        <TouchableWithoutFeedback onPress={onPress}>
          <View style={styles.button}>
            <Text>Touch Here</Text>
          </View>
        </TouchableWithoutFeedback>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: 10,
  },
  button: {
    alignItems: 'center',
    backgroundColor: '#DDDDDD',
    padding: 10,
  },
  countContainer: {
    alignItems: 'center',
    padding: 10,
  },
  countText: {
    color: '#FF00FF',
  },
});

export default TouchableWithoutFeedbackExample;
```

### Features
- State management with useState hook
- Counter functionality that increments on press
- SafeAreaView integration for proper layout
- Custom styling with StyleSheet
```

--------------------------------

### Install Pods and Open Workspace

Source: https://reactnative.dev/docs/0.79/the-new-architecture/pure-cxx-modules

Bash commands to reinstall pods and open the Xcode workspace after updating package.json. Ensures code generation runs with new configuration and the application can be built successfully.

```bash
# from the ios folder
bundle exec pod install
open SampleApp.xcworkspace
```

--------------------------------

### Verify React Native Package Availability on NPM

Source: https://reactnative.dev/docs/0.77/the-new-architecture/create-module-library

After publishing your React Native library, use this Bash command to confirm that it is successfully available on the NPM registry. Remember to replace `<package.name>` with the actual name defined in your library's `package.json` file.

```bash
npm view <package.name>
```

--------------------------------

### Implement RCTRootView Flexible Size Handler - Objective-C

Source: https://reactnative.dev/docs/0.78/communication-ios

Complete implementation example of FlexibleSizeExampleView that creates and configures an RCTRootView with height flexibility. The delegate method rootViewDidChangeIntrinsicSize: is called whenever React Native content height changes, allowing the native view to update its frame accordingly. Sets initial frame with zero height, which gets updated by the delegate callback.

```objective-c
- (instancetype)initWithFrame:(CGRect)frame
{
  [...]
  
  _rootView = [[RCTRootView alloc] initWithBridge:bridge
  moduleName:@"FlexibilityExampleApp"
  initialProperties:@{}];
  
  _rootView.delegate = self;
  _rootView.sizeFlexibility = RCTRootViewSizeFlexibilityHeight;
  _rootView.frame = CGRectMake(0, 0, self.frame.size.width, 0);
}
  
#pragma mark - RCTRootViewDelegate
- (void)rootViewDidChangeIntrinsicSize:(RCTRootView *)rootView
{
  CGRect newFrame = rootView.frame;
  newFrame.size = rootView.intrinsicContentSize;
  
  rootView.frame = newFrame;
}
```

--------------------------------

### start() - Begin Animation with Completion Callback

Source: https://reactnative.dev/docs/0.77/animated

Initiates animation playback and accepts an optional completion callback invoked when animation finishes or is stopped. The callback receives a result object with `finished` boolean indicating normal completion or early termination.

```typescript
static start(callback?: (result: {finished: boolean}) => void);
```

```typescript
Animated.timing({}).start(({finished}) => {
  /* completion callback */
});
```

--------------------------------

### Complete ToastAndroid App Example in React Native

Source: https://reactnative.dev/docs/0.77/toastandroid

Full React Native application demonstrating all three toast methods (show, showWithGravity, showWithGravityAndOffset) with interactive buttons. Uses SafeAreaView for proper layout and includes styling with a custom container component and status bar integration.

```javascript
import React from 'react';
import {StyleSheet, ToastAndroid, Button, StatusBar} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const showToast = () => {
    ToastAndroid.show('A pikachu appeared nearby !', ToastAndroid.SHORT);
  };

  const showToastWithGravity = () => {
    ToastAndroid.showWithGravity(
      'All Your Base Are Belong To Us',
      ToastAndroid.SHORT,
      ToastAndroid.CENTER,
    );
  };

  const showToastWithGravityAndOffset = () => {
    ToastAndroid.showWithGravityAndOffset(
      'A wild toast appeared!',
      ToastAndroid.LONG,
      ToastAndroid.BOTTOM,
      25,
      50,
    );
  };

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Button title="Toggle Toast" onPress={() => showToast()} />
        <Button
          title="Toggle Toast With Gravity"
          onPress={() => showToastWithGravity()}
        />
        <Button
          title="Toggle Toast With Gravity & Offset"
          onPress={() => showToastWithGravityAndOffset()}
        />
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingTop: StatusBar.currentHeight,
    backgroundColor: '#888888',
    padding: 8,
  },
});

export default App;
```

--------------------------------

### Link Native iOS Dependencies with CocoaPods

Source: https://reactnative.dev/docs/0.77/libraries

Install iOS native dependencies for React Native libraries using CocoaPods. The npx pod-install command is a shortcut that runs pod install in the ios directory without requiring manual directory navigation. Execute this after installing libraries with native code.

```bash
npx pod-install
```

--------------------------------

### Create React Native library with CLI

Source: https://reactnative.dev/docs/0.77/legacy/local-library-setup

Command to generate a new local library using create-react-native-library tool. This creates a new module folder with all necessary templates and configuration files for your local library.

```shell
npx create-react-native-library@latest awesome-module
```

--------------------------------

### Implement React Native App with Turbo Module Local Storage

Source: https://reactnative.dev/docs/0.80/turbo-native-modules-introduction_platforms=ios

This `App.tsx` example demonstrates how to integrate and use a custom `NativeLocalStorage` Turbo Native Module within a React Native application. It features state management for a stored value, a `useEffect` hook to load the initial value, and functions (`saveValue`, `clearAll`, `deleteValue`) that interact with the native module to persist and retrieve data, all presented with a simple UI.

```javascript
import React from 'react';  
import {  
  SafeAreaView,  
  StyleSheet,  
  Text,  
  TextInput,  
  Button,  
} from 'react-native';  
  
import NativeLocalStorage from './specs/NativeLocalStorage';  
  
const EMPTY = '<empty>';  
  
function App(): React.JSX.Element {  
  const [value, setValue] = React.useState<string | null>(null);  
  
  const [editingValue, setEditingValue] = React.useState<  
    string | null  
  >(null);  
  
  React.useEffect(() => {
    const storedValue = NativeLocalStorage?.getItem('myKey');  
    setValue(storedValue ?? '');  
  }, []);  
  
  function saveValue() {  
    NativeLocalStorage?.setItem(editingValue ?? EMPTY, 'myKey');  
    setValue(editingValue);  
  }  
  
  function clearAll() {  
    NativeLocalStorage?.clear();  
    setValue('');  
  }  
  
  function deleteValue() {  
    NativeLocalStorage?.removeItem('myKey');  
    setValue('');  
  }  
  
  return (  
    <SafeAreaView style={{flex: 1}}>  
      <Text style={styles.text}>  
        Current stored value is: {value ?? 'No Value'}  
      </Text>  
      <TextInput  
        placeholder="Enter the text you want to store"  
        style={styles.textInput}  
        onChangeText={setEditingValue}  
      />  
      <Button title="Save" onPress={saveValue} />  
      <Button title="Delete" onPress={deleteValue} />  
      <Button title="Clear" onPress={clearAll} />  
    </SafeAreaView>  
  );  
}  
  
const styles = StyleSheet.create({  
  text: {  
    margin: 10,  
    fontSize: 20,  
  },  
  textInput: {  
    margin: 10,  
    height: 40,  
    borderColor: 'black',  
    borderWidth: 1,  
    paddingLeft: 5,  
    paddingRight: 5,  
    borderRadius: 5,  
  },  
});  
  
export default App;  
```

--------------------------------

### startHeadlessTask() Method

Source: https://reactnative.dev/docs/0.77/appregistry

Initiates a headless task execution. This method is called from native code to start background tasks with specific task identifiers and data payloads.

```APIDOC
## startHeadlessTask()

### Description
Starts a headless task. Only called from native code. Used for background task execution without UI.

### Method
static

### Signature
```typescript
static startHeadlessTask(
  taskId: number,
  taskKey: string,
  data: any
): void;
```

### Parameters
#### Required Parameters
- **taskId** (number) - The native id for this task instance to keep track of its execution
- **taskKey** (string) - The key for the task to start
- **data** (any) - The data to pass to the task

### Return Value
void
```

--------------------------------

### Starting React Native Animations with a Completion Callback

Source: https://reactnative.dev/docs/0.77/animated

This snippet demonstrates how to initiate an animation using the `start()` method in React Native's `Animated` API. It includes a completion callback that receives a `finished` boolean indicating if the animation completed naturally or was interrupted.

```tsx
Animated.timing({}).start(({finished}) => {
  /* completion callback */
});
```

--------------------------------

### Animated.sequence()

Source: https://reactnative.dev/docs/0.77/animated

Starts an array of animations in order, waiting for each to complete before starting the next. If the current running animation is stopped, no following animations will be started.

```APIDOC
## Animated.sequence()

### Description
Starts an array of animations in order, waiting for each to complete before starting the next. If the current running animation is stopped, no following animations will be started.

### Method
STATIC

### Signature
```typescript
static sequence(animations: CompositeAnimation[]): CompositeAnimation;
```

### Parameters
#### Function Parameters
- **animations** (CompositeAnimation[]) - Required - Array of animations to execute sequentially

### Returns
- **CompositeAnimation** - A composite animation object that can be started, stopped, or reset

### Request Example
```typescript
const sequentialAnimation = Animated.sequence([
  Animated.timing(animValue1, {toValue: 100, duration: 500}),
  Animated.timing(animValue2, {toValue: 200, duration: 500}),
  Animated.timing(animValue3, {toValue: 300, duration: 500})
]);
sequentialAnimation.start();
```
```

--------------------------------

### Animated.ValueXY - Overview and Example

Source: https://reactnative.dev/docs/0.81/animatedvaluexy

Learn how to use Animated.ValueXY to create draggable components with pan gesture support. This example demonstrates creating a draggable view that snaps back to its original position.

```APIDOC
## Animated.ValueXY

### Description
2D Value for driving 2D animations, such as pan gestures. Almost identical API to normal `Animated.Value`, but multiplexed. Contains two regular `Animated.Value`s under the hood.

### Usage
Animated.ValueXY is used to manage X and Y coordinate animations simultaneously, making it ideal for pan gestures and other 2D movement animations.

### Example Implementation
```javascript
import React, {useRef} from 'react';
import {Animated, PanResponder, StyleSheet} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const DraggableView = () => {
  const pan = useRef(new Animated.ValueXY()).current;

  const panResponder = PanResponder.create({
    onStartShouldSetPanResponder: () => true,
    onPanResponderMove: Animated.event([
      null,
      {
        dx: pan.x, // x,y are Animated.Value
        dy: pan.y,
      },
    ]),
    onPanResponderRelease: () => {
      Animated.spring(
        pan, // Auto-multiplexed
        {toValue: {x: 0, y: 0}, useNativeDriver: true}, // Back to zero
      ).start();
    },
  });

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Animated.View
          {...panResponder.panHandlers}
          style={[pan.getLayout(), styles.box]}
        />
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  box: {
    backgroundColor: '#61dafb',
    width: 80,
    height: 80,
    borderRadius: 4,
  },
});

export default DraggableView;
```
```

--------------------------------

### Callback: onStartShouldSetResponder

Source: https://reactnative.dev/docs/next/view

Determines if this view wants to become the responder on the start of a touch event.

```APIDOC
## onStartShouldSetResponder

### Description
Does this view want to become responder on the start of a touch?

### Type
`({nativeEvent: PressEvent}) => boolean`

### Arguments
- **nativeEvent** (object) - Required - Contains details about the event.
  - **PressEvent** (object) - Required - The press event object.

### Response
#### Success Response (boolean)
- Returns `true` if the view should become the responder; otherwise, `false`.
```

--------------------------------

### Install React Native and React packages with Yarn

Source: https://reactnative.dev/docs/0.81/upgrading

Install specific versions of react-native and react packages using Yarn. Replace {{VERSION}} with the target React Native version and {{REACT_VERSION}} with the target React version from the Upgrade Helper diff.

```shell
# {{VERSION}} and {{REACT_VERSION}} are the release versions showing in the diff
yarn add react-native@{{VERSION}}
yarn add react@{{REACT_VERSION}}
```

--------------------------------

### Initialize React Native 0.80 Project (Shell)

Source: https://reactnative.dev/docs/0.80/the-new-architecture/pure-cxx-modules

This shell command initializes a new React Native project named 'SampleApp' specifically targeting version 0.80 of React Native. It uses the community CLI to set up the project structure for further development of native modules.

```shell
npx @react-native-community/cli@latest init SampleApp --version 0.80
```

--------------------------------

### Install NPM Dependencies with Yarn

Source: https://reactnative.dev/docs/0.78/integration-with-existing-apps

Alternative package manager to npm for installing JavaScript dependencies defined in package.json. Creates a node_modules folder containing all required packages for building the React Native project.

```shell
yarn install
```

--------------------------------

### Start Headless Service from Java

Source: https://reactnative.dev/docs/0.79/headless-js-android

Create an Intent targeting MyTaskService, bundle data parameters, and start the service using startForegroundService(). The bundled data is passed to the task via getTaskConfig() and becomes available as taskData in the JavaScript handler.

```java
Intent service = new Intent(getApplicationContext(), MyTaskService.class);
Bundle bundle = new Bundle();

bundle.putString("foo", "bar");
service.putExtras(bundle);

getApplicationContext().startForegroundService(service);
```

--------------------------------

### delay() - Start Animation After Delay

Source: https://reactnative.dev/docs/0.77/animated

Creates a composite animation that starts execution after a specified delay in milliseconds. Returns a CompositeAnimation object that can be used to defer animation start times.

```typescript
static delay(time: number): CompositeAnimation;
```

--------------------------------

### Release React Native library to NPM

Source: https://reactnative.dev/docs/next/the-new-architecture/create-module-library

Publishes the built library to NPM registry using the release command. This command automates versioning and publishing of the package to make it available for public installation.

```bash
yarn release
```

--------------------------------

### borderStartColor

Source: https://reactnative.dev/docs/view-style-props

Sets the color of the border at the start side of the component.

```APIDOC
## STYLE PROPERTY borderStartColor

### Description
Sets the color of the border at the start side.

### Method
Property

### Endpoint
/borderStartColor

### Parameters
#### Request Body
- **borderStartColor** (color) - Required - The color for the start border.

### Request Example
```javascript
{
  "borderStartColor": "gold"
}
```

### Response
N/A
```

--------------------------------

### Initialize React Native Application Class - Kotlin

Source: https://reactnative.dev/docs/0.80/integration-with-existing-apps

Update the MainApplication class to implement ReactApplication interface and configure ReactNativeHost with package management, developer support, and new architecture settings. Initialize SoLoader in onCreate() method for native library loading.

```kotlin
// package <your-package-here>

import android.app.Application
import com.facebook.react.PackageList
import com.facebook.react.ReactApplication
import com.facebook.react.ReactHost
import com.facebook.react.ReactNativeHost
import com.facebook.react.ReactPackage
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint.load
import com.facebook.react.defaults.DefaultReactHost.getDefaultReactHost
import com.facebook.react.defaults.DefaultReactNativeHost
import com.facebook.soloader.SoLoader
import com.facebook.react.soloader.OpenSourceMergedSoMapping

class MainApplication : Application(), ReactApplication {

  override val reactNativeHost: ReactNativeHost =
      object : DefaultReactNativeHost(this) {
        override fun getPackages(): List<ReactPackage> = PackageList(this).packages
        override fun getJSMainModuleName(): String = "index"
        override fun getUseDeveloperSupport(): Boolean = BuildConfig.DEBUG
        override val isNewArchEnabled: Boolean = BuildConfig.IS_NEW_ARCHITECTURE_ENABLED
        override val isHermesEnabled: Boolean = BuildConfig.IS_HERMES_ENABLED
      }

  override val reactHost: ReactHost
    get() = getDefaultReactHost(applicationContext, reactNativeHost)

  override fun onCreate() {
    super.onCreate()
    SoLoader.init(this, OpenSourceMergedSoMapping)
    if (BuildConfig.IS_NEW_ARCHITECTURE_ENABLED) {
      load()
    }
  }
}
```

--------------------------------

### Install React Native Library with npm

Source: https://reactnative.dev/docs/0.77/libraries

Install a React Native library from the npm registry using npm CLI. This command adds the specified package to your project's node_modules and updates package.json dependencies. Replace 'react-native-webview' with any desired library name.

```shell
npm install react-native-webview
```

--------------------------------

### AppRegistry.runApplication()

Source: https://reactnative.dev/docs/0.79/appregistry

Runs a previously registered application component. This is invoked by the native system when the app is ready to start.

```APIDOC
## AppRegistry.runApplication()

### Description
Starts execution of a registered React Native application. This method is called by the native system after the JavaScript bundle is loaded.

### Method
Static Method

### Notes
- Called by the native system, not typically called directly from JavaScript
- Must be paired with registerComponent() to register the app first
- The app will run until unmountApplicationComponentAtRootTag is called
```

--------------------------------

### Install bare React Native project dependencies

Source: https://reactnative.dev/docs/0.77/navigation

Install required peer dependencies for React Navigation in a bare React Native project using npm. These packages provide platform-specific UI components and safe area handling.

```shell
npm install react-native-screens react-native-safe-area-context
```

--------------------------------

### Execute Codegen on iOS via CocoaPods

Source: https://reactnative.dev/docs/0.78/turbo-native-modules-introduction

Install dependencies and run pod install from the ios directory to trigger Codegen script phases. Codegen runs automatically as part of the CocoaPods installation process.

```bash
cd ios
bundle install
bundle exec pod install

```

--------------------------------

### useColorScheme Hook Example Application

Source: https://reactnative.dev/docs/0.77/usecolorscheme

Complete example showing how to use the useColorScheme hook in a React Native application. The example retrieves the current color scheme preference and displays it within a SafeAreaView, demonstrating integration with SafeAreaProvider and basic styling. The hook returns 'light', 'dark', or null based on user preference.

```typescript
import React from 'react';
import {Text, StyleSheet, useColorScheme} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const colorScheme = useColorScheme();
  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Text>useColorScheme(): {colorScheme}</Text>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});

export default App;
```

--------------------------------

### Register Custom React Native Package in MainApplication

Source: https://reactnative.dev/docs/0.77/legacy/native-components-android

This example illustrates how to register a custom `ReactPackage` in the `MainApplication` class, ensuring that all custom modules and view managers are initialized and available to the React Native bridge. It provides examples for both Kotlin and Java.

```kotlin
override fun getPackages(): List<ReactPackage> =  
    PackageList(this).packages.apply {  
        // Packages that cannot be autolinked yet can be added manually here, for example:  
        // add(MyReactNativePackage())  
        add(MyAppPackage())  
    }
```

```java
@Override  
protected List<ReactPackage> getPackages() {  
    List<ReactPackage> packages = new PackageList(this).getPackages();  
    // Packages that cannot be autolinked yet can be added manually here, for example:  
    // packages.add(new MyReactNativePackage());  
    packages.add(new MyAppPackage());  
    return packages;  
}
```

--------------------------------

### Install Specific React Native Library Version using npm

Source: https://reactnative.dev/docs/0.78/libraries

This snippet provides the npm command to install a particular version of a React Native library. It is essential when ensuring compatibility with older React Native application versions, as the latest library versions might not always be compatible.

```shell
npm install <library-name>@<version-number>
```

```shell
npm install @react-native-community/netinfo@^2.0.0
```

--------------------------------

### Get rnStartupTiming Type Definition in React Native Performance API

Source: https://reactnative.dev/docs/global-performance

This TypeScript snippet defines the getter for `rnStartupTiming`, a React Native-specific extension to the `performance` object. It returns a `ReactNativeStartupTiming` interface, which provides detailed timing information about the application's startup phases, including when React Native runtime initialization started, bundle execution began, and initialization completed. This property is non-standard and available in Canary/Experimental channels.

```ts
get rnStartupTiming(): ReactNativeStartupTiming;
```

--------------------------------

### React Native Pressable Example with State and Dynamic Styling

Source: https://reactnative.dev/docs/0.77/pressable

This comprehensive example showcases `Pressable` usage within a React Native application, demonstrating interaction tracking and dynamic UI updates. It includes state management with `useState` to count presses, applies dynamic styling based on the `pressed` state, and integrates with `StyleSheet` for defining component styles, providing visual feedback to the user.

```javascript
import React, {useState} from 'react';
import {Pressable, StyleSheet, Text, View} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const [timesPressed, setTimesPressed] = useState(0);

  let textLog = '';
  if (timesPressed > 1) {
    textLog = timesPressed + 'x onPress';
  } else if (timesPressed > 0) {
    textLog = 'onPress';
  }

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Pressable
          onPress={() => {
            setTimesPressed(current => current + 1);
          }}
          style={({pressed}) => [
            {
              backgroundColor: pressed ? 'rgb(210, 230, 255)' : 'white',
            },
            styles.wrapperCustom,
          ]}>
          {({pressed}) => (
            <Text style={styles.text}>{pressed ? 'Pressed!' : 'Press Me'}</Text>
          )}
        </Pressable>
        <View style={styles.logBox}>
          <Text testID="pressable_press_console">{textLog}</Text>
        </View>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
  },
  text: {
    fontSize: 16,
  },
  wrapperCustom: {
    borderRadius: 8,
    padding: 6,
  },
  logBox: {
    padding: 20,
    margin: 10,
    borderWidth: StyleSheet.hairlineWidth,
    borderColor: '#f0f0f0',
    backgroundColor: '#f9f9f9',
  },
});

export default App;
```

--------------------------------

### React Native Vibration Example with Patterns

Source: https://reactnative.dev/docs/0.77/vibration

Complete example demonstrating the Vibration API in React Native with multiple vibration modes including simple vibration, duration-based vibration, pattern-based vibration, and cancellation. The component uses platform-specific logic to show different options for Android and iOS. Requires react-native-safe-area-context package and android.permission.VIBRATE permission on Android.

```javascript
import React from 'react';
import {
  Button,
  Platform,
  Text,
  Vibration,
  View,
  StyleSheet,
} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const Separator = () => {
  return <View style={Platform.OS === 'android' ? styles.separator : null} />;
};

const App = () => {
  const ONE_SECOND_IN_MS = 1000;

  const PATTERN = [
    1 * ONE_SECOND_IN_MS,
    2 * ONE_SECOND_IN_MS,
    3 * ONE_SECOND_IN_MS,
  ];

  const PATTERN_DESC =
    Platform.OS === 'android'
      ? 'wait 1s, vibrate 2s, wait 3s'
      : 'wait 1s, vibrate, wait 2s, vibrate, wait 3s';

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Text style={[styles.header, styles.paragraph]}>Vibration API</Text>
        <View>
          <Button title="Vibrate once" onPress={() => Vibration.vibrate()} />
        </View>
        <Separator />
        {Platform.OS === 'android'
          ? [
              <View>
                <Button
                  title="Vibrate for 10 seconds"
                  onPress={() => Vibration.vibrate(10 * ONE_SECOND_IN_MS)}
                />
              </View>,
              <Separator />,
            ]
          : null}
        <Text style={styles.paragraph}>Pattern: {PATTERN_DESC}</Text>
        <Button
          title="Vibrate with pattern"
          onPress={() => Vibration.vibrate(PATTERN)}
        />
        <Separator />
        <Button
          title="Vibrate with pattern until cancelled"
          onPress={() => Vibration.vibrate(PATTERN, true)}
        />
        <Separator />
        <Button
          title="Stop vibration pattern"
          onPress={() => Vibration.cancel()}
          color="#FF0000"
        />
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingTop: 44,
    padding: 8,
  },
  header: {
    fontSize: 18,
    fontWeight: 'bold',
    textAlign: 'center',
  },
  paragraph: {
    margin: 24,
    textAlign: 'center',
  },
  separator: {
    marginVertical: 8,
    borderBottomColor: '#737373',
    borderBottomWidth: StyleSheet.hairlineWidth,
  },
});

export default App;
```

--------------------------------

### Initialize React Native Project with CLI

Source: https://reactnative.dev/docs/0.77/the-new-architecture/using-codegen

To follow this Codegen guide, a React Native application is required. This command uses the React Native CLI to create a new project named 'SampleApp' with a specific version, which serves as the foundation for Codegen operations.

```bash
npx @react-native-community/cli@latest init SampleApp --version 0.76.0
```

--------------------------------

### Create Two and Three Button Alerts in React Native

Source: https://reactnative.dev/docs/0.77/alert

Complete example demonstrating how to create and display alerts with two and three buttons using the React Native Alert API. Shows button configuration with text, onPress callbacks, and styling options. The example uses SafeAreaView for proper layout and includes a container component with buttons to trigger each alert type.

```JavaScript
import React from 'react';
import {StyleSheet, Button, Alert} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const createTwoButtonAlert = () =>
    Alert.alert('Alert Title', 'My Alert Msg', [
      {
        text: 'Cancel',
        onPress: () => console.log('Cancel Pressed'),
        style: 'cancel',
      },
      {text: 'OK', onPress: () => console.log('OK Pressed')},
    ]);

  const createThreeButtonAlert = () =>
    Alert.alert('Alert Title', 'My Alert Msg', [
      {
        text: 'Ask me later',
        onPress: () => console.log('Ask me later pressed'),
      },
      {
        text: 'Cancel',
        onPress: () => console.log('Cancel Pressed'),
        style: 'cancel',
      },
      {text: 'OK', onPress: () => console.log('OK Pressed')},
    ]);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Button title={'2-Button Alert'} onPress={createTwoButtonAlert} />
        <Button title={'3-Button Alert'} onPress={createThreeButtonAlert} />
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'space-around',
    alignItems: 'center',
  },
});

export default App;
```

--------------------------------

### stagger() - Start Animations with Successive Delays

Source: https://reactnative.dev/docs/0.77/animated

Runs an array of animations in parallel with successive delays between each start. Creates trailing effects by overlapping animations with controlled timing. Each animation starts at an offset time from the previous one.

```typescript
static stagger(
  time: number,
  animations: CompositeAnimation[]
): CompositeAnimation;
```

--------------------------------

### Initialize React Native in Android Application Class (Java/Kotlin)

Source: https://reactnative.dev/docs/0.78/integration-with-existing-apps

This code snippet demonstrates how to update the `MainApplication` class to properly initialize React Native for Android. It includes adding necessary imports, implementing `ReactApplication` to provide `ReactNativeHost` and `ReactHost`, and initializing `SoLoader` and the new architecture entry point within `onCreate`.

```java
package <your-package-here>;

import android.app.Application;
import com.facebook.react.PackageList;
import com.facebook.react.ReactApplication;
import com.facebook.react.ReactHost;
import com.facebook.react.ReactNativeHost;
import com.facebook.react.ReactPackage;
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint;
import com.facebook.react.defaults.DefaultReactHost;
import com.facebook.react.defaults.DefaultReactNativeHost;
import com.facebook.soloader.SoLoader;
import com.facebook.react.soloader.OpenSourceMergedSoMapping;
import java.util.List;

class MainApplication extends Application implements ReactApplication {
 @Override
 public ReactNativeHost getReactNativeHost() {
   return new DefaultReactNativeHost(this) {
     @Override
     protected List<ReactPackage> getPackages() { return new PackageList(this).getPackages(); }
     @Override
     protected String getJSMainModuleName() { return "index"; }
     @Override
     public boolean getUseDeveloperSupport() { return BuildConfig.DEBUG; }
     @Override
     protected boolean isNewArchEnabled() { return BuildConfig.IS_NEW_ARCHITECTURE_ENABLED; }
     @Override
     protected Boolean isHermesEnabled() { return BuildConfig.IS_HERMES_ENABLED; }
   };
 }

 @Override
 public ReactHost getReactHost() {
   return DefaultReactHost.getDefaultReactHost(getApplicationContext(), getReactNativeHost());
 }

  @Override
  public void onCreate() {
    super.onCreate();
   SoLoader.init(this, OpenSourceMergedSoMapping);
   if (BuildConfig.IS_NEW_ARCHITECTURE_ENABLED) {
     DefaultNewArchitectureEntryPoint.load();
   }
  }
}
```

```kotlin
// package <your-package-here>

import android.app.Application
import com.facebook.react.PackageList
import com.facebook.react.ReactApplication
import com.facebook.react.ReactHost
import com.facebook.react.ReactNativeHost
import com.facebook.react.ReactPackage
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint.load
import com.facebook.react.defaults.DefaultReactHost.getDefaultReactHost
import com.facebook.react.defaults.DefaultReactNativeHost
import com.facebook.soloader.SoLoader
import com.facebook.react.soloader.OpenSourceMergedSoMapping

class MainApplication : Application(), ReactApplication {

 override val reactNativeHost: ReactNativeHost =
      object : DefaultReactNativeHost(this) {
        override fun getPackages(): List<ReactPackage> = PackageList(this).packages
        override fun getJSMainModuleName(): String = "index"
        override fun getUseDeveloperSupport(): Boolean = BuildConfig.DEBUG
        override val isNewArchEnabled: Boolean = BuildConfig.IS_NEW_ARCHITECTURE_ENABLED
        override val isHermesEnabled: Boolean = BuildConfig.IS_HERMES_ENABLED
      }


 override val reactHost: ReactHost
   get() = getDefaultReactHost(applicationContext, reactNativeHost)

  override fun onCreate() {
    super.onCreate()
   SoLoader.init(this, OpenSourceMergedSoMapping)
   if (BuildConfig.IS_NEW_ARCHITECTURE_ENABLED) {
     load()
   }
  }
}
```

--------------------------------

### ActionSheetIOS Example - React Native

Source: https://reactnative.dev/docs/0.77/actionsheetios

A complete example demonstrating how to use ActionSheetIOS component with state management. Shows displaying an action sheet with Cancel, Generate number, and Reset options, handling button callbacks, and updating UI state based on user selection. Requires react-native and react-native-safe-area-context dependencies.

```javascript
import React, {useState} from 'react';
import {ActionSheetIOS, Button, StyleSheet, Text} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const [result, setResult] = useState('🔮');

  const onPress = () =>
    ActionSheetIOS.showActionSheetWithOptions(
      {
        options: ['Cancel', 'Generate number', 'Reset'],
        destructiveButtonIndex: 2,
        cancelButtonIndex: 0,
        userInterfaceStyle: 'dark',
      },
      buttonIndex => {
        if (buttonIndex === 0) {
          // cancel action
        } else if (buttonIndex === 1) {
          setResult(String(Math.floor(Math.random() * 100) + 1));
        } else if (buttonIndex === 2) {
          setResult('🔮');
        }
      },
    );

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Text style={styles.result}>{result}</Text>
        <Button onPress={onPress} title="Show Action Sheet" />
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
  },
  result: {
    fontSize: 64,
    textAlign: 'center',
  },
});

export default App;
```

--------------------------------

### Import and Create Custom Dynamic Colors in React Native

Source: https://reactnative.dev/docs/0.80/dynamiccolorios

Demonstrates importing DynamicColorIOS from react-native and creating custom dynamic text colors. Shows two examples: basic dynamic color with light and dark variants, and a more comprehensive example with high contrast mode support for enhanced accessibility.

```typescript
import {DynamicColorIOS} from 'react-native';

const customDynamicTextColor = DynamicColorIOS({
  dark: 'lightskyblue',
  light: 'midnightblue',
});

const customContrastDynamicTextColor = DynamicColorIOS({
  dark: 'darkgray',
  light: 'lightgray',
  highContrastDark: 'black',
  highContrastLight: 'white',
});
```

--------------------------------

### Install CocoaPods with Homebrew

Source: https://reactnative.dev/docs/0.77/integration-with-existing-apps

Installs CocoaPods, a dependency manager for Swift and Objective-C projects, using Homebrew. CocoaPods is crucial for integrating the React Native framework and other native dependencies into the iOS project.

```shell
brew install cocoapods
```

--------------------------------

### Setup ReactViewController to load React Native module

Source: https://reactnative.dev/docs/0.77/integration-with-existing-apps

Configures the ReactViewController to load a React Native module by obtaining the root view factory from RCTAppDelegate and creating a view with the specified module name. This view is then set as the main view of the view controller. Supports both Objective-C and Swift.

```Objective-C
#import "ReactViewController.h"
#import <React-RCTAppDelegate/RCTRootViewFactory.h>
#import <React-RCTAppDelegate/RCTAppDelegate.h>

@interface ReactViewController ()

@end

@implementation ReactViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  RCTRootViewFactory *factory = ((RCTAppDelegate *)RCTSharedApplication().delegate).rootViewFactory;
  self.view = [factory viewWithModuleName:@"HelloWorld"];
}

@end
```

```Swift
import UIKit
import React_RCTAppDelegate

class ReactViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let factory = (RCTSharedApplication()?.delegate as? RCTAppDelegate)?.rootViewFactory
    self.view = factory?.view(withModuleName: "HelloWorld")
  }
}
```

--------------------------------

### Create React Module Info Provider in Kotlin

Source: https://reactnative.dev/docs/0.80/turbo-native-modules-introduction_platforms=ios

Implements BaseReactPackage with getReactModuleInfoProvider method that returns module metadata. This provider registers the NativeLocalStorageModule with Turbo Module support and configuration flags for React Native integration.

```kotlin
class NativeLocalStoragePackage : BaseReactPackage() {

  override fun getModule(name: String, reactContext: ReactApplicationContext): NativeModule? =
    if (name == NativeLocalStorageModule.NAME) {
      NativeLocalStorageModule(reactContext)
    } else {
      null
    }

  override fun getReactModuleInfoProvider() = ReactModuleInfoProvider {
    mapOf(
      NativeLocalStorageModule.NAME to ReactModuleInfo(
        name = NativeLocalStorageModule.NAME,
        className = NativeLocalStorageModule.NAME,
        canOverrideExistingModule = false,
        needsEagerInit = false,
        isCxxModule = false,
        isTurboModule = true
      )
    )
  }
}
```

--------------------------------

### Load shell configuration in Bash

Source: https://reactnative.dev/docs/0.81/set-up-your-environment

Source the bash profile configuration file to load the ANDROID_HOME and PATH settings into the current shell session. Use appropriate command based on shell type (bash or zsh).

```shell
source $HOME/.bash_profile
```

--------------------------------

### Implement React Native Vibration API Features

Source: https://reactnative.dev/docs/0.80/vibration

This React Native component demonstrates various functionalities of the Vibration API. It includes examples for vibrating once, vibrating for a specific duration (Android only), vibrating with a predefined pattern, vibrating with a pattern until cancelled, and stopping active vibrations. The component also showcases basic UI setup with buttons and platform-specific logic for displaying vibration options and patterns.

```javascript
import React from 'react';
import {
  Button,
  Platform,
  Text,
  Vibration,
  View,
  StyleSheet,
} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context;

const Separator = () => {
  return <View style={Platform.OS === 'android' ? styles.separator : null} />;
};

const App = () => {
  const ONE_SECOND_IN_MS = 1000;

  const PATTERN = [
    1 * ONE_SECOND_IN_MS,
    2 * ONE_SECOND_IN_MS,
    3 * ONE_SECOND_IN_MS,
  ];

  const PATTERN_DESC =
    Platform.OS === 'android'
      ? 'wait 1s, vibrate 2s, wait 3s'
      : 'wait 1s, vibrate, wait 2s, vibrate, wait 3s';

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Text style={[styles.header, styles.paragraph]}>Vibration API</Text>
        <View>
          <Button title="Vibrate once" onPress={() => Vibration.vibrate()} />
        </View>
        <Separator />
        {Platform.OS === 'android'
          ? [
              <View>
                <Button
                  title="Vibrate for 10 seconds"
                  onPress={() => Vibration.vibrate(10 * ONE_SECOND_IN_MS)}
                />
              </View>,
              <Separator />,
            ]
          : null}
        <Text style={styles.paragraph}>Pattern: {PATTERN_DESC}</Text>
        <Button
          title="Vibrate with pattern"
          onPress={() => Vibration.vibrate(PATTERN)}
        />
        <Separator />
        <Button
          title="Vibrate with pattern until cancelled"
          onPress={() => Vibration.vibrate(PATTERN, true)}
        />
        <Separator />
        <Button
          title="Stop vibration pattern"
          onPress={() => Vibration.cancel()}
          color="#FF0000"
        />
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingTop: 44,
    padding: 8,
  },
  header: {
    fontSize: 18,
    fontWeight: 'bold',
    textAlign: 'center',
  },
  paragraph: {
    margin: 24,
    textAlign: 'center',
  },
  separator: {
    marginVertical: 8,
    borderBottomColor: '#737373',
    borderBottomWidth: StyleSheet.hairlineWidth,
  },
});

export default App;
```

--------------------------------

### Define React Native Module Package and Info (Java/Kotlin)

Source: https://reactnative.dev/docs/0.79/turbo-native-modules-introduction_language=typescript&platforms=android

These code snippets illustrate how to define a custom React Native package and provide metadata for its native module. The Java example shows the `getReactModuleInfos` method for `ReactModuleInfo`, while the Kotlin example demonstrates a `BaseReactPackage` implementation overriding `getModule` and `getReactModuleInfoProvider` to expose the native module and its properties, including TurboModule status.

```java
      public Map<String, ReactModuleInfo> getReactModuleInfos() {  
        Map<String, ReactModuleInfo> map = new HashMap<>();  
        map.put(NativeLocalStorageModule.NAME, new ReactModuleInfo(  
          NativeLocalStorageModule.NAME,       // name  
          NativeLocalStorageModule.NAME,       // className  
          false, // canOverrideExistingModule  
          false, // needsEagerInit  
          false, // isCXXModule  
          true   // isTurboModule  
        ));  
        return map;  
      }  
    };  
  }
```

```kotlin
package com.nativelocalstorage  
  
import com.facebook.react.BaseReactPackage  
import com.facebook.react.bridge.NativeModule  
import com.facebook.react.bridge.ReactApplicationContext  
import com.facebook.react.module.model.ReactModuleInfo  
import com.facebook.react.module.model.ReactModuleInfoProvider  
  
class NativeLocalStoragePackage : BaseReactPackage() {  
  
  override fun getModule(name: String, reactContext: ReactApplicationContext): NativeModule? =  
    if (name == NativeLocalStorageModule.NAME) {  
      NativeLocalStorageModule(reactContext)  
    } else {  
      null  
    }  
  
  override fun getReactModuleInfoProvider() = ReactModuleInfoProvider {  
    mapOf(  
      NativeLocalStorageModule.NAME to ReactModuleInfo(  
        name = NativeLocalStorageModule.NAME,  
        className = NativeLocalStorageModule.NAME,  
        canOverrideExistingModule = false,  
        needsEagerInit = false,  
        isCxxModule = false,  
        isTurboModule = true  
      )  
    )  
  }  
}
```

--------------------------------

### Setup ReactViewController in Objective-C

Source: https://reactnative.dev/docs/next/integration-with-existing-apps

Creates a ReactViewController class with React Native factory initialization and bundle URL provider. Includes a custom ReactNativeFactoryDelegate that configures the JavaScript bundle URL for both debug and release builds. The factory creates a root view with the specified module name.

```objectivec
#import "ReactViewController.h"
#import <React/RCTBundleURLProvider.h>
#import <RCTReactNativeFactory.h>
#import <RCTDefaultReactNativeFactoryDelegate.h>
#import <RCTAppDependencyProvider.h>

@interface ReactViewController ()

@end

@interface ReactNativeFactoryDelegate: RCTDefaultReactNativeFactoryDelegate
@end

@implementation ReactViewController {
  RCTReactNativeFactory *_factory;
  id<RCTReactNativeFactoryDelegate> _factoryDelegate;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  _factoryDelegate = [ReactNativeFactoryDelegate new];
  _factoryDelegate.dependencyProvider = [RCTAppDependencyProvider new];
  _factory = [[RCTReactNativeFactory alloc] initWithDelegate:_factoryDelegate];
  self.view = [_factory.rootViewFactory viewWithModuleName:@"HelloWorld"];
}

@end

@implementation ReactNativeFactoryDelegate

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
  return [self bundleURL];
}

- (NSURL *)bundleURL
{
#if DEBUG
  return [RCTBundleURLProvider.sharedSettings jsBundleURLForBundleRoot:@"index"];
#else
  return [NSBundle.mainBundle URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
```

--------------------------------

### Reinstall CocoaPods for iOS Native Dependencies

Source: https://reactnative.dev/docs/0.79/the-new-architecture/create-module-library

Command to reinstall CocoaPods dependencies on iOS after installing a new React Native module with native code. The recommended approach uses bundle exec for Ruby Bundler, but pod install can be used as a fallback if Bundler is not available.

```bash
bundle exec pod install
```

```bash
pod install
```

--------------------------------

### Initialize React Native Application with SoLoader - Kotlin

Source: https://reactnative.dev/docs/0.77/turbo-native-modules-introduction

Implements the onCreate lifecycle method to initialize SoLoader for loading native libraries and conditionally loads the native entry point when new architecture is enabled. This setup is required for React Native applications to properly load native modules and bridge communication.

```kotlin
override fun onCreate() {
  super.onCreate()
  SoLoader.init(this, false)
  if (BuildConfig.IS_NEW_ARCHITECTURE_ENABLED) {
    // If you opted-in for the New Architecture, we load the native entry point for this app.
    load()
  }
}
```

--------------------------------

### Implement React Native ViewManager Subclass for Android

Source: https://reactnative.dev/docs/0.78/legacy/native-components-android

This snippet demonstrates how to create a `ViewManager` subclass for React Native on Android. It shows how to define view properties (`width`, `height`), handle commands from JavaScript to create and manage native fragments within a `FrameLayout`, and manually layout children. The code includes implementations in both Kotlin and Java, illustrating the setup for exposing native Android UI components to React Native. Note that the Java example provided is truncated.

```kotlin
// replace with your package  
package com.mypackage  
  
import android.view.Choreographer  
import android.view.View  
import android.view.ViewGroup  
import android.widget.FrameLayout  
import androidx.fragment.app.FragmentActivity  
import com.facebook.react.bridge.ReactApplicationContext  
import com.facebook.react.bridge.ReadableArray  
import com.facebook.react.uimanager.ThemedReactContext  
import com.facebook.react.uimanager.ViewGroupManager  
import com.facebook.react.uimanager.annotations.ReactPropGroup  
  
class MyViewManager(  
    private val reactContext: ReactApplicationContext  
) : ViewGroupManager<FrameLayout>() {  
  private var propWidth: Int? = null  
  private var propHeight: Int? = null  
  
  override fun getName() = REACT_CLASS  
  
  /**  
   * Return a FrameLayout which will later hold the Fragment  
   */  
  override fun createViewInstance(reactContext: ThemedReactContext) =  
      FrameLayout(reactContext)  
  
  /**  
   * Map the "create" command to an integer  
   */  
  override fun getCommandsMap() = mapOf("create" to COMMAND_CREATE)  
  
  /**  
   * Handle "create" command (called from JS) and call createFragment method  
   */  
  override fun receiveCommand(  
      root: FrameLayout,  
      commandId: String,  
      args: ReadableArray?  
  ) {  
    super.receiveCommand(root, commandId, args)  
    val reactNativeViewId = requireNotNull(args).getInt(0)  
  
    when (commandId.toInt()) {  
      COMMAND_CREATE -> createFragment(root, reactNativeViewId)  
    }  
  }
  
  @ReactPropGroup(names = ["width", "height"], customType = "Style")  
  fun setStyle(view: FrameLayout, index: Int, value: Int) {  
    if (index == 0) propWidth = value  
    if (index == 1) propHeight = value  
  }  
  
  /**  
   * Replace your React Native view with a custom fragment  
   */  
  fun createFragment(root: FrameLayout, reactNativeViewId: Int) {  
    val parentView = root.findViewById<ViewGroup>(reactNativeViewId)  
    setupLayout(parentView)  
  
    val myFragment = MyFragment()  
    val activity = reactContext.currentActivity as FragmentActivity  
    activity.supportFragmentManager  
        .beginTransaction()  
        .replace(reactNativeViewId, myFragment, reactNativeViewId.toString())  
        .commit()  
  }  
  
  fun setupLayout(view: View) {  
    Choreographer.getInstance().postFrameCallback(object: Choreographer.FrameCallback {  
      override fun doFrame(frameTimeNanos: Long) {  
        manuallyLayoutChildren(view)  
        view.viewTreeObserver.dispatchOnGlobalLayout()  
        Choreographer.getInstance().postFrameCallback(this)  
      }  
    })  
  }  
  
  /**  
   * Layout all children properly  
   */  
  private fun manuallyLayoutChildren(view: View) {  
    // propWidth and propHeight coming from react-native props  
    val width = requireNotNull(propWidth)  
    val height = requireNotNull(propHeight)  
  
    view.measure(  
        View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),  
        View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY))  
  
    view.layout(0, 0, width, height)  
  }  
  
  companion object {  
    private const val REACT_CLASS = "MyViewManager"  
    private const val COMMAND_CREATE = 1  
  }  
}
```

```java
// replace with your package  
package com.mypackage;  
  
import android.view.Choreographer;  
import android.view.View;  
import android.view.ViewGroup;  
import android.widget.FrameLayout;  
  
import androidx.annotation.NonNull;  
import androidx.annotation.Nullable;  
import androidx.fragment.app.FragmentActivity;  
  
import com.facebook.react.bridge.ReactApplicationContext;  
import com.facebook.react.bridge.ReadableArray;  
import com.facebook.react.common.MapBuilder;  
import com.facebook.react.uimanager.annotations.ReactProp;  
import com.facebook.react.uimanager.annotations.ReactPropGroup;  
import com.facebook.react.uimanager.ViewGroupManager;  
import com.facebook.react.uimanager.ThemedReactContext;  
  
import java.util.Map;  
  
public class MyViewManager extends ViewGroupManager<FrameLayout> {  
  
  public static final String REACT_CLASS = "MyViewManager";  
  public final int COMMAND_CREATE = 1;  
  private int propWidth;  
  private int propHeight;  
  
  ReactApplicationContext reactContext;  
  
  public MyViewManager(ReactApplicationContext reactContext) {  
    this.reactContext = reactContext;  
  }  
  
  @Override  
  public String getName() {  
    return REACT_CLASS;  
  }  
  
  /**  
   * Return a FrameLayout which will later hold the Fragment  
   */  
  @Override  
  public FrameLayout createViewInstance(ThemedReactContext reactContext) {  
    return new FrameLayout(reactContext);  
  }  
  
  /**  
   * Map the "create" command to an integer  
   */  
  @Nullable  
  @Override  
  public Map<String, Integer> getCommandsMap() {  

```

--------------------------------

### Example Promise Rejection in Native Module

Source: https://reactnative.dev/docs/0.78/legacy/native-modules-android

This example demonstrates a specific `promise.reject` call in a React Native native module for Java and Kotlin. It shows how to provide a custom error code, message, and the original exception to the JavaScript layer for comprehensive error handling.

```java
promise.reject("Create Event error", "Error parsing date", e);  
```

```kotlin
promise.reject("Create Event error", "Error parsing date", e)  
```

--------------------------------

### Install TypeScript Dependencies with npm

Source: https://reactnative.dev/docs/next/typescript

Add TypeScript, type definitions, and ESLint plugins to an existing React Native project using npm. Installs typescript, @react-native/typescript-config, and type packages for Jest, React, and react-test-renderer.

```shell
npm install -D typescript @react-native/typescript-config @types/jest @types/react @types/react-test-renderer
```

--------------------------------

### Illustrating useMemo Re-execution with React Fast Refresh

Source: https://reactnative.dev/docs/fast-refresh

This example demonstrates how `useMemo` hooks are re-executed during Fast Refresh, even when their declared dependencies have not changed. This ensures that modifications to the memoized calculation (e.g., changing `x * 2` to `x * 10`) are immediately applied in the UI.

```javascript
useMemo(() => x * 2, [x])
```

```javascript
useMemo(() => x * 10, [x])
```

--------------------------------

### ActivityIndicator React Native Loading Spinner Example

Source: https://reactnative.dev/docs/0.77/activityindicator

Demonstrates how to use the ActivityIndicator component with various size and color configurations. The example renders multiple indicators within a SafeAreaView with flexbox layout. It requires react-native and react-native-safe-area-context packages.

```javascript
import React from 'react';
import {ActivityIndicator, StyleSheet} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={[styles.container, styles.horizontal]}>
      <ActivityIndicator />
      <ActivityIndicator size="large" />
      <ActivityIndicator size="small" color="#0000ff" />
      <ActivityIndicator size="large" color="#00ff00" />
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
  },
  horizontal: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    padding: 10,
  },
});

export default App;
```

--------------------------------

### Callback: onStartShouldSetResponderCapture

Source: https://reactnative.dev/docs/next/view

Allows a parent View to prevent a child View from becoming the responder on a touch start.

```APIDOC
## onStartShouldSetResponderCapture

### Description
If a parent `View` wants to prevent a child `View` from becoming responder on a touch start, it should have this handler which returns `true`.

### Type
`({nativeEvent: PressEvent}) => boolean`

### Arguments
- **nativeEvent** (object) - Required - Contains details about the event.
  - **PressEvent** (object) - Required - The press event object.

### Response
#### Success Response (boolean)
- Returns `true` to prevent child views from becoming the responder; otherwise, `false`.
```

--------------------------------

### onMomentumScrollBegin

Source: https://reactnative.dev/docs/0.81/scrollview

Called when the momentum scroll starts (scroll which occurs as the ScrollView starts gliding).

```APIDOC
## onMomentumScrollBegin

### Description
Called when the momentum scroll starts (scroll which occurs as the ScrollView starts gliding).

### Type
`function`
```

--------------------------------

### Define React Native Package and Module Information (Android)

Source: https://reactnative.dev/docs/0.77/turbo-native-modules-introduction_language=typescript&platforms=ios

These code snippets demonstrate how to define a custom `ReactPackage` for an Android native module. The Java example shows the `getReactModuleInfos` method within a package, while the Kotlin example provides a complete `BaseReactPackage` implementation, both registering `NativeLocalStorageModule` and specifying its properties like `isTurboModule`.

```java
public Map<String, ReactModuleInfo> getReactModuleInfos() {
  Map<String, ReactModuleInfo> map = new HashMap<>();
  map.put(NativeLocalStorageModule.NAME, new ReactModuleInfo(
    NativeLocalStorageModule.NAME,       // name
    NativeLocalStorageModule.NAME,       // className
    false, // canOverrideExistingModule
    false, // needsEagerInit
    false, // isCXXModule
    true   // isTurboModule
  ));
  return map;
}
```

```kotlin
package com.nativelocalstorage

import com.facebook.react.BaseReactPackage
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.model.ReactModuleInfo
import com.facebook.react.module.model.ReactModuleInfoProvider

class NativeLocalStoragePackage : BaseReactPackage() {

  override fun getModule(name: String, reactContext: ReactApplicationContext): NativeModule? =
    if (name == NativeLocalStorageModule.NAME) {
      NativeLocalStorageModule(reactContext)
    } else {
      null
    }

  override fun getReactModuleInfoProvider() = ReactModuleInfoProvider {
    mapOf(
      NativeLocalStorageModule.NAME to ReactModuleInfo(
        _name = NativeLocalStorageModule.NAME,
        _className = NativeLocalStorageModule.NAME,
        _canOverrideExistingModule = false,
        _needsEagerInit = false,
        isCxxModule = false,
        isTurboModule = true
      )
    )
  }
}
```

--------------------------------

### startHeadlessTask() - Start Background Task

Source: https://reactnative.dev/docs/0.80/appregistry

Starts a headless task that runs in the background without a UI component. This method is typically called from native code to execute background operations.

```APIDOC
## startHeadlessTask()

### Description
Starts a headless task that runs in the background. This method is typically called from native code only.

### Method
STATIC

### Signature
```typescript
static startHeadlessTask(
  taskId: number,
  taskKey: string,
  data: any
): void;
```

### Parameters
#### Required Parameters
- **taskId** (number) - Required - The native id for this task instance to keep track of its execution
- **taskKey** (string) - Required - The key for the task to start
- **data** (any) - Required - The data to pass to the task

### Returns
void
```

--------------------------------

### Start iOS Simulator with npm

Source: https://reactnative.dev/docs/0.78/running-on-simulator-ios

Launches the React Native app in the default iOS Simulator (iPhone 14) using npm. Run this command from the project directory after initializing a React Native project.

```shell
npm run ios
```

--------------------------------

### Start Metro bundler for React Native development

Source: https://reactnative.dev/docs/0.77/integration-with-existing-apps

These shell commands initiate the Metro bundler, which compiles your application code into a bundle and serves it locally. This is a crucial step for development, allowing your app on a simulator or device to load JavaScript code and enable hot reloading.

```shell
npm start
```

```shell
yarn start
```

--------------------------------

### Configure Node Executable and Arguments

Source: https://reactnative.dev/docs/0.77/react-native-gradle-plugin

Specifies the node command and arguments to invoke for all scripts. Default is [node]. Use this to add extra flags or custom node configurations for your build process.

```groovy
nodeExecutableAndArgs = ["node"]
```

--------------------------------

### ViewToken Object Structure Example

Source: https://reactnative.dev/docs/0.78/viewtoken

Example structure of a ViewToken object returned in onViewableItemsChanged callbacks. Shows the typical properties including item data, key identifier, numeric index, and isViewable boolean flag indicating viewport visibility.

```javascript
{
  item: {key: "key-12"},
  key: "key-12",
  index: 11,
  isViewable: true
}
```

--------------------------------

### Animated.start()

Source: https://reactnative.dev/docs/0.77/animated

Starts any animation. Takes a completion callback that will be called when the animation is done or when stop() was called before it could finish.

```APIDOC
## Animated.start()

### Description
Animations are started by calling start() on your animation. start() takes a completion callback that will be called when the animation is done or when the animation is done because stop() was called on it before it could finish.

### Method
STATIC

### Signature
```typescript
static start(callback?: (result: {finished: boolean}) => void);
```

### Parameters
#### Function Parameters
- **callback** ((result: {finished: boolean}) => void) - Optional - Function that will be called after the animation finished running normally or when the animation is done because stop() was called on it before it could finish

### Returns
Void

### Request Example
```typescript
Animated.timing(animValue, {toValue: 100, duration: 500}).start(({finished}) => {
  if (finished) {
    console.log('Animation completed successfully');
  } else {
    console.log('Animation was stopped');
  }
});
```
```

--------------------------------

### Configure Extra Packager Arguments

Source: https://reactnative.dev/docs/0.77/react-native-gradle-plugin

Defines a list of extra flags to pass to the bundle command. Default is empty. Refer to CLI documentation for available flags to customize bundling behavior.

```groovy
extraPackagerArgs = []
```

--------------------------------

### React Native AppState Change Listener Example

Source: https://reactnative.dev/docs/0.77/appstate

This React Native example demonstrates how to monitor and display changes in the application's state (e.g., active, background). It uses `AppState.addEventListener` to subscribe to state changes and React's `useState` and `useEffect` hooks to manage and update the UI based on the current app state.

```javascript
import React, {useRef, useState, useEffect} from 'react';
import {AppState, StyleSheet, Text} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const AppStateExample = () => {
  const appState = useRef(AppState.currentState);
  const [appStateVisible, setAppStateVisible] = useState(appState.current);

  useEffect(() => {
    const subscription = AppState.addEventListener('change', nextAppState => {
      if (
        appState.current.match(/inactive|background/) &&
        nextAppState === 'active'
      ) {
        console.log('App has come to the foreground!');
      }

      appState.current = nextAppState;
      setAppStateVisible(appState.current);
      console.log('AppState', appState.current);
    });

    return () => {
      subscription.remove();
    };
  }, []);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Text>Current state is: {appStateVisible}</Text>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});

export default AppStateExample;
```

--------------------------------

### Prop: onStartShouldSetResponderCapture

Source: https://reactnative.dev/docs/0.81/text

If a parent `View` wants to intercept touch start events from its children, it should implement this handler and return `true`.

```APIDOC
## Prop: onStartShouldSetResponderCapture

### Description
If a parent `View` wants to prevent a child `View` from becoming a responder on a touch start, it should have this handler which returns `true`.

### Type
`({nativeEvent: PressEvent}) => boolean`
```

--------------------------------

### Invoke a Callback from a native method and consume in JavaScript

Source: https://reactnative.dev/docs/legacy/native-modules-android

This example shows how to invoke a `Callback` from within a native Java or Kotlin method, passing serializable data (like an `eventId`) back to JavaScript. The JavaScript example demonstrates how to consume this data when the native method completes.

```java
  @ReactMethod
   public void createCalendarEvent(String name, String location, Callback callBack) {
       Integer eventId = ...
       callBack.invoke(eventId);
   }
```

```kotlin
  @ReactMethod
  fun createCalendarEvent(name: String, location: String, callback: Callback) {
      val eventId = ...
      callback.invoke(eventId)
  }
```

```tsx
const onPress = () => {
  CalendarModule.createCalendarEvent(
    'Party',
    'My House',
    eventId => {
      console.log(`Created a new event with id ${eventId}`);
    },
  );
};
```

--------------------------------

### React Native TouchableHighlight Counter Example

Source: https://reactnative.dev/docs/0.77/touchablehighlight

This comprehensive React Native example showcases `TouchableHighlight` to create a simple counter button. It includes state management with `useState`, applies styling using `StyleSheet.create`, and demonstrates wrapping the touchable area in a `View` for custom styling. The `onPress` handler increments a counter displayed on the screen.

```javascript
import React, {useState} from 'react';
import {StyleSheet, Text, TouchableHighlight, View} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const TouchableHighlightExample = () => {
  const [count, setCount] = useState(0);
  const onPress = () => setCount(count + 1);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <TouchableHighlight onPress={onPress}>
          <View style={styles.button}>
            <Text>Touch Here</Text>
          </View>
        </TouchableHighlight>
        <View style={styles.countContainer}>
          <Text style={styles.countText}>{count || null}</Text>
        </View>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: 10,
  },
  button: {
    alignItems: 'center',
    backgroundColor: '#DDDDDD',
    padding: 10,
  },
  countContainer: {
    alignItems: 'center',
    padding: 10,
  },
  countText: {
    color: '#FF00FF',
  },
});

export default TouchableHighlightExample;
```

--------------------------------

### ScrollView snapToStart Property Configuration

Source: https://reactnative.dev/docs/scrollview

Controls whether the beginning of a scrollable list counts as a snap offset. Use with snapToOffsets to disable automatic snapping at the list start. Set to false to allow free scrolling between the start and the first snapToOffsets offset.

```typescript
snapToStart={true}
```

--------------------------------

### Check ccache Build Statistics

Source: https://reactnative.dev/docs/0.78/build-speed

After performing builds, run this command to view the `ccache` summary statistics, including cache hits, misses, and cache size. This helps verify if `ccache` is effectively caching your compilation processes.

```shell
ccache -s
```

--------------------------------

### Make a simple GET request using Fetch API in React Native

Source: https://reactnative.dev/docs/network

This code demonstrates the most basic usage of the Fetch API to retrieve content from a specified URL. It performs a GET request without any custom configuration, suitable for fetching static resources.

```tsx
fetch('https://mywebsite.com/mydata.json');
```

--------------------------------

### React Native Android Image Picker Module Example

Source: https://reactnative.dev/docs/0.77/legacy/native-modules-android

This comprehensive example showcases a `ImagePickerModule` that allows JavaScript to pick an image from the device's gallery. It uses `startActivityForResult` to launch the image picker and processes the selected image URI within the `onActivityResult` method, resolving a promise with the result.

```java
public class ImagePickerModule extends ReactContextBaseJavaModule {  
  
  private static final int IMAGE_PICKER_REQUEST = 1;  
  private static final String E_ACTIVITY_DOES_NOT_EXIST = "E_ACTIVITY_DOES_NOT_EXIST";  
  private static final String E_PICKER_CANCELLED = "E_PICKER_CANCELLED";  
  private static final String E_FAILED_TO_SHOW_PICKER = "E_FAILED_TO_SHOW_PICKER";  
  private static final String E_NO_IMAGE_DATA_FOUND = "E_NO_IMAGE_DATA_FOUND";  
  
  private Promise mPickerPromise;  
  
  private final ActivityEventListener mActivityEventListener = new BaseActivityEventListener() {  
  
    @Override  
    public void onActivityResult(Activity activity, int requestCode, int resultCode, Intent intent) {  
      if (requestCode == IMAGE_PICKER_REQUEST) {  
        if (mPickerPromise != null) {  
          if (resultCode == Activity.RESULT_CANCELED) {  
            mPickerPromise.reject(E_PICKER_CANCELLED, "Image picker was cancelled");  
          } else if (resultCode == Activity.RESULT_OK) {  
            Uri uri = intent.getData();  
  
            if (uri == null) {  
              mPickerPromise.reject(E_NO_IMAGE_DATA_FOUND, "No image data found");  
            } else {  
              mPickerPromise.resolve(uri.toString());  
            }  
          }  
  
          mPickerPromise = null;  
        }  
      }  
    }  
  };  
  
  ImagePickerModule(ReactApplicationContext reactContext) {  
    super(reactContext);  
  
    // Add the listener for `onActivityResult`  
    reactContext.addActivityEventListener(mActivityEventListener);  
  }
  
  @Override  
  public String getName() {  
    return "ImagePickerModule";  
  }
  
  @ReactMethod  
  public void pickImage(final Promise promise) {  
    Activity currentActivity = getCurrentActivity();  
  
    if (currentActivity == null) {  
      promise.reject(E_ACTIVITY_DOES_NOT_EXIST, "Activity doesn't exist");  
      return;  
    }  
  
    // Store the promise to resolve/reject when picker returns data  
    mPickerPromise = promise;  
  
    try {  
      final Intent galleryIntent = new Intent(Intent.ACTION_PICK);  
  
      galleryIntent.setType("image/*");  
  
      final Intent chooserIntent = Intent.createChooser(galleryIntent, "Pick an image");  
  
      currentActivity.startActivityForResult(chooserIntent, IMAGE_PICKER_REQUEST);  
    } catch (Exception e) {  
      mPickerPromise.reject(E_FAILED_TO_SHOW_PICKER, e);  
      mPickerPromise = null;  
    }  
  }  
}  
```

```kotlin
class ImagePickerModule(reactContext: ReactApplicationContext) :  
    ReactContextBaseJavaModule(reactContext) {  
  
    private var pickerPromise: Promise? = null  
  
    private val activityEventListener =  
        object : BaseActivityEventListener() {  
            override fun onActivityResult(  
                activity: Activity?,  
                requestCode: Int,  
                resultCode: Int,  
                intent: Intent?  
            ) {  
                if (requestCode == IMAGE_PICKER_REQUEST) {  
                    pickerPromise?.let { promise ->  
                        when (resultCode) {  
                            Activity.RESULT_CANCELED ->  
                                promise.reject(E_PICKER_CANCELLED, "Image picker was cancelled")  
                            Activity.RESULT_OK -> {  
                                val uri = intent?.data  
  
                                uri?.let { promise.resolve(uri.toString())}  
                                    ?: promise.reject(E_NO_IMAGE_DATA_FOUND, "No image data found")  
                            }  
                        }  
  
                        pickerPromise = null  

```

--------------------------------

### Example Obfuscated React Native Android Stack Trace

Source: https://reactnative.dev/docs/next/debugging-release-builds

An illustrative example of an unhandled exception stack trace from a React Native Android release build. It demonstrates the typical obfuscated output with minified function names and bytecode offsets, which are difficult to interpret without symbolication.

```shell
07-15 10:58:25.820 18979 18998 E AndroidRuntime: FATAL EXCEPTION: mqt_native_modules  
07-15 10:58:25.820 18979 18998 E AndroidRuntime: Process: com.awesomeproject, PID: 18979 07-15 10:58:25.820 18979 18998 E AndroidRuntime: com.facebook.react.common.JavascriptException: Failed, js engine: hermes, stack:  
07-15 10:58:25.820 18979 18998 E AndroidRuntime: p@1:132161  
07-15 10:58:25.820 18979 18998 E AndroidRuntime: p@1:132084  
07-15 10:58:25.820 18979 18998 E AndroidRuntime: f@1:131854  
07-15 10:58:25.820 18979 18998 E AndroidRuntime: anonymous@1:131119  

```

--------------------------------

### Use ECMAScript 2017 Async/Await Functions in JavaScript

Source: https://reactnative.dev/docs/0.77/javascript-environment

Demonstrates the `async`/`await` syntax for writing asynchronous code that looks and behaves like synchronous code, improving readability and error handling for promises.

```JavaScript
async function doStuffAsync() {const foo = await doOtherStuffAsync();};
```

--------------------------------

### Install Expo managed project dependencies

Source: https://reactnative.dev/docs/0.77/navigation

Install required peer dependencies for React Navigation in an Expo managed project using the expo CLI. These packages provide platform-specific UI components and safe area handling.

```shell
npx expo install react-native-screens react-native-safe-area-context
```

--------------------------------

### Property: selection

Source: https://reactnative.dev/docs/0.78/textinput

Controls the start and end positions of the text input's selection. Setting start and end to the same value will position the cursor.

```APIDOC
## Property: selection

### Description
The start and end of the text input's selection. Set start and end to the same value to position the cursor.

### Type
object: `{start: number, end: number}`
```

--------------------------------

### Configure React Native in Android MainApplication (Java & Kotlin)

Source: https://reactnative.dev/docs/0.79/integration-with-existing-apps

These code snippets demonstrate how to modify the `MainApplication` class in an Android React Native project. They ensure proper initialization of React Native by implementing the `ReactApplication` interface, defining `ReactNativeHost` and `ReactHost` instances, and setting up `SoLoader` with conditional loading for the New Architecture and Hermes engine. This setup is crucial for React Native to function correctly within the Android application lifecycle.

```java
package <your-package-here>;

import android.app.Application;
import com.facebook.react.PackageList;
import com.facebook.react.ReactApplication;
import com.facebook.react.ReactHost;
import com.facebook.react.ReactNativeHost;
import com.facebook.react.ReactPackage;
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint;
import com.facebook.react.defaults.DefaultReactHost;
import com.facebook.react.defaults.DefaultReactNativeHost;
import com.facebook.soloader.SoLoader;
import com.facebook.react.soloader.OpenSourceMergedSoMapping;
import java.util.List;

class MainApplication extends Application implements ReactApplication {
  @Override
  public ReactNativeHost getReactNativeHost() {
    return new DefaultReactNativeHost(this) {
      @Override
      protected List<ReactPackage> getPackages() { return new PackageList(this).getPackages(); }
      @Override
      protected String getJSMainModuleName() { return "index"; }
      @Override
      public boolean getUseDeveloperSupport() { return BuildConfig.DEBUG; }
      @Override
      protected boolean isNewArchEnabled() { return BuildConfig.IS_NEW_ARCHITECTURE_ENABLED; }
      @Override
      protected Boolean isHermesEnabled() { return BuildConfig.IS_HERMES_ENABLED; }
    };
  }

  @Override
  public ReactHost getReactHost() {
    return DefaultReactHost.getDefaultReactHost(getApplicationContext(), getReactNativeHost());
  }

  @Override
  public void onCreate() {
    super.onCreate();
    SoLoader.init(this, OpenSourceMergedSoMapping);
    if (BuildConfig.IS_NEW_ARCHITECTURE_ENABLED) {
      DefaultNewArchitectureEntryPoint.load();
    }
  }
}
```

```kotlin
import android.app.Application
import com.facebook.react.PackageList
import com.facebook.react.ReactApplication
import com.facebook.react.ReactHost
import com.facebook.react.ReactNativeHost
import com.facebook.react.ReactPackage
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint.load
import com.facebook.react.defaults.DefaultReactHost.getDefaultReactHost
import com.facebook.react.defaults.DefaultReactNativeHost
import com.facebook.soloader.SoLoader
import com.facebook.react.soloader.OpenSourceMergedSoMapping

class MainApplication : Application(), ReactApplication {

 override val reactNativeHost: ReactNativeHost =
      object : DefaultReactNativeHost(this) {
        override fun getPackages(): List<ReactPackage> = PackageList(this).packages
        override fun getJSMainModuleName(): String = "index"
        override fun getUseDeveloperSupport(): Boolean = BuildConfig.DEBUG
        override val isNewArchEnabled: Boolean = BuildConfig.IS_NEW_ARCHITECTURE_ENABLED
        override val isHermesEnabled: Boolean = BuildConfig.IS_HERMES_ENABLED
      }

 override val reactHost: ReactHost
   get() = getDefaultReactHost(applicationContext, reactNativeHost)

  override fun onCreate() {
    super.onCreate()
    SoLoader.init(this, OpenSourceMergedSoMapping)
    if (BuildConfig.IS_NEW_ARCHITECTURE_ENABLED) {
      load()
    }
  }
}
```

--------------------------------

### Initialize React Native Application Class - Java

Source: https://reactnative.dev/docs/0.77/integration-with-existing-apps

Implement ReactApplication interface in Java Application class with ReactNativeHost configuration, package loading, and SoLoader initialization. This enables React Native to load packages dynamically and support both legacy and new architecture modes.

```java
package <your-package-here>;

import android.app.Application;
import com.facebook.react.PackageList;
import com.facebook.react.ReactApplication;
import com.facebook.react.ReactHost;
import com.facebook.react.ReactNativeHost;
import com.facebook.react.ReactPackage;
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint;
import com.facebook.react.defaults.DefaultReactHost;
import com.facebook.react.defaults.DefaultReactNativeHost;
import com.facebook.soloader.SoLoader;
import com.facebook.react.soloader.OpenSourceMergedSoMapping;
import java.util.List;

class MainApplication extends Application implements ReactApplication {
  @Override
  public ReactNativeHost getReactNativeHost() {
    return new DefaultReactNativeHost(this) {
      @Override
      protected List<ReactPackage> getPackages() { return new PackageList(this).getPackages(); }
      @Override
      protected String getJSMainModuleName() { return "index"; }
      @Override
      public boolean getUseDeveloperSupport() { return BuildConfig.DEBUG; }
      @Override
      protected boolean isNewArchEnabled() { return BuildConfig.IS_NEW_ARCHITECTURE_ENABLED; }
      @Override
      protected Boolean isHermesEnabled() { return BuildConfig.IS_HERMES_ENABLED; }
    };
  }

  @Override
  public ReactHost getReactHost() {
    return DefaultReactHost.getDefaultReactHost(getApplicationContext(), getReactNativeHost());
  }

  @Override
  public void onCreate() {
    super.onCreate();
    SoLoader.init(this, OpenSourceMergedSoMapping);
    if (BuildConfig.IS_NEW_ARCHITECTURE_ENABLED) {
      DefaultNewArchitectureEntryPoint.load();
    }
  }
}
```

--------------------------------

### React Native `PanResponder` Hook-based Usage Example

Source: https://reactnative.dev/docs/next/panresponder

This comprehensive example illustrates the creation and configuration of a `PanResponder` within a React Native functional component using the `useRef` hook. It defines all key callback functions, such as `onStartShouldSetPanResponder` for gesture initiation and `onPanResponderMove` for tracking. Finally, it demonstrates how to apply the `panHandlers` to a `View` component to enable gesture recognition.

```tsx
const ExampleComponent = () => {  
  const panResponder = React.useRef(  
    PanResponder.create({  
      // Ask to be the responder:  
      onStartShouldSetPanResponder: (evt, gestureState) => true,  
      onStartShouldSetPanResponderCapture: (evt, gestureState) =>  
        true,  
      onMoveShouldSetPanResponder: (evt, gestureState) => true,  
      onMoveShouldSetPanResponderCapture: (evt, gestureState) =>  
        true,  
  
      onPanResponderGrant: (evt, gestureState) => {  
        // The gesture has started. Show visual feedback so the user knows  
        // what is happening!  
        // gestureState.d{x,y} will be set to zero now  
      },  
      onPanResponderMove: (evt, gestureState) => {  
        // The most recent move distance is gestureState.move{X,Y}  
        // The accumulated gesture distance since becoming responder is  
        // gestureState.d{x,y}  
      },  
      onPanResponderTerminationRequest: (evt, gestureState) =>  
        true,  
      onPanResponderRelease: (evt, gestureState) => {  
        // The user has released all touches while this view is the  
        // responder. This typically means a gesture has succeeded  
      },  
      onPanResponderTerminate: (evt, gestureState) => {  
        // Another component has become the responder, so this gesture  
        // should be cancelled  
      },  
      onShouldBlockNativeResponder: (evt, gestureState) => {  
        // Returns whether this component should block native components from becoming the JS  
        // responder. Returns true by default. Is currently only supported on android.  
        return true;  
      }  
    })  
  ).current;  
  
  return <View {...panResponder.panHandlers} />;
};
```

--------------------------------

### Configure React Native Host with TurboModule Packages - Kotlin

Source: https://reactnative.dev/docs/0.77/turbo-native-modules-introduction

Initializes the DefaultReactNativeHost with package registration for custom TurboModules like NativeLocalStorage. Configures developer support based on build type, enables Hermes engine, and loads native entry points for new architecture. Returns a list of ReactPackage instances that can be manually extended with additional packages.

```kotlin
object : DefaultReactNativeHost(this) {
  override fun getPackages(): List<ReactPackage> =
      PackageList(this).packages.apply {
        // Packages that cannot be autolinked yet can be added manually here, for example:
        // add(MyReactNativePackage())
        add(NativeLocalStoragePackage())
      }

  override fun getJSMainModuleName(): String = "index"

  override fun getUseDeveloperSupport(): Boolean = BuildConfig.DEBUG

  override val isNewArchEnabled: Boolean = BuildConfig.IS_NEW_ARCHITECTURE_ENABLED
  override val isHermesEnabled: Boolean = BuildConfig.IS_HERMES_ENABLED
}
```

--------------------------------

### Migrate Codegen Type Imports in React Native to Strict API

Source: https://reactnative.dev/docs/next/strict-typescript-api

These code examples illustrate the migration path for codegen-related types and functions in React Native when transitioning to the Strict TypeScript API. The "Before" example shows deep imports from `react-native/Libraries`, while the "After" example demonstrates direct imports of `CodegenTypes` and `codegenNativeComponent` from the `react-native` package, aligning with the new API structure and removing deep imports.

```typescript
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';  
import type {  
  Int32,  
  WithDefault,  
} from 'react-native/Libraries/Types/CodegenTypes';  
  
interface NativeProps extends ViewProps {  
  enabled?: WithDefault<boolean, true>;  
  size?: Int32;  
}  
  
export default codegenNativeComponent<NativeProps>(  
  'RNCustomComponent',
);
```

```typescript
import {CodegenTypes, codegenNativeComponent} from 'react-native';  
  
interface NativeProps extends ViewProps {  
  enabled?: CodegenTypes.WithDefault<boolean, true>;  
  size?: CodegenTypes.Int32;  
}  
  
export default codegenNativeComponent<NativeProps>(  
  'RNCustomComponent',
);
```

--------------------------------

### Initialize React Native Project for Native Components

Source: https://reactnative.dev/docs/0.81/fabric-native-components-introduction

This command initializes a new React Native project named 'Demo' using the latest CLI, specifically configured to skip CocoaPods installation for flexible native component development.

```bash
npx @react-native-community/cli@latest init Demo --install-pods false

```

--------------------------------

### React Native Text Component Snapshot Example

Source: https://reactnative.dev/docs/0.78/testing-overview

Demonstrates a snapshot representation of a React Native Text component with styling. This shows the human-readable JSX-like string format that Jest creates using its custom React serializer, which captures the component tree and its properties during test execution.

```typescript
<Text
  style={{
    Object {
      "fontSize": 20,
      "textAlign": "center"
    }
  }}>
  Welcome to React Native!
</Text>
```

--------------------------------

### Start React Native Animation with Completion Callback (tsx)

Source: https://reactnative.dev/docs/0.79/animated

This snippet demonstrates how to initiate an animation using `Animated.timing()` in React Native. The `start()` method takes an optional callback function which is executed upon animation completion, providing a `finished` boolean to indicate whether the animation ran to its natural end or was interrupted.

```tsx
Animated.timing({}).start(({finished}) => {  
  /* completion callback */  
});
```

--------------------------------

### Local Development Directory Structure - Shell

Source: https://reactnative.dev/docs/0.77/the-new-architecture/create-module-library

Shows the recommended directory structure for local library development where a library sits as a sibling to the app directory, enabling local linking without NPM publication.

```shell
Development
├── App
└── Library
```

--------------------------------

### Link local library dependency in package.json

Source: https://reactnative.dev/docs/0.77/legacy/local-library-setup

Package.json configuration for linking local libraries using npm file: protocol or Yarn link: protocol. This creates a symlink to the library under node_modules to enable autolinking.

```json
"dependencies": {
  "awesome-module": "file:./modules/awesome-module"
}
```

```json
"dependencies": {
  "awesome-module": "link:./modules/awesome-module"
}
```

--------------------------------

### Configure Bundle Configuration File Path

Source: https://reactnative.dev/docs/0.77/react-native-gradle-plugin

Specifies the path to a configuration file passed to the bundle command via --config flag. Default is empty (no config file). Refer to CLI documentation for available bundling configuration options.

```groovy
bundleConfig = file(../rn-cli.config.js)
```

--------------------------------

### Start Metro Bundler for React Native Development

Source: https://reactnative.dev/docs/0.77/integration-with-existing-apps

These commands initiate the Metro bundler, which compiles your TypeScript/JavaScript application code into a bundle. The bundler serves this bundle via HTTP, enabling features like hot reloading for development on simulators or devices.

```shell
npm start  
```

```shell
yarn start  
```

--------------------------------

### TouchableWithoutFeedback Counter Example with State Management

Source: https://reactnative.dev/docs/0.77/touchablewithoutfeedback

Complete working example showing TouchableWithoutFeedback with React hooks state management. Displays a counter that increments on touch, styled with custom StyleSheet, and includes SafeAreaView for safe rendering across devices.

```typescript
import React, {useState} from 'react';
import {StyleSheet, TouchableWithoutFeedback, Text, View} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const TouchableWithoutFeedbackExample = () => {
  const [count, setCount] = useState(0);

  const onPress = () => {
    setCount(count + 1);
  };

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <View style={styles.countContainer}>
          <Text style={styles.countText}>Count: {count}</Text>
        </View>
        <TouchableWithoutFeedback onPress={onPress}>
          <View style={styles.button}>
            <Text>Touch Here</Text>
          </View>
        </TouchableWithoutFeedback>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: 10,
  },
  button: {
    alignItems: 'center',
    backgroundColor: '#DDDDDD',
    padding: 10,
  },
  countContainer: {
    alignItems: 'center',
    padding: 10,
  },
  countText: {
    color: '#FF00FF',
  },
});

export default TouchableWithoutFeedbackExample;
```

--------------------------------

### Applying Styles and Resize Modes to React Native Images

Source: https://reactnative.dev/docs/0.77/image

This example illustrates how to apply custom styles to an `Image` component in React Native, specifically demonstrating the `resizeMode` property set to 'stretch'. It shows how to define styles using `StyleSheet` and apply them to an image from a local static asset, allowing for visual manipulation of the image's display.

```javascript
import React from 'react';
import {Image, StyleSheet} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  stretch: {
    width: 50,
    height: 200,
    resizeMode: 'stretch',
  },
});

const DisplayAnImageWithStyle = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <Image
        style={styles.stretch}
        source={require('@expo/snack-static/react-native-logo.png')}
      />
    </SafeAreaView>
  </SafeAreaProvider>
);

export default DisplayAnImageWithStyle;
```

--------------------------------

### Platform.Version Property

Source: https://reactnative.dev/docs/0.79/platform

Gets the version of the current operating system.

```APIDOC
## GET /Platform.Version

### Description
Returns the version of the operating system. This will be a number for Android and a string for iOS.

### Method
GET

### Endpoint
/Platform.Version

### Parameters
#### Path Parameters
(None)

#### Query Parameters
(None)

#### Request Body
(None)

### Request Example
(None)

### Response
#### Success Response (200)
- **value** (number|string) - The OS version. Number for Android, string for iOS.

#### Response Example
```json
29
```

```json
"15.0"
```
```

--------------------------------

### Install Pods for React Native Codegen (Bash)

Source: https://reactnative.dev/docs/0.81/the-new-architecture/pure-cxx-modules

This command block illustrates how to re-install CocoaPods after updating `package.json` for React Native Codegen. Running `bundle exec pod install` ensures new files are generated based on the configuration, followed by opening the Xcode workspace.

```bash
# from the ios folder  
bundle exec pod install  
open SampleApp.xcworkspace
```

--------------------------------

### canOpenURL() - Check URL Handler Availability

Source: https://reactnative.dev/docs/linking

Determines whether an installed app can handle a given URL by returning a Promise<boolean>. The method has platform-specific limitations: iOS 9+ restricts calls to 50 times and requires LSApplicationQueriesSchemes in Info.plist, while Android 11+ requires intent queries in AndroidManifest.xml. The promise rejects if configuration is incomplete or the check fails.

```typescript
static canOpenURL(url: string): Promise<boolean>;
```

--------------------------------

### Create ReactPackage with Module Info - Kotlin

Source: https://reactnative.dev/docs/0.77/turbo-native-modules-introduction

Implements getReactModuleInfoProvider() method using Kotlin to return module metadata. Creates a map containing ReactModuleInfo for NativeLocalStorageModule with named parameters, marking it as a TurboModule. Also overrides getModule() to instantiate the module when requested by React Native.

```kotlin
package com.nativelocalstorage

import com.facebook.react.BaseReactPackage
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.model.ReactModuleInfo
import com.facebook.react.module.model.ReactModuleInfoProvider

class NativeLocalStoragePackage : BaseReactPackage() {

  override fun getModule(name: String, reactContext: ReactApplicationContext): NativeModule? =
    if (name == NativeLocalStorageModule.NAME) {
      NativeLocalStorageModule(reactContext)
    } else {
      null
    }

  override fun getReactModuleInfoProvider() = ReactModuleInfoProvider {
    mapOf(
      NativeLocalStorageModule.NAME to ReactModuleInfo(
        _name = NativeLocalStorageModule.NAME,
        _className = NativeLocalStorageModule.NAME,
        _canOverrideExistingModule = false,
        _needsEagerInit = false,
        isCxxModule = false,
        isTurboModule = true
      )
    )
  }
}
```

--------------------------------

### TouchableOpacity Counter Example - React Native

Source: https://reactnative.dev/docs/0.77/touchableopacity

A functional React component demonstrating TouchableOpacity usage with state management. The example shows a counter that increments on button press, with styling applied via StyleSheet. SafeAreaProvider and SafeAreaView are used to handle device safe areas.

```javascript
import React, {useState} from 'react';
import {StyleSheet, Text, TouchableOpacity, View} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const [count, setCount] = useState(0);
  const onPress = () => setCount(prevCount => prevCount + 1);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <View style={styles.countContainer}>
          <Text>Count: {count}</Text>
        </View>
        <TouchableOpacity style={styles.button} onPress={onPress}>
          <Text>Press Here</Text>
        </TouchableOpacity>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: 10,
  },
  button: {
    alignItems: 'center',
    backgroundColor: '#DDDDDD',
    padding: 10,
  },
  countContainer: {
    alignItems: 'center',
    padding: 10,
  },
});

export default App;
```

--------------------------------

### Listen for Keyboard Events in React Native

Source: https://reactnative.dev/docs/0.77/keyboard

A complete React Native example demonstrating how to listen for keyboard show/hide events using the Keyboard module's addListener method. The component tracks keyboard status and updates state when keyboard visibility changes. Includes TextInput with dismiss functionality and proper cleanup of event subscriptions in useEffect.

```javascript
import React, {useState, useEffect} from 'react';
import {Keyboard, Text, TextInput, StyleSheet} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const Example = () => {
  const [keyboardStatus, setKeyboardStatus] = useState('Keyboard Hidden');

  useEffect(() => {
    const showSubscription = Keyboard.addListener('keyboardDidShow', () => {
      setKeyboardStatus('Keyboard Shown');
    });
    const hideSubscription = Keyboard.addListener('keyboardDidHide', () => {
      setKeyboardStatus('Keyboard Hidden');
    });

    return () => {
      showSubscription.remove();
      hideSubscription.remove();
    };
  }, []);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={style.container}>
        <TextInput
          style={style.input}
          placeholder="Click here…"
          onSubmitEditing={Keyboard.dismiss}
        />
        <Text style={style.status}>{keyboardStatus}</Text>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const style = StyleSheet.create({
  container: {
    flex: 1,
    padding: 36,
  },
  input: {
    padding: 10,
    borderWidth: 0.5,
    borderRadius: 4,
  },
  status: {
    padding: 16,
    textAlign: 'center',
  },
});

export default Example;
```

--------------------------------

### Complete Example of useWindowDimensions Hook in React Native

Source: https://reactnative.dev/docs/0.77/usewindowdimensions

This comprehensive React Native example showcases the `useWindowDimensions` hook within a functional component. It retrieves `height`, `width`, `scale`, and `fontScale` and displays them, demonstrating how to build a responsive UI that adapts to device dimensions and user preferences. It depends on `react-native`, `react-native-safe-area-context`, and `react`.

```tsx
import React from 'react';
import {StyleSheet, Text, useWindowDimensions} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const {height, width, scale, fontScale} = useWindowDimensions();
  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Text style={styles.header}>Window Dimension Data</Text>
        <Text>Height: {height}</Text>
        <Text>Width: {width}</Text>
        <Text>Font scale: {fontScale}</Text>
        <Text>Pixel ratio: {scale}</Text>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};
const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  header: {
    fontSize: 20,
    marginBottom: 12,
  },
});

export default App;
```

--------------------------------

### React Native BackHandler: Confirm Exit App Example

Source: https://reactnative.dev/docs/0.77/backhandler

This example shows how to implement a custom back button behavior to confirm if the user wants to exit the app. It uses the `useEffect` hook to manage the `hardwareBackPress` event listener, displaying an `Alert` dialog before calling `BackHandler.exitApp()`.

```javascript
import React, {useEffect} from 'react';
import {Text, StyleSheet, BackHandler, Alert} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  useEffect(() => {
    const backAction = () => {
      Alert.alert('Hold on!', 'Are you sure you want to go back?', [
        {
          text: 'Cancel',
          onPress: () => null,
          style: 'cancel',
        },
        {text: 'YES', onPress: () => BackHandler.exitApp()},
      ]);
      return true;
    };

    const backHandler = BackHandler.addEventListener(
      'hardwareBackPress',
      backAction,
    );

    return () => backHandler.remove();
  }, []);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Text style={styles.text}>Click Back button!</Text>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  text: {
    fontSize: 18,
    fontWeight: 'bold',
  },
});

export default App;
```

--------------------------------

### React Native Component Snapshot Example (JSX)

Source: https://reactnative.dev/docs/testing-overview

This code snippet demonstrates a typical JSX-like string representation of a React Native component's rendered output, as generated during a snapshot test. It shows a simple Text component with inline styling and content, illustrating what a human-readable snapshot might look like.

```tsx
<Text\n  style={\n    Object {\n      "fontSize": 20,\n      "textAlign": "center",\n    }\n  }>\n  Welcome to React Native!\n</Text>
```

--------------------------------

### Install Published React Native Package via Yarn

Source: https://reactnative.dev/docs/0.77/the-new-architecture/create-module-library

Once your React Native library has been published and verified on NPM, you can use this Bash command with Yarn to add it as a dependency to any React Native application. Replace `<package.name>` with the correct identifier of your published library.

```bash
yarn add <package.name>
```

--------------------------------

### Implement React Native Android Image Picker Module

Source: https://reactnative.dev/docs/legacy/native-modules-android

This example demonstrates a complete React Native native module for Android to pick an image from the gallery. It illustrates how to define module constants, manage promises for JavaScript communication, use `startActivityForResult` to launch the image picker, and handle the returned image data within `onActivityResult`.

```java
public class ImagePickerModule extends ReactContextBaseJavaModule {

  private static final int IMAGE_PICKER_REQUEST = 1;
  private static final String E_ACTIVITY_DOES_NOT_EXIST = "E_ACTIVITY_DOES_NOT_EXIST";
  private static final String E_PICKER_CANCELLED = "E_PICKER_CANCELLED";
  private static final String E_FAILED_TO_SHOW_PICKER = "E_FAILED_TO_SHOW_PICKER";
  private static final String E_NO_IMAGE_DATA_FOUND = "E_NO_IMAGE_DATA_FOUND";

  private Promise mPickerPromise;

  private final ActivityEventListener mActivityEventListener = new BaseActivityEventListener() {

    @Override
    public void onActivityResult(Activity activity, int requestCode, int resultCode, Intent intent) {
      if (requestCode == IMAGE_PICKER_REQUEST) {
        if (mPickerPromise != null) {
          if (resultCode == Activity.RESULT_CANCELED) {
            mPickerPromise.reject(E_PICKER_CANCELLED, "Image picker was cancelled");
          } else if (resultCode == Activity.RESULT_OK) {
            Uri uri = intent.getData();

            if (uri == null) {
              mPickerPromise.reject(E_NO_IMAGE_DATA_FOUND, "No image data found");
            } else {
              mPickerPromise.resolve(uri.toString());
            }
          }

          mPickerPromise = null;
        }
      }
    }
  };

  ImagePickerModule(ReactApplicationContext reactContext) {
    super(reactContext);

    // Add the listener for `onActivityResult`
    reactContext.addActivityEventListener(mActivityEventListener);
  }

  @Override
  public String getName() {
    return "ImagePickerModule";
  }

  @ReactMethod
  public void pickImage(final Promise promise) {
    Activity currentActivity = getCurrentActivity();

    if (currentActivity == null) {
      promise.reject(E_ACTIVITY_DOES_NOT_EXIST, "Activity doesn't exist");
      return;
    }

    // Store the promise to resolve/reject when picker returns data
    mPickerPromise = promise;

    try {
      final Intent galleryIntent = new Intent(Intent.ACTION_PICK);

      galleryIntent.setType("image/*");

      final Intent chooserIntent = Intent.createChooser(galleryIntent, "Pick an image");

      currentActivity.startActivityForResult(chooserIntent, IMAGE_PICKER_REQUEST);
    } catch (Exception e) {
      mPickerPromise.reject(E_FAILED_TO_SHOW_PICKER, e);
      mPickerPromise = null;
    }
  }
}
```

```kotlin
class ImagePickerModule(reactContext: ReactApplicationContext) :
    ReactContextBaseJavaModule(reactContext) {

    private var pickerPromise: Promise? = null

    private val activityEventListener =
        object : BaseActivityEventListener() {
            override fun onActivityResult(
                activity: Activity?,
                requestCode: Int,
                resultCode: Int,
                intent: Intent?
            ) {
                if (requestCode == IMAGE_PICKER_REQUEST) {
                    pickerPromise?.let { promise ->
                        when (resultCode) {
                            Activity.RESULT_CANCELED ->
                                promise.reject(E_PICKER_CANCELLED, "Image picker was cancelled")
                            Activity.RESULT_OK -> {
                                val uri = intent?.data

                                uri?.let { promise.resolve(uri.toString())}
                                    ?: promise.reject(E_NO_IMAGE_DATA_FOUND, "No image data found")
                            }
                        }

                        pickerPromise = null
                    }
                }
            }
        }

    init {
```

--------------------------------

### Property: `contentOffset`

Source: https://reactnative.dev/docs/scrollview

Used to manually set the starting scroll offset of the scroll view.

```APIDOC
## Property: `contentOffset`

### Description
Used to manually set the starting scroll offset.

### Type
Point

### Default
`{x: 0, y: 0}`
```

--------------------------------

### Present React Native View from iOS ViewController (Objective-C & Swift)

Source: https://reactnative.dev/docs/0.81/integration-with-existing-apps

This code demonstrates how to modify an existing iOS `ViewController` to create a button that presents a `ReactViewController` modally. It includes setting up the button's UI, adding it to the view hierarchy, configuring auto-layout constraints, and defining the action to instantiate and present the `ReactViewController`. Dependencies include `ReactViewController` and UIKit.

```Objective-C
#import "ViewController.h"  
#import "ReactViewController.h"  
  
@interface ViewController ()  
  
@end  
  
@implementation ViewController {  
  ReactViewController *reactViewController;  
}  
  
 - (void)viewDidLoad {  
   [super viewDidLoad];  
   // Do any additional setup after loading the view.  
   self.view.backgroundColor = UIColor.systemBackgroundColor;  
   UIButton *button = [UIButton new];  
   [button setTitle:@"Open React Native" forState:UIControlStateNormal];  
   [button setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];  
   [button setTitleColor:UIColor.blueColor forState:UIControlStateHighlighted];  
   [button addTarget:self action:@selector(presentReactNative) forControlEvents:UIControlEventTouchUpInside];  
   [self.view addSubview:button];  
  
   button.translatesAutoresizingMaskIntoConstraints = NO;  
   [NSLayoutConstraint activateConstraints:@[  
     [button.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
     [button.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
     [button.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
     [button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
   ]];  
 }  
  
- (void)presentReactNative  
{
  if (reactViewController == NULL) {
    reactViewController = [ReactViewController new];  
  }
  [self presentViewController:reactViewController animated:YES];  
}  
  
@end  
```

```Swift
import UIKit  
  
class ViewController: UIViewController {  
  
  var reactViewController: ReactViewController?  
  
  override func viewDidLoad() {  
    super.viewDidLoad()  
    // Do any additional setup after loading the view.  
    self.view.backgroundColor = .systemBackground  
  
    let button = UIButton()  
    button.setTitle("Open React Native", for: .normal)  
    button.setTitleColor(.systemBlue, for: .normal)  
    button.setTitleColor(.blue, for: .highlighted)  
    button.addAction(UIAction { [weak self] _ in  
      guard let self else { return }  
      if reactViewController == nil {  
       reactViewController = ReactViewController()  
      }
      present(reactViewController!, animated: true)  
    }, for: .touchUpInside)  
    self.view.addSubview(button)  
  
    button.translatesAutoresizingMaskIntoConstraints = false  
    NSLayoutConstraint.activate([  
      button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
    ])  
  }
}
```

--------------------------------

### Import Native Module in App - TypeScript

Source: https://reactnative.dev/docs/0.77/the-new-architecture/create-module-library

Imports the native module from a local library located in a sibling directory. This example shows how to reference a library that sits as a sibling folder to the app.

```typescript
import NativeSampleModule from '../Library/src/index';
```

--------------------------------

### Rebuild React Native App for Android

Source: https://reactnative.dev/docs/0.77/libraries

Rebuild the Android app binary after installing libraries with native dependencies. React Native uses Gradle to manage Android dependencies. Execute this command to compile and deploy your app with newly installed native libraries.

```shell
npm run android
```

```shell
yarn android
```

--------------------------------

### Install TypeScript Dependencies for Existing React Native Project

Source: https://reactnative.dev/docs/0.81/typescript

These commands install necessary TypeScript-related packages, including `typescript`, `@react-native/typescript-config`, and type definitions for Jest, React, and React Test Renderer. They are crucial for enabling TypeScript support and type checking in an existing React Native application.

```shell
npm install -D typescript @react-native/typescript-config @types/jest @types/react @types/react-test-renderer  
```

```shell
yarn add --dev typescript @react-native/typescript-config @types/jest @types/react @types/react-test-renderer  
```

--------------------------------

### onStartShouldSetResponder

Source: https://reactnative.dev/docs/0.79/view

Determines if this view should become the responder on the start of a touch event, returning a boolean.

```APIDOC
## onStartShouldSetResponder

### Description
Does this view want to become responder on the start of a touch?

### Type
`({nativeEvent: PressEvent}) => boolean`

### Arguments
- **nativeEvent** (PressEvent) - The native event object containing touch details.

### Return Value
(boolean) - `true` if the view wants to become the responder, `false` otherwise.
```

--------------------------------

### Run React Native Init in Verbose Mode

Source: https://reactnative.dev/docs/0.77/troubleshooting

When `npx react-native init` hangs, running it with the `--verbose` flag provides detailed logs. This helps diagnose the root cause by outputting more information about the process.

```shell
npx react-native init --verbose
```

--------------------------------

### Download React Native `Podfile` for iOS Integration

Source: https://reactnative.dev/docs/0.77/integration-with-existing-apps

Downloads the `Podfile` from the React Native Community template to the `ios` subfolder of the project. This file defines the native dependencies, including the React Native framework, that CocoaPods will install for the iOS application.

```sh
curl -O https://raw.githubusercontent.com/react-native-community/template/refs/heads/0.77-stable/template/ios/Podfile
```

--------------------------------

### Configure Entry File for Bundle Generation

Source: https://reactnative.dev/docs/0.77/react-native-gradle-plugin

Specifies the entry file used for bundle generation. Default searches for index.android.js or index.js. Customize to point to a different entry file path for your application.

```groovy
entryFile = file("../js/MyApplication.android.js")
```

--------------------------------

### Initialize React Native Project with CLI

Source: https://reactnative.dev/docs/0.81/the-new-architecture/using-codegen

Creates a new React Native project using the community CLI at version 0.81. This project serves as the foundation for Codegen setup and manual invocation. Required as a prerequisite before configuring and running Codegen.

```bash
npx @react-native-community/cli@latest init SampleApp --version 0.81
```

--------------------------------

### View Component - Basic Usage

Source: https://reactnative.dev/docs/0.79/view

Demonstrates how to create and nest View components with styling, color, flexbox layout, and child elements. This example shows a row layout with colored boxes and text content using SafeAreaView for proper spacing.

```APIDOC
## View Component

### Description
The most fundamental component for building a UI. View is a container that supports layout with flexbox, style, some touch handling, and accessibility controls. View maps directly to the native view equivalent on whatever platform React Native is running on (UIView, <div>, android.view, etc.).

### Component
View

### Usage
View is designed to be nested inside other views and can have 0 to many children of any type.

### Basic Example
```jsx
import React from 'react';
import {View, Text} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const ViewBoxesWithColorAndText = () => {
  return (
    <SafeAreaProvider>
      <SafeAreaView style={{flexDirection: 'row'}}>
        <View style={{height: 100, backgroundColor: 'blue', flex: 0.2}} />
        <View style={{height: 100, backgroundColor: 'red', flex: 0.4}} />
        <Text>Hello World!</Text>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

export default ViewBoxesWithColorAndText;
```

### Props
- **accessibilityActions** (array) - Optional - Accessibility actions that allow assistive technology to programmatically invoke component actions
- **accessibilityElementsHidden** (bool, iOS only) - Optional - Indicates whether accessibility elements contained within this element are hidden (default: false)
- **accessibilityHint** (string) - Optional - Helps users understand what will happen when they perform an action on the accessibility element
- **accessibilityLabel** (string) - Optional - Overrides text read by screen reader when user interacts with element
- **accessibilityLanguage** (string, iOS only) - Optional - Language for screen reader interaction (must follow BCP 47 specification)
- **accessibilityIgnoresInvertColors** (bool, iOS only) - Optional - Indicates if view should be inverted when color inversion is enabled
- **accessibilityLiveRegion** (enum: 'none', 'polite', 'assertive', Android only) - Optional - Indicates if accessibility services should notify user of view changes (Android API >= 19)

### Styling
View components should be styled using StyleSheet for clarity and performance, though inline styles are also supported. Common style properties include:
- height
- width
- backgroundColor
- flex
- flexDirection

### Touch Events
View responder props (e.g., onResponderMove) receive synthetic touch events in the form of PressEvent.
```

--------------------------------

### getInitialURL()

Source: https://reactnative.dev/docs/linking

Retrieves the initial URL that triggered the app launch, if any. Returns a Promise resolving to the URL string or `null`.

```APIDOC
## Function Call getInitialURL()

### Description
If the app launch was triggered by an app link, it will give the link url, otherwise it will give `null`.

### Method
Function Call

### Endpoint
`static getInitialURL(): Promise<string | null>`

### Parameters
#### Path Parameters
_None_

#### Query Parameters
_None_

#### Request Body
_None_

### Request Example
_Not Applicable_

### Response
#### Success Response (Promise<string | null>)
- **url** (string | null) - The initial URL that triggered the app launch, or `null` if no URL was involved.

#### Response Example
`"https://your-app.com/deeplink"`
```

--------------------------------

### Start iOS Simulator with Yarn

Source: https://reactnative.dev/docs/0.78/running-on-simulator-ios

Launches the React Native app in the default iOS Simulator (iPhone 14) using Yarn. Run this command from the project directory after initializing a React Native project.

```shell
yarn ios
```

--------------------------------

### Basic Metro Configuration Setup

Source: https://reactnative.dev/docs/0.77/metro

Default metro.config.js file structure for React Native projects. This shows the recommended approach using an object that merges with Metro's internal defaults through getDefaultConfig and mergeConfig utilities from @react-native/metro-config.

```javascript
const {getDefaultConfig, mergeConfig} = require('@react-native/metro-config');

/**
 * Metro configuration
 * https://metrobundler.dev/docs/configuration
 *
 * @type {import('metro-config').MetroConfig}
 */
const config = {};

module.exports = mergeConfig(getDefaultConfig(__dirname), config);
```

--------------------------------

### parallel() - Start Multiple Animations Simultaneously

Source: https://reactnative.dev/docs/0.77/animated

Starts an array of animations all at the same time. By default, if one animation is stopped, all animations stop together. This behavior can be overridden using the `stopTogether` flag in the ParallelConfig parameter.

```typescript
static parallel(
  animations: CompositeAnimation[],
  config?: ParallelConfig
): CompositeAnimation;
```

--------------------------------

### Exporting a React Component for Use (TypeScript/TSX)

Source: https://reactnative.dev/docs/next/intro-react

This example demonstrates how to export a React component using `export default`. Exporting makes the `Cat` component available for import and use in other parts of the application, enabling modular and reusable UI development.

```tsx
const Cat = () => {  
  return <Text>Hello, I am your cat!</Text>;  
};  
  
export default Cat;  
```

--------------------------------

### Implement Button Basics with Multiple Buttons and Alert

Source: https://reactnative.dev/docs/0.77/handling-touches

Complete React Native component demonstrating multiple Button implementations with custom styling and alert notifications. Uses StyleSheet for consistent layout with flexbox styling. Includes examples of default buttons and buttons with custom color props arranged in different layouts.

```jsx
import React from 'react';
import {Alert, Button, StyleSheet, View} from 'react-native';

const ButtonBasics = () => {
  const onPress = () => {
    Alert.alert('You tapped the button!');
  };

  return (
    <View style={styles.container}>
      <View style={styles.buttonContainer}>
        <Button onPress={onPress} title="Press Me" />
      </View>
      <View style={styles.buttonContainer}>
        <Button onPress={onPress} title="Press Me" color="#841584" />
      </View>
      <View style={styles.alternativeLayoutButtonContainer}>
        <Button onPress={onPress} title="This looks great!" />
        <Button onPress={onPress} title="OK!" color="#841584" />
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
  },
  buttonContainer: {
    margin: 20,
  },
  alternativeLayoutButtonContainer: {
    margin: 20,
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
});

export default ButtonBasics;
```

--------------------------------

### Download Podfile from React Native Community Template

Source: https://reactnative.dev/docs/0.78/integration-with-existing-apps

Downloads the Podfile from the React Native Community template repository to the ios folder of your project. The Podfile defines how to properly install CocoaPods dependencies and integrate React Native framework code.

```shell
curl -O https://raw.githubusercontent.com/react-native-community/template/refs/heads/0.78-stable/template/ios/Podfile
```

--------------------------------

### Run React Native Application

Source: https://reactnative.dev/docs/0.77/appregistry

This method loads the JavaScript bundle and initializes a React Native application. It requires an `appKey` to identify the application and `appParameters` for initial configuration, effectively bootstrapping the app.

```tsx
static runApplication(appKey: string, appParameters: any): void;
```

--------------------------------

### Select Platform-Specific Components with Platform.select (Native/Web)

Source: https://reactnative.dev/docs/0.77/platform-specific-code

This example extends `Platform.select` to differentiate between native platforms (iOS/Android, covered by `native` key) and web. It loads `ComponentForNative` for mobile and `ComponentForWeb` for other platforms, providing flexible component rendering.

```tsx
const Component = Platform.select({  
  native: () => require('ComponentForNative'),  
  default: () => require('ComponentForWeb'),  
})();  
  
<Component />;
```

--------------------------------

### Display React Native Codegen CLI help options

Source: https://reactnative.dev/docs/0.78/the-new-architecture/codegen-cli

Use this command to view all available options and their descriptions for the React Native Codegen CLI. It's useful for understanding how to customize code generation tasks.

```sh
npx @react-native-community/cli codegen --help
```

--------------------------------

### Configure Metro Bundler with metro.config.js

Source: https://reactnative.dev/docs/0.77/integration-with-existing-apps

This JavaScript file, `metro.config.js`, is placed at the root of the project to configure the Metro bundler. It uses `@react-native/metro-config` to get the default configuration, enabling the bundler to build and serve React Native application code.

```js
const {getDefaultConfig} = require('@react-native/metro-config');  
module.exports = getDefaultConfig(__dirname);  
```

--------------------------------

### Animated.start()

Source: https://reactnative.dev/docs/0.79/animated

Initiates an animation. It accepts an optional completion callback that will be invoked when the animation finishes normally or if it is stopped prematurely by calling `stop()`.

```APIDOC
## Animated.start()

### Description
Animations are started by calling start() on your animation. start() takes a completion callback that will be called when the animation is done or when the animation is done because stop() was called on it before it could finish.

### Method
Instance Method (typically called on `Animated.timing`, `Animated.spring`, `Animated.decay`, or `CompositeAnimation` instances)

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
- **callback?** (`(result: {finished: boolean}) => void`) - Optional - Function that will be called after the animation finishes running normally or when it is stopped prematurely. The `result` object contains a `finished` boolean indicating if the animation completed naturally.

### Request Example
```tsx
Animated.timing(this.state.fadeAnim, {
  toValue: 1,
  duration: 1000,
  useNativeDriver: true,
}).start(({finished}) => {
  if (finished) {
    console.log('Animation completed!');
  } else {
    console.log('Animation stopped prematurely.');
  }
});
```

### Response
#### Success Response (No explicit return value)
- This method does not return a value directly. Its effect is to begin the animation and optionally invoke a callback upon completion.

#### Response Example
```json
// No explicit return value.
```
```

--------------------------------

### Animated.ValueXY - Constructor and Basic Usage

Source: https://reactnative.dev/docs/0.78/animatedvaluexy

Initialize Animated.ValueXY for 2D animations. This example demonstrates creating a draggable view using Animated.ValueXY with PanResponder to handle pan gestures and spring animations.

```APIDOC
## Animated.ValueXY

### Description
A 2D Value component for driving 2D animations such as pan gestures. It contains two regular Animated.Value instances under the hood and provides a multiplexed API nearly identical to Animated.Value.

### Usage
Create an instance using `useRef` hook and integrate with gesture handlers like PanResponder.

### Basic Constructor
```typescript
const pan = useRef(new Animated.ValueXY()).current;
```

### Example Implementation
```typescript
import React, {useRef} from 'react';
import {Animated, PanResponder, StyleSheet} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const DraggableView = () => {
  const pan = useRef(new Animated.ValueXY()).current;

  const panResponder = PanResponder.create({
    onStartShouldSetPanResponder: () => true,
    onPanResponderMove: Animated.event([
      null,
      {
        dx: pan.x,
        dy: pan.y,
      },
    ]),
    onPanResponderRelease: () => {
      Animated.spring(
        pan,
        {toValue: {x: 0, y: 0}, useNativeDriver: true},
      ).start();
    },
  });

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Animated.View
          {...panResponder.panHandlers}
          style={[pan.getLayout(), styles.box]}
        />
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  box: {
    backgroundColor: '#61dafb',
    width: 80,
    height: 80,
    borderRadius: 4,
  },
});

export default DraggableView;
```
```

--------------------------------

### Implement Basic Modal Component in React Native

Source: https://reactnative.dev/docs/0.77/modal

This React Native example demonstrates how to create and control a basic Modal component. It utilizes `useState` to manage the modal's visibility, `Pressable` components for user interaction to open and close it, and `StyleSheet` for defining the component's visual styles. The `onRequestClose` prop is also implemented to handle modal dismissal, providing user feedback through an `Alert`.

```javascript
import React, {useState} from 'react';
import {Alert, Modal, StyleSheet, Text, Pressable, View} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const [modalVisible, setModalVisible] = useState(false);
  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.centeredView}>
        <Modal
          animationType="slide"
          transparent={true}
          visible={modalVisible}
          onRequestClose={() => {
            Alert.alert('Modal has been closed.');
            setModalVisible(!modalVisible);
          }}>
          <View style={styles.centeredView}>
            <View style={styles.modalView}>
              <Text style={styles.modalText}>Hello World!</Text>
              <Pressable
                style={[styles.button, styles.buttonClose]}
                onPress={() => setModalVisible(!modalVisible)}>
                <Text style={styles.textStyle}>Hide Modal</Text>
              </Pressable>
            </View>
          </View>
        </Modal>
        <Pressable
          style={[styles.button, styles.buttonOpen]}
          onPress={() => setModalVisible(true)}>
          <Text style={styles.textStyle}>Show Modal</Text>
        </Pressable>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  centeredView: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  modalView: {
    margin: 20,
    backgroundColor: 'white',
    borderRadius: 20,
    padding: 35,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 4,
    elevation: 5,
  },
  button: {
    borderRadius: 20,
    padding: 10,
    elevation: 2,
  },
  buttonOpen: {
    backgroundColor: '#F194FF',
  },
  buttonClose: {
    backgroundColor: '#2196F3',
  },
  textStyle: {
    color: 'white',
    fontWeight: 'bold',
    textAlign: 'center',
  },
  modalText: {
    marginBottom: 15,
    textAlign: 'center',
  },
});

export default App;
```

--------------------------------

### Configure React Native Host with Packages - Kotlin

Source: https://reactnative.dev/docs/0.77/turbo-native-modules-introduction_platforms=ios

Sets up the DefaultReactNativeHost in Android with package initialization, developer support configuration, and architecture flags. This includes manual package registration for modules like NativeLocalStoragePackage that cannot be autolinked.

```kotlin
object : DefaultReactNativeHost(this) {
  override fun getPackages(): List<ReactPackage> =
      PackageList(this).packages.apply {
        add(NativeLocalStoragePackage())
      }

  override fun getJSMainModuleName(): String = "index"

  override fun getUseDeveloperSupport(): Boolean = BuildConfig.DEBUG

  override val isNewArchEnabled: Boolean = BuildConfig.IS_NEW_ARCHITECTURE_ENABLED
  override val isHermesEnabled: Boolean = BuildConfig.IS_HERMES_ENABLED
}

override val reactHost: ReactHost
  get() = getDefaultReactHost(applicationContext, reactNativeHost)

override fun onCreate() {
  super.onCreate()
  SoLoader.init(this, false)
  if (BuildConfig.IS_NEW_ARCHITECTURE_ENABLED) {
    load()
  }
}
```

--------------------------------

### Setup native stack navigator with React Navigation

Source: https://reactnative.dev/docs/0.77/navigation

Configure a native stack navigator with Home and Profile screens using createNativeStackNavigator and createStaticNavigation. Each screen can have custom options like title and a React component to render.

```typescript
import * as React from 'react';
import {createStaticNavigation} from '@react-navigation/native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';

const RootStack = createNativeStackNavigator({
  screens: {
    Home: {
      screen: HomeScreen,
      options: {title: 'Welcome'},
    },
    Profile: {
      screen: ProfileScreen,
    },
  },
});

const Navigation = createStaticNavigation(RootStack);

export default function App() {
  return <Navigation />;
}
```

--------------------------------

### PressEvent Object Structure Example

Source: https://reactnative.dev/docs/0.77/pressevent

Example structure of a PressEvent object returned from press interaction callbacks. The object contains touch coordinates, identifiers, and timestamp information for handling user press events on React Native components.

```javascript
{
  changedTouches: [PressEvent],
  identifier: 1,
  locationX: 8,
  locationY: 4.5,
  pageX: 24,
  pageY: 49.5,
  target: 1127,
  timestamp: 85131876.58868201,
  touches: []
}
```

--------------------------------

### Find JDK Directory on macOS

Source: https://reactnative.dev/docs/0.77/signed-apk-android

Locates the JDK bin folder path on macOS systems to determine where keytool is located. Returns the full path to the Java Virtual Machine installation directory.

```shell
/usr/libexec/java_home
```

--------------------------------

### Initialize React Native Demo Project with CLI

Source: https://reactnative.dev/docs/0.77/fabric-native-components-introduction

Creates a new React Native project using the community CLI without installing CocoaPods dependencies. This provides a plain template application needed for component development and testing.

```bash
npx @react-native-community/cli@latest init Demo --install-pods false
```

--------------------------------

### Perform a GET request using XMLHttpRequest directly in React Native

Source: https://reactnative.dev/docs/network

This code demonstrates how to make a GET request using the XMLHttpRequest API, which is built into React Native. It sets up an "onreadystatechange" event handler to track the request's progress and handle successful responses or errors.

```tsx
const request = new XMLHttpRequest();
request.onreadystatechange = e => {
  if (request.readyState !== 4) {
    return;
  }

  if (request.status === 200) {
    console.log('success', request.responseText);
  } else {
    console.warn('error');
  }
};

request.open('GET', 'https://mywebsite.com/endpoint/');
request.send();
```

--------------------------------

### Specify iOS Version and Device with npm

Source: https://reactnative.dev/docs/0.78/running-on-simulator-ios

Launches the app on a specific iOS device and version combination using npm. Include the version number in the simulator flag to target a particular iOS version installed on the system.

```shell
npm run ios -- --simulator="iPhone 14 Pro (16.0)"
```

--------------------------------

### initialNumToRender Property

Source: https://reactnative.dev/docs/virtualizedlist

Specifies how many items to render in the initial batch. Should be enough to fill the screen without rendering excessive off-screen items.

```APIDOC
## initialNumToRender

### Description
How many items to render in the initial batch. This should be enough to fill the screen but not much more. Note these items will never be unmounted as part of the windowed rendering in order to improve perceived performance of scroll-to-top actions.

### Type
number

### Required
No

### Default
10

### Usage
Adjust based on your item height and screen size to balance initial load time with perceived performance.

### Example
```tsx
<FlatList
  data={data}
  renderItem={({item}) => <Text>{item.title}</Text>}
  initialNumToRender={15}
/>
```
```

--------------------------------

### onStartShouldSetResponder Handler

Source: https://reactnative.dev/docs/gesture-responder-system

Determines if a view should become the touch responder when a touch begins. This is the initial negotiation method called at the start of a touch event.

```APIDOC
## View.props.onStartShouldSetResponder

### Description
Determines if this view wants to become the touch responder on the start of a touch. Called during the bubbling phase, with the deepest component called first.

### Method
Callback Handler

### Parameters
#### Callback Arguments
- **evt** (SyntheticTouchEvent) - Required - The synthetic touch event object

### Return Value
- **boolean** - Return `true` to attempt to become the responder, `false` otherwise

### Request Example
```javascript
<View
  onStartShouldSetResponder={(evt) => true}
/>
```

### Response
If the view returns `true`, the responder system will:
1. Call `onResponderGrant` if this view becomes the responder
2. Call `onResponderReject` if another view is already the responder

### Related Handlers
- `onStartShouldSetResponderCapture` - Capture phase version for parent components
- `onResponderGrant` - Called when this view becomes the responder
- `onResponderReject` - Called when responder is denied
```

--------------------------------

### Configure React Native Host with Turbo Modules - Kotlin

Source: https://reactnative.dev/docs/0.78/turbo-native-modules-introduction_platforms=ios

Sets up the DefaultReactNativeHost in Android with package management, developer support, and architecture flags. Initializes SoLoader for native library loading and enables the new architecture if configured. This is the main Android application setup for Turbo Module integration.

```kotlin
object : DefaultReactNativeHost(this) {
  override fun getPackages(): List<ReactPackage> =
    PackageList(this).packages.apply {
      add(NativeLocalStoragePackage())
    }

  override fun getJSMainModuleName(): String = "index"

  override fun getUseDeveloperSupport(): Boolean = BuildConfig.DEBUG

  override val isNewArchEnabled: Boolean = BuildConfig.IS_NEW_ARCHITECTURE_ENABLED
  override val isHermesEnabled: Boolean = BuildConfig.IS_HERMES_ENABLED
}

override val reactHost: ReactHost
  get() = getDefaultReactHost(applicationContext, reactNativeHost)

override fun onCreate() {
  super.onCreate()
  SoLoader.init(this, false)
  if (BuildConfig.IS_NEW_ARCHITECTURE_ENABLED) {
    load()
  }
}
```

--------------------------------

### Untitled

Source: https://reactnative.dev/docs/0.79/animated

No description

--------------------------------

### Add Local React Native Library as Dependency

Source: https://reactnative.dev/docs/the-new-architecture/create-module-library

Install a sibling React Native library as a local module using yarn. Navigate to the App folder and reference the relative path to the Library directory. This approach allows development and testing of the library without publishing to NPM.

```bash
yarn add ../Library
```

--------------------------------

### Configure Bundle Command for React Native

Source: https://reactnative.dev/docs/0.77/react-native-gradle-plugin

Sets the bundle command name to invoke when creating the app bundle. Default is 'bundle'. Customize to use alternative bundle formats like 'ram-bundle' for optimized performance.

```groovy
bundleCommand = "ram-bundle"
```

--------------------------------

### Android Manifest Configuration for HTTPS Intent Handling

Source: https://reactnative.dev/docs/linking

XML configuration required in AndroidManifest.xml for Android 11+ (SDK 30+) to enable URL scheme handling. This example demonstrates how to add intent queries for https scheme URLs, allowing the app to properly handle https links.

```xml
<manifest ...>
  <queries>
    <intent>
      <action android:name="android.intent.action.VIEW" />
      <data android:scheme="https"/>
    </intent>
  </queries>
</manifest>
```

--------------------------------

### Start Android Foreground Service and Acquire Wake Lock in Kotlin

Source: https://reactnative.dev/docs/headless-js-android

This snippet demonstrates how to start an Android foreground service and immediately acquire a wake lock using `HeadlessJsTaskService`. This is typically used in React Native background tasks to ensure the service continues running and the device doesn't sleep while the task is active. It requires a `Context` and a boolean `hasInternet` flag to be passed to the service.

```kotlin
val serviceIntent = Intent(context, MyTaskService::class.java)
serviceIntent.putExtra("hasInternet", hasInternet)
context.startForegroundService(serviceIntent)
HeadlessJsTaskService.acquireWakeLockNow(context)
```

--------------------------------

### initialScrollIndex Property

Source: https://reactnative.dev/docs/virtualizedlist

Starts the list scrolled to a specific index instead of the top. Requires getItemLayout to be implemented.

```APIDOC
## initialScrollIndex

### Description
Instead of starting at the top with the first item, start at `initialScrollIndex`. This disables the "scroll to top" optimization that keeps the first `initialNumToRender` items always rendered and immediately renders the items starting at this initial index. Requires `getItemLayout` to be implemented.

### Type
number

### Required
No

### Dependencies
Requires `getItemLayout` to be implemented.

### Usage
Use this to start the list at a specific position, such as resuming from a saved scroll position.

### Example
```tsx
<FlatList
  data={data}
  renderItem={({item}) => <Text>{item.title}</Text>}
  initialScrollIndex={25}
  getItemLayout={(data, index) => ({
    length: 50,
    offset: 50 * index,
    index
  })}
/>
```
```

--------------------------------

### onStartShouldSetResponderCapture

Source: https://reactnative.dev/docs/0.80/view

If a parent view wants to prevent a child view from becoming responder on touch start, it should have this handler which returns `true`.

```APIDOC
## onStartShouldSetResponderCapture

### Description
If a parent `View` wants to prevent a child `View` from becoming responder on a touch start, it should have this handler which returns `true`.

### Method
N/A - Property

### Endpoint
N/A - Property

### Parameters
#### Request Body
- **nativeEvent** (PressEvent) - Description of native event

### Request Example
```json
{
  "nativeEvent": "PressEvent"
}
```

```

--------------------------------

### focus() Method

Source: https://reactnative.dev/docs/next/textinput

Makes the native text input request focus, bringing the keyboard into view and directing user input to this field.

```APIDOC
## focus() Method

### Description
Makes the native input request focus.

### Signature
```
focus(): void
```

### Return Value
No return value

### Example
```
textInputRef.current.focus();
```
```

--------------------------------

### GET Platform.OS

Source: https://reactnative.dev/docs/next/platform

Returns a string value representing the current operating system (e.g., 'android', 'ios').

```APIDOC
## GET /Platform.OS

### Description
Returns a string value representing the current OS.

### Method
GET

### Endpoint
/Platform.OS

### Response
#### Success Response (200)
- **value** (enum<'android', 'ios'>) - The current operating system.

#### Response Example
```json
"ios"
```
```

--------------------------------

### React Native TargetEvent Object Structure Example

Source: https://reactnative.dev/docs/0.80/targetevent

This example illustrates the basic structure of a `TargetEvent` object, which includes a `target` property representing the node ID. This object is returned in callbacks for focus changes, such as `onFocus` or `onBlur` in components like `TextInput`.

```json
{
    target: 1127
}
```

--------------------------------

### Create ReactPackage with Module Info - Java

Source: https://reactnative.dev/docs/0.77/turbo-native-modules-introduction

Implements getReactModuleInfos() method to provide metadata about the native module. This method creates a HashMap containing ReactModuleInfo for NativeLocalStorageModule, specifying that it's a TurboModule but not an eager initialization or CXX module. Returns the module information provider to React Native for proper module resolution.

```java
public Map<String, ReactModuleInfo> getReactModuleInfos() {
  Map<String, ReactModuleInfo> map = new HashMap<>();
  map.put(NativeLocalStorageModule.NAME, new ReactModuleInfo(
    NativeLocalStorageModule.NAME,       // name
    NativeLocalStorageModule.NAME,       // className
    false, // canOverrideExistingModule
    false, // needsEagerInit
    false, // isCXXModule
    true   // isTurboModule
  ));
  return map;
}
```

--------------------------------

### Alert Component Methods Overview

Source: https://reactnative.dev/docs/0.77/alert

Identified methods for the React Native Alert component. While their existence is noted, detailed parameter specifications and usage examples for these methods are not provided in the current documentation excerpt.

```APIDOC
## Methods Overview

### Description
The following methods are associated with the React Native Alert component. While their existence is noted, detailed parameter specifications and usage examples are not provided in the current documentation excerpt.

### Methods
- `alert()`
- `prompt()`

### Platform Availability
- `alert()`: Available on Android.
- `prompt()`: Available on Android.

### Further Documentation
Refer to official React Native documentation for detailed usage, parameters, and examples for `Alert.alert()` and `Alert.prompt()`.
```

--------------------------------

### Basic Interpolation Mapping in React Native

Source: https://reactnative.dev/docs/animations

Demonstrates basic interpolation that maps an input range to an output range. This example converts a 0-1 range to a 0-100 range, which is the foundation for more complex interpolation scenarios.

```typescript
value.interpolate({
  inputRange: [0, 1],
  outputRange: [0, 100],
});
```

--------------------------------

### Initialize React Native Turbo Module Project

Source: https://reactnative.dev/docs/turbo-native-modules-introduction_language=typescript&platforms=android

Create a new React Native project with version 0.82 using the React Native CLI. This sets up the foundational project structure needed to develop Turbo Native Modules.

```shell
npx @react-native-community/cli@latest init TurboModuleExample --version 0.82
```

--------------------------------

### Create PerformanceObserver and monitor performance entries

Source: https://reactnative.dev/docs/global-PerformanceObserver

Creates a new PerformanceObserver instance with a callback that processes performance entries. The observer is configured to monitor 'mark' and 'measure' entry types. The callback receives a PerformanceEntryList and logs details about each entry including type, name, start time, and duration.

```typescript
const observer = new PerformanceObserver(
  (list, observer, options) => {
    for (const entry of list.getEntries()) {
      console.log(
        'Received entry with type',
        entry.entryType,
        'and name',
        entry.name,
        'that started at',
        entry.startTime,
        'and took',
        entry.duration,
        'ms',
      );
    }
  },
);

observer.observe({entryTypes: ['mark', 'measure']});
```

--------------------------------

### Animated.stagger()

Source: https://reactnative.dev/docs/animated

Starts animations in order with successive delays, running them in parallel but with staggered timing. Creates visually appealing cascading animations.

```APIDOC
## Animated.stagger()

### Description
Starts animations in order and in parallel, but with successive delays between each animation start, creating a staggered effect.

### Method
Static method

### Signature
```typescript
static stagger(time, animations): CompositeAnimation;
```

### Parameters
- **time** (number) - Required - Delay between animation starts in milliseconds
- **animations** (array) - Required - Array of animation objects to run with stagger

### Behavior
- First animation starts immediately
- Each subsequent animation starts after the specified time delay
- All animations can run concurrently once started

### Usage Example
```typescript
const animatedValue1 = new Animated.Value(0);
const animatedValue2 = new Animated.Value(0);
const animatedValue3 = new Animated.Value(0);
Animated.stagger(100, [
  Animated.timing(animatedValue1, { toValue: 100, duration: 500, useNativeDriver: false }),
  Animated.timing(animatedValue2, { toValue: 100, duration: 500, useNativeDriver: false }),
  Animated.timing(animatedValue3, { toValue: 100, duration: 500, useNativeDriver: false })
]).start();
```

### Returns
- **CompositeAnimation** - A composite animation object that can be started or stopped
```

--------------------------------

### PlatformColor with Platform-Specific Styling - React Native

Source: https://reactnative.dev/docs/0.78/platformcolor

Complete example demonstrating proper PlatformColor usage with platform-specific styling using Platform.select(). Shows how to apply native colors for iOS and Android text and background colors while maintaining a default fallback. Requires react-native, react-native-safe-area-context imports.

```javascript
import React from 'react';
import {Platform, PlatformColor, StyleSheet, Text} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <Text style={styles.label}>I am a special label color!</Text>
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  label: {
    padding: 16,
    fontWeight: '800',
    ...Platform.select({
      ios: {
        color: PlatformColor('label'),
        backgroundColor: PlatformColor('systemTealColor'),
      },
      android: {
        color: PlatformColor('?android:attr/textColor'),
        backgroundColor: PlatformColor('@android:color/holo_blue_bright'),
      },
      default: {color: 'black'},
    }),
  },
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});

export default App;
```

--------------------------------

### Implement Bridging Header for Swift-Objective-C Interoperability (Objective-C)

Source: https://reactnative.dev/docs/the-new-architecture/turbo-modules-with-swift

No description

--------------------------------

### Apply Platform-Specific Background Colors using Platform.select

Source: https://reactnative.dev/docs/0.77/platform-specific-code

This example illustrates using `Platform.select` to dynamically set background colors based on the operating system. It provides different colors for iOS, Android, and a default for other platforms like web, ensuring visual consistency across environments.

```tsx
import {Platform, StyleSheet} from 'react-native';  
  
const styles = StyleSheet.create({  
  container: {  
    flex: 1,  
    ...Platform.select({  
      ios: {  
        backgroundColor: 'red',  
      },  
      android: {  
        backgroundColor: 'green',  
      },  
      default: {  
        // other platforms, web for example  
        backgroundColor: 'blue',  
      },  
    }),  
  },  
});
```

--------------------------------

### Run React Native Android Application

Source: https://reactnative.dev/docs/0.77/turbo-native-modules-introduction_language=typescript&platforms=ios

These commands show how to build and launch the React Native Android application on an emulator or connected device. Developers can choose between `npm` or `yarn` to execute the build process and deploy the app.

```bash
npm run android
```

```bash
yarn run android
```

--------------------------------

### enterKeyHint Property

Source: https://reactnative.dev/docs/textinput

Configures the text displayed on the return key, with cross-platform and platform-specific options. This property takes precedence over the returnKeyType prop and supports different values for iOS and Android platforms.

```APIDOC
## enterKeyHint Property

### Description
Determines what text should be shown to the return key. Has precedence over the `returnKeyType` prop.

### Type
```
enum('enter', 'done', 'next', 'previous', 'search', 'send', 'go')
```

### Supported Values

#### Cross-Platform Values
- `done` - Shows "Done" on the return key
- `next` - Shows "Next" on the return key
- `search` - Shows "Search" on the return key
- `send` - Shows "Send" on the return key
- `go` - Shows "Go" on the return key

#### Android Only
- `previous` - Shows "Previous" on the return key

#### iOS Only
- `enter` - Shows "Enter" on the return key

### Example Usage
```javascript
<TextInput
  enterKeyHint="done"
  placeholder="Enter text"
/>
```
```

--------------------------------

### Find JDK Directory and Generate Upload Key on macOS

Source: https://reactnative.dev/docs/0.80/signed-apk-android

Two-step process for macOS: first locates the JDK bin directory using java_home command, then generates the signing key using keytool with sudo permissions. Produces a keystore file valid for 10000 days.

```shell
/usr/libexec/java_home
```

```shell
sudo keytool -genkey -v -keystore my-upload-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
```

--------------------------------

### Use ECMAScript

Source: https://reactnative.dev/docs/0.81/javascript-environment

No description

--------------------------------

### Animated.delay()

Source: https://reactnative.dev/docs/animated

Starts an animation after a given delay. Used to introduce timing gaps between animation sequences in your application.

```APIDOC
## Animated.delay()

### Description
Starts an animation after a given delay, allowing you to control when animations begin in a sequence.

### Method
Static method

### Signature
```typescript
static delay(value, delayTime): CompositeAnimation;
```

### Parameters
- **value** (Animated.Value) - Required - The animated value to delay
- **delayTime** (number) - Required - Delay time in milliseconds

### Usage Example
```typescript
const animatedValue = new Animated.Value(0);
Animated.delay(animatedValue, 1000).start();
```

### Returns
- **CompositeAnimation** - A composite animation object that can be started or stopped
```

--------------------------------

### Set JAVA_HOME Environment Variable in Zsh

Source: https://reactnative.dev/docs/0.78/set-up-your-environment

Configure JAVA_HOME environment variable to point to the installed Zulu JDK 17 location. Add this to ~/.zshrc or ~/.bash_profile for persistent configuration across terminal sessions.

```shell
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
```

--------------------------------

### Generate Upload Key with keytool on Windows

Source: https://reactnative.dev/docs/0.77/signed-apk-android

Generates a private signing key using keytool on Windows from the JDK bin directory. Creates a PKCS12 keystore file valid for 10000 days with RSA 2048-bit encryption. Requires administrator privileges and prompts for keystore/key passwords and Distinguished Name fields.

```shell
keytool -genkeypair -v -storetype PKCS12 -keystore my-upload-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
```

--------------------------------

### iOS Project Directory Structure for RCTWebView Component

Source: https://reactnative.dev/docs/0.79/fabric-native-components-introduction

Shows the expected file organization after completing the 6-step setup process, displaying the WebView group containing the header and implementation files within the Demo iOS project.

```text
Demo/ios
Podfile
...
Demo
├── AppDelegate.swift
...
├── RCTWebView.h
└── RCTWebView.mm
```

--------------------------------

### Animated.parallel()

Source: https://reactnative.dev/docs/0.79/animated

Starts an array of animations all at the same time. By default, if one of the animations is stopped, they will all be stopped. You can override this with the `stopTogether` flag in the configuration.

```APIDOC
## Animated.parallel()

### Description
Starts an array of animations all at the same time. By default, if one of the animations is stopped, they will all be stopped. You can override this with the `stopTogether` flag.

### Method
Static Method

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
- **animations** (`CompositeAnimation[]`) - Required - An array of animations to run in parallel.
- **config?** (`ParallelConfig`) - Optional - Configuration object for parallel animations.
  - **stopTogether** (boolean) - Optional - If `false`, stopping one animation will not stop others. Default `true`.

### Request Example
```tsx
Animated.parallel([
  Animated.timing(this.state.opacity, { toValue: 1, duration: 1000, useNativeDriver: true }),
  Animated.spring(this.state.scale, { toValue: 1.5, useNativeDriver: true })
], { stopTogether: false }).start();
```

### Response
#### Success Response (Returns CompositeAnimation)
- **CompositeAnimation** (object) - A composite animation object that can be started.

#### Response Example
```json
// The method returns a CompositeAnimation instance, not a direct JSON response.
// Its effect is observed visually.
```
```

--------------------------------

### GET Platform.isTesting

Source: https://reactnative.dev/docs/next/platform

Returns a boolean indicating if the application is running in Developer Mode with the testing flag set.

```APIDOC
## GET /Platform.isTesting

### Description
Returns a boolean which defines if application is running in Developer Mode with testing flag set.

### Method
GET

### Endpoint
/Platform.isTesting

### Response
#### Success Response (200)
- **value** (boolean) - True if in testing mode, false otherwise.

#### Response Example
```json
true
```
```

--------------------------------

### delay()

Source: https://reactnative.dev/docs/0.80/animated

Starts an animation after the given delay.

```APIDOC
## FUNCTION delay()

### Description
Starts an animation after the given delay.

### Method
FUNCTION

### Endpoint
static delay(time: number): CompositeAnimation;

### Parameters
#### Request Body
- **time** (number) - Required - The delay time in milliseconds before starting the animation.

### Request Example
```json
{
  "time": 500
}
```

### Response
#### Success Response (200)
- **animation** (CompositeAnimation) - The created composite animation object that will start after the delay.
```

--------------------------------

### Implement Initialization for iOS Native Modules

Source: https://reactnative.dev/docs/0.79/the-new-architecture/native-modules-lifecycle

To perform initialization logic for a stateful iOS Native Module, you must conform to the `RCTInitializing` protocol in the module's header file and implement the `initialize` method in its implementation file. This method is called by the Native Module infrastructure when the module is first created, allowing for setup code that might require access to the ReactApplicationContext.

```Objective-C
+ #import <React/RCTInitializing.h>  
  
//...  
  
- @interface NativeModule : NSObject <NativeModuleSpec>  
+ @interface NativeModule : NSObject <NativeModuleSpec, RCTInitializing>  
//...  
@end  
```

```Objective-C
// ...  
  
@implementation NativeModule  
  
+- (void)initialize {  
+ // add the initialization code here  
+}  
  
@end  
```

--------------------------------

### Install TypeScript dependencies using npm and Yarn

Source: https://reactnative.dev/docs/0.77/typescript

Adds TypeScript compiler, type definitions for React and Jest, and ESLint plugins to an existing React Native project. Run this command in the project root directory to enable TypeScript support.

```shell
npm install -D @tsconfig/react-native @types/jest @types/react @types/react-test-renderer typescript
```

```shell
yarn add --dev @tsconfig/react-native @types/jest @types/react @types/react-test-renderer typescript
```

--------------------------------

### Codegen CLI Help and Options - Shell

Source: https://reactnative.dev/docs/0.77/the-new-architecture/codegen-cli

Displays the help information and available command-line options for the Codegen CLI tool. This shows all supported flags including verbose logging, project path specification, platform targeting, and output path configuration.

```shell
npx @react-native-community/cli codegen --help
Usage: rnc-cli codegen [options]

Options:
  --verbose            Increase logging verbosity
  --path <path>        Path to the React Native project root. (default: "/Users/MyUsername/projects/my-app")
  --platform <string>  Target platform. Supported values: "android", "ios", "all". (default: "all")
  --outputPath <path>  Path where generated artifacts will be output to.
  -h, --help           display help for command
```

--------------------------------

### Handle ECMAScript 5 Reserved Words in JavaScript

Source: https://reactnative.dev/docs/0.77/javascript-environment

Demonstrates how Babel transforms ECMAScript 5 reserved words, allowing their use as property names or in contexts where they might otherwise cause syntax errors. This specific example shows a `catch` block.

```JavaScript
promise.catch(function() {...});
```

--------------------------------

### borderBlockColor

Source: https://reactnative.dev/docs/view-style-props

Sets the block color for the border, affecting both start and end block edges.

```APIDOC
## STYLE PROPERTY borderBlockColor

### Description
Sets the block color for the border.

### Method
Property

### Endpoint
/borderBlockColor

### Parameters
#### Request Body
- **borderBlockColor** (color) - Required - The color for the block borders.

### Request Example
```javascript
{
  "borderBlockColor": "green"
}
```

### Response
N/A
```

--------------------------------

### Return Platform-Specific Components with Platform.select() in React Native

Source: https://reactnative.dev/docs/0.81/platform

Shows how to use Platform.select() to dynamically require and render different components based on the platform. The first example loads platform-specific iOS or Android components, while the second loads native components or web components based on the environment.

```typescript
const Component = Platform.select({
  ios: () => require('ComponentIOS'),
  android: () => require('ComponentAndroid'),
})();

<Component />;
```

```typescript
const Component = Platform.select({
  native: () => require('ComponentForNative'),
  default: () => require('ComponentForWeb'),
})();

<Component />;
```

--------------------------------

### Implement Asynchronous Native Method with Logging (Objective-C)

Source: https://reactnative.dev/docs/0.77/legacy/native-modules-ios

This example enhances the `createCalendarEvent` native method by adding `RCTLogInfo` to output a message to the console. This helps confirm that the method is being invoked from JavaScript. It requires importing `<React/RCTLog.h>` at the top of the file.

```objectivec
#import <React/RCTLog.h>  
RCT_EXPORT_METHOD(createCalendarEvent:(NSString *)name location:(NSString *)location)  
{  
 RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);  
}  
```

--------------------------------

### PixelRatio Example - React Native App with Device Metrics

Source: https://reactnative.dev/docs/0.77/pixelratio

A complete React Native application demonstrating PixelRatio functionality. Displays current device pixel ratio, font scale, and shows how images scale based on layout size. Uses SafeAreaView for proper device inset handling and ScrollView for vertical scrolling of content.

```javascript
import React from 'react';
import {
  Image,
  PixelRatio,
  ScrollView,
  StyleSheet,
  Text,
  View,
} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const size = 50;
const cat = {
  uri: 'https://reactnative.dev/docs/assets/p_cat1.png',
  width: size,
  height: size,
};

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <ScrollView style={styles.scrollContainer}>
        <View style={styles.container}>
          <Text>Current Pixel Ratio is:</Text>
          <Text style={styles.value}>{PixelRatio.get()}</Text>
        </View>
        <View style={styles.container}>
          <Text>Current Font Scale is:</Text>
          <Text style={styles.value}>{PixelRatio.getFontScale()}</Text>
        </View>
        <View style={styles.container}>
          <Text>On this device images with a layout width of</Text>
          <Text style={styles.value}>{size} px</Text>
          <Image source={cat} />
        </View>
        <View style={styles.container}>
          <Text>require images with a pixel width of</Text>
          <Text style={styles.value}>
            {PixelRatio.getPixelSizeForLayoutSize(size)} px
          </Text>
          <Image
            source={cat}
            style={{
              width: PixelRatio.getPixelSizeForLayoutSize(size),
              height: PixelRatio.getPixelSizeForLayoutSize(size),
            }}
          />
        </View>
      </ScrollView>
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  scrollContainer: {
    flex: 1,
  },
  container: {
    justifyContent: 'center',
    alignItems: 'center',
  },
  value: {
    fontSize: 24,
    marginBottom: 12,
    marginTop: 4,
  },
});

export default App;
```

--------------------------------

### Run React Native Android with Single ABI (CLI)

Source: https://reactnative.dev/docs/0.78/build-speed

This command executes the `run-android` task via `yarn` with the `--active-arch-only` flag. It automatically detects the architecture of the connected device or emulator and builds only that specific ABI, significantly reducing local Android build times.

```bash
$ yarn react-native run-android --active-arch-only
  
[ ... ]
info Running jetifier to migrate libraries to AndroidX. You can disable it using "--no-jetifier" flag.
Jetifier found 1037 file(s) to forward-jetify. Using 32 workers...
info JS server already running.
info Detected architectures arm64-v8a
info Installing the app...
```

--------------------------------

### Example TextLayout Object Structure (JavaScript)

Source: https://reactnative.dev/docs/0.77/text

This JavaScript code block illustrates the structure of a `TextLayout` object. It provides measurement data for a single text line, including its cap height, ascender, descender, width, height, x-height, and coordinates.

```js
{
    capHeight: 10.496,
    ascender: 14.624,
    descender: 4,
    width: 28.224,
    height: 18.624,
    xHeight: 6.048,
    x: 0,
    y: 0
}
```

--------------------------------

### Navigate between screens with useNavigation hook

Source: https://reactnative.dev/docs/0.77/navigation

Use the useNavigation hook to access the navigation object and navigate between screens. The example demonstrates navigating to the Profile screen with parameters and accessing those parameters in the target screen component.

```typescript
import {useNavigation} from '@react-navigation/native';

function HomeScreen() {
  const navigation = useNavigation();

  return (
    <Button
      title="Go to Jane's profile"
      onPress={() =>
        navigation.navigate('Profile', {name: 'Jane'})
      }
    />
  );
}

function ProfileScreen({route}) {
  return <Text>This is {route.params.name}'s profile</Text>;
}
```

--------------------------------

### List Available iOS Simulators

Source: https://reactnative.dev/docs/0.78/running-on-simulator-ios

Displays all available iOS simulators and their UDIDs using the xcrun command-line tool. This command helps identify valid device names and UDIDs for use with the --simulator and --udid flags.

```shell
xcrun simctl list devices
```

--------------------------------

### Add React Native subspecs to Podfile (Ruby)

Source: https://reactnative.dev/docs/0.81/troubleshooting

Demonstrates how to include specific React Native subspecs, such as `RCTText`, `RCTImage`, and `RCTNetwork`, in a CocoaPods `Podfile` to ensure necessary dependencies are linked for React Native APIs.

```ruby
pod 'React', :path => '../node_modules/react-native', :subspecs = [
  'RCTText',
  'RCTImage',
  'RCTNetwork',
  'RCTWebSocket',
]
```

--------------------------------

### React Native: Error Handling with Callbacks (Objective-C & TypeScript/JSX)

Source: https://reactnative.dev/docs/0.77/legacy/native-modules-ios

Explains and provides code examples on handling errors within the callback mechanism.  Shows how to pass errors back to JavaScript using the first argument of the callback array.

```objectivec
RCT_EXPORT_METHOD(createCalendarEventCallback:(NSString *)title location:(NSString *)location callback: (RCTResponseSenderBlock)callback)  
{
  NSNumber *eventId = [NSNumber numberWithInt:123];
  callback(@[[NSNull null], eventId]);
}

```

```tsx
const onPress = () => {
  CalendarModule.createCalendarEventCallback(
    'testName',
    'testLocation',
    (error, eventId) => {
      if (error) {
        console.error(`Error found! ${error}`);
      }
      console.log(`event id ${eventId} returned`);
    },
  );
};

```

--------------------------------

### Initialize React Native Application with CLI

Source: https://reactnative.dev/docs/0.77/the-new-architecture/pure-cxx-modules

Command to create a new React Native application with version 0.77 using the community CLI. This sets up the base project structure needed for implementing C++ native modules.

```shell
npx @react-native-community/cli@latest init SampleApp --version 0.77
```

--------------------------------

### Create React Native Android Image Picker Module with onActivityResult (Java/Kotlin)

Source: https://reactnative.dev/docs/next/legacy/native-modules-android

This comprehensive example demonstrates building a React Native module for picking images from the device's gallery. It utilizes `startActivityForResult` to launch the image picker and `onActivityResult` to handle the selected image's URI, resolving a Promise back to JavaScript.

```java
public class ImagePickerModule extends ReactContextBaseJavaModule {
  
  private static final int IMAGE_PICKER_REQUEST = 1;  
  private static final String E_ACTIVITY_DOES_NOT_EXIST = "E_ACTIVITY_DOES_NOT_EXIST";  
  private static final String E_PICKER_CANCELLED = "E_PICKER_CANCELLED";  
  private static final String E_FAILED_TO_SHOW_PICKER = "E_FAILED_TO_SHOW_PICKER";  
  private static final String E_NO_IMAGE_DATA_FOUND = "E_NO_IMAGE_DATA_FOUND";  
  
  private Promise mPickerPromise;  
  
  private final ActivityEventListener mActivityEventListener = new BaseActivityEventListener() {  
  
    @Override  
    public void onActivityResult(Activity activity, int requestCode, int resultCode, Intent intent) {  
      if (requestCode == IMAGE_PICKER_REQUEST) {  
        if (mPickerPromise != null) {  
          if (resultCode == Activity.RESULT_CANCELED) {  
            mPickerPromise.reject(E_PICKER_CANCELLED, "Image picker was cancelled");  
          } else if (resultCode == Activity.RESULT_OK) {  
            Uri uri = intent.getData();  
  
            if (uri == null) {  
              mPickerPromise.reject(E_NO_IMAGE_DATA_FOUND, "No image data found");  
            } else {  
              mPickerPromise.resolve(uri.toString());  
            }  
          }  
  
          mPickerPromise = null;  
        }  
      }  
    }  
  };  
  
  ImagePickerModule(ReactApplicationContext reactContext) {  
    super(reactContext);  
  
    // Add the listener for `onActivityResult`  
    reactContext.addActivityEventListener(mActivityEventListener);  
  }
  
  @Override  
  public String getName() {  
    return "ImagePickerModule";  
  }
  
  @ReactMethod  
  public void pickImage(final Promise promise) {  
    Activity currentActivity = getCurrentActivity();  
  
    if (currentActivity == null) {  
      promise.reject(E_ACTIVITY_DOES_NOT_EXIST, "Activity doesn't exist");  
      return;  
    }
  
    // Store the promise to resolve/reject when picker returns data  
    mPickerPromise = promise;  
  
    try {  
      final Intent galleryIntent = new Intent(Intent.ACTION_PICK);  
  
      galleryIntent.setType("image/*");  
  
      final Intent chooserIntent = Intent.createChooser(galleryIntent, "Pick an image");  
  
      currentActivity.startActivityForResult(chooserIntent, IMAGE_PICKER_REQUEST);  
    } catch (Exception e) {  
      mPickerPromise.reject(E_FAILED_TO_SHOW_PICKER, e);  
      mPickerPromise = null;  
    }
  }
}
```

```kotlin
class ImagePickerModule(reactContext: ReactApplicationContext) :
    ReactContextBaseJavaModule(reactContext) {  
  
    private var pickerPromise: Promise? = null  
  
    private val activityEventListener =  
        object : BaseActivityEventListener() {  
            override fun onActivityResult(  
                activity: Activity?,  
                requestCode: Int,  
                resultCode: Int,  
                intent: Intent?  
            ) {  
                if (requestCode == IMAGE_PICKER_REQUEST) {  
                    pickerPromise?.let { promise ->  
                        when (resultCode) {  
                            Activity.RESULT_CANCELED ->  
                                promise.reject(E_PICKER_CANCELLED, "Image picker was cancelled")  
                            Activity.RESULT_OK -> {  
                                val uri = intent?.data  
  
                                uri?.let { promise.resolve(uri.toString())}
                                    ?: promise.reject(E_NO_IMAGE_DATA_FOUND, "No image data found")  
                            }
                        }
  
                        pickerPromise = null
```

--------------------------------

### Codegen iOS Build Output

Source: https://reactnative.dev/docs/0.80/turbo-native-modules-introduction_language=typescript&platforms=android

Example output from executing Codegen for iOS platform. Shows script phases being added to ReactCodegen, generation of podspec.json, and discovery of codegen-enabled libraries in dependencies.

```shell
...
Framework build type is static library
[Codegen] Adding script_phases to ReactCodegen.
[Codegen] Generating ./build/generated/ios/ReactCodegen.podspec.json
[Codegen] Analyzing /Users/me/src/TurboModuleExample/package.json
[Codegen] Searching for codegen-enabled libraries in the app.
[Codegen] Found TurboModuleExample
[Codegen] Searching for codegen-enabled libraries in the project dependencies.
[Codegen] Found react-native
...
```

--------------------------------

### Configure Metro with a function to customize resolver (advanced)

Source: https://reactnative.dev/docs/next/metro

This advanced example demonstrates exporting a function from `metro.config.js` to gain granular control over the Metro configuration. It customizes the resolver by removing 'svg' from `assetExts` and adding it to `sourceExts`, which is useful for custom SVG handling. This method requires manually managing all default configurations.

```js
const {getDefaultConfig, mergeConfig} = require('@react-native/metro-config');  
  
module.exports = function (baseConfig) {  
  const defaultConfig = mergeConfig(baseConfig, getDefaultConfig(__dirname));  
  const {resolver: {assetExts, sourceExts}} = defaultConfig;  
  
  return mergeConfig(  
    defaultConfig,  
    {  
      resolver: {  
        assetExts: assetExts.filter(ext => ext !== 'svg'),  
        sourceExts: [...sourceExts, 'svg'],  
      },  
    },  
  );  
};
```

--------------------------------

### showShareActionSheetWithOptions()

Source: https://reactnative.dev/docs/0.81/actionsheetios

Displays the native iOS share sheet, allowing users to share content such as URLs, messages, and files via various installed apps and services.

```APIDOC
## `showShareActionSheetWithOptions()`

### Description
Displays the iOS share sheet, providing options for users to share content through available activities on their device.

### Method Signature
```typescript
static showShareActionSheetWithOptions: (
  options: ShareActionSheetIOSOptions,
  failureCallback: (error: Error) => void,
  successCallback: (success: boolean, method: string) => void,
);
```

### Parameters
#### `options: ShareActionSheetIOSOptions` (object) - Required
The options object containing the content to share and configuration for the share sheet. It must include either `message` or `url`, or both.
- **url** (string) - Optional - A URL to share. If it points to a local file or is a base64-encoded URI, the file content will be loaded and shared directly. Otherwise, it must conform to URL format as described in RFC 2396 (e.g., starting with http:// or https://).
- **message** (string) - Optional - A message string to share.
- **subject** (string) - Optional - A subject for the message, commonly used when sharing via email.
- **excludedActivityTypes** (array<string>) - Optional - An array of activity type identifiers (e.g., `['com.apple.UIKit.activity.PostToTwitter']`) to exclude from the ActionSheet.

#### `failureCallback: (error: Error) => void` (function) - Required
A callback function that is invoked if the share sheet operation fails.
- **error** (object) - An error object. The only property defined on this object is an optional `stack` property of type `string`.

#### `successCallback: (success: boolean, method: string) => void` (function) - Required
A callback function that is invoked upon successful completion or if the user cancels the share sheet action.
- **success** (boolean) - A boolean value: `true` if the share was successful, `false` if the user cancelled the action.
- **method** (string) - A string indicating the method of sharing (e.g., "com.apple.UIKit.activity.Mail", "com.apple.UIKit.activity.PostToTwitter"). This parameter is only provided if `success` is `true`.

### Usage Example
```typescript
import { Share } from 'react-native';

Share.showShareActionSheetWithOptions(
  {
    url: 'https://reactnative.dev',
    message: 'Check out React Native!',
    subject: 'React Native Documentation',
    excludedActivityTypes: ['com.apple.UIKit.activity.PostToFacebook'] // Example: exclude Facebook sharing
  },
  (error: Error) => {
    console.log('Share failed:', error.message);
  },
  (success: boolean, method: string) => {
    if (success) {
      console.log('Shared successfully via:', method);
    } else {
      console.log('Share cancelled by user');
    }
  }
);
```
```

--------------------------------

### Configure Main Thread Setup for iOS Native Module

Source: https://reactnative.dev/docs/0.77/legacy/native-modules-ios

Implement the requiresMainQueueSetup class method in Objective-C to indicate whether the native module requires initialization on the main thread. Return YES if the module needs UIKit access, or NO if it does not. This prevents warnings about potential background thread initialization in React Native.

```objectivec
+ (BOOL)requiresMainQueueSetup
{
  return NO;
}
```

--------------------------------

### Configure Maven Enterprise Repository

Source: https://reactnative.dev/docs/build-speed

Set an exclusive Maven enterprise repository URL to fetch all project dependencies from a single internal proxy. This ensures all dependencies are retrieved exclusively from the specified repository, bypassing public repositories.

```properties
+exclusiveEnterpriseRepository=https://my.internal.proxy.net/
```

--------------------------------

### Basic Pressable Component Usage in React Native

Source: https://reactnative.dev/docs/0.78/pressable

Simple example showing how to wrap content with Pressable to detect press interactions. The component calls onPressFunction when pressed and can wrap any child elements like Text components.

```jsx
<Pressable onPress={onPressFunction}>
  <Text>I'm pressable!</Text>
</Pressable>
```

--------------------------------

### Initialize new Expo project with TypeScript template

Source: https://reactnative.dev/docs/0.77/typescript

Creates a new Expo application with TypeScript support using the create-expo-app command. This is the recommended approach for new projects as TypeScript is configured automatically.

```shell
npx create-expo-app --template
```

--------------------------------

### Specify iOS Version and Device with Yarn

Source: https://reactnative.dev/docs/0.78/running-on-simulator-ios

Launches the app on a specific iOS device and version combination using Yarn. Include the version number in the simulator flag to target a particular iOS version installed on the system.

```shell
yarn ios --simulator "iPhone 14 Pro (16.0)"
```

--------------------------------

### Offset Properties

Source: https://reactnative.dev/docs/layout-props

Properties for controlling the position of components using directional offsets. Includes top, bottom, left, right, start, and end properties for precise layout control.

```APIDOC
## Offset Properties

### Description
Offset properties control the position of components relative to their container or containing block. They work with the position property to determine final layout.

### Properties

#### right
- **Type**: number, string
- **Required**: No
- **Description**: The number of logical pixels to offset the right edge of the component. Works similarly to right in CSS, but in React Native you must use points or percentages. Ems and other units are not supported. See https://developer.mozilla.org/en-US/docs/Web/CSS/right for more details.

#### start
- **Type**: number, string
- **Required**: No
- **Description**: Offsets the start edge of the component. When direction is ltr, equivalent to left. When direction is rtl, equivalent to right. This style takes precedence over the left, right, and end styles.

### Notes
- All offset values use logical pixels or percentages
- Ems and other CSS units are not supported in React Native
- The start and end properties are directionally-aware and adapt based on the text direction setting
```

--------------------------------

### Choose Components for Native or Web with Platform.select in React Native

Source: https://reactnative.dev/docs/0.80/platform-specific-code

This example extends `Platform.select` to differentiate between native platforms (iOS/Android) and other platforms, typically web. It allows a single component reference to resolve to either a native-specific or web-specific implementation.

```tsx
const Component = Platform.select({
  native: () => require('ComponentForNative'),
  default: () => require('ComponentForWeb'),
})();  
  
<Component />;
```

--------------------------------

### Example React Native PressEvent Object Structure

Source: https://reactnative.dev/docs/0.78/pressevent

This JavaScript object literal demonstrates the typical structure of a `PressEvent` object in React Native. It showcases common properties like `changedTouches`, `identifier`, `locationX`, `locationY`, `pageX`, `pageY`, `target`, `timestamp`, and `touches`, providing a concrete example of the data available during a touch interaction.

```javascript
{
    changedTouches: [PressEvent],
    identifier: 1,
    locationX: 8,
    locationY: 4.5,
    pageX: 24,
    pageY: 49.5,
    target: 1127,
    timestamp: 85131876.58868201,
    touches: []
}
```

--------------------------------

### Run React Native Codegen Script for iOS

Source: https://reactnative.dev/docs/0.77/the-new-architecture/using-codegen

This example demonstrates how to execute the React Native Codegen script specifically for iOS. It sets the current directory as the project root and `ios/` as the destination for the generated files. This command initiates the process of creating native code required for Turbo Native Modules and components on the iOS platform.

```shell
node node_modules/react-native/scripts/generate-codegen-artifacts.js \
    --path . \
    --outputPath ios/ \
    --targetPlatform ios  
```

--------------------------------

### Configure Codegen Directory Path

Source: https://reactnative.dev/docs/0.77/react-native-gradle-plugin

Specifies the folder where the react-native-codegen package is located. Default is ../node_modules/react-native-codegen. Adjust this for monorepo or custom package manager configurations.

```groovy
codegenDir = file("../node_modules/@react-native/codegen")
```

--------------------------------

### AppRegistry Overview

Source: https://reactnative.dev/docs/0.80/appregistry

AppRegistry serves as the JS entry point to running all React Native apps. App root components must register themselves with AppRegistry.registerComponent, and the native system loads and runs the app when ready.

```APIDOC
## AppRegistry Overview

### Description
AppRegistry is the JavaScript entry point for all React Native applications. It manages component registration, application lifecycle, and headless task execution.

### Key Concepts
- **Component Registration**: App root components register themselves using `registerComponent`
- **Application Lifecycle**: Native system loads the bundle and runs the app via `runApplication`
- **Cleanup**: Use `unmountApplicationComponentAtRootTag` to stop applications
- **Headless Tasks**: Background code execution without UI

### Basic Usage Example
```tsx
import {Text, AppRegistry} from 'react-native';

const App = () => (
  <View>
    <Text>App1</Text>
  </View>
);

AppRegistry.registerComponent('Appname', () => App);
```

### Important Notes
- Required early in the require sequence to setup JS execution environment
- Managed Expo workflow handles registration automatically via `registerRootComponent`
- Always pair `runApplication` with `unmountApplicationComponentAtRootTag`
```

--------------------------------

### Show a Minimal iOS Action Sheet in React Native

Source: https://reactnative.dev/docs/0.78/actionsheetios

This minimal example demonstrates the basic usage of `ActionSheetIOS.showActionSheetWithOptions`. It shows how to define a list of options, specify a destructive button, and handle button selections using a callback function. This snippet focuses on the core functionality without additional UI components.

```typescript
ActionSheetIOS.showActionSheetWithOptions(  
  {  
    options: ['Cancel', 'Remove'],  
    destructiveButtonIndex: 1,  
    cancelButtonIndex: 0,  
  },  
  buttonIndex => {  
    if (buttonIndex === 1) {  
      /* destructive action */  
    }  
  },  
);
```

--------------------------------

### VirtualizedList Configuration Properties

Source: https://reactnative.dev/docs/0.78/virtualizedlist

Comprehensive guide to all VirtualizedList component properties for configuring virtualization behavior, rendering performance, scroll handling, and data management in React Native lists.

```APIDOC
# VirtualizedList Component Properties

## disableVirtualization

### Description
Deprecated property that disables virtualization. Virtualization provides significant performance and memory optimizations, but fully unmounts react instances outside the render window. Only use for debugging purposes.

### Type
`boolean`

---

## extraData

### Description
A marker property for telling the list to re-render (since it implements PureComponent). If any renderItem, Header, Footer functions depend on data outside the data prop, place it here and treat immutably.

### Type
`any`

---

## getItemLayout

### Description
Function that returns layout information for items, enabling efficient scrolling and rendering calculations.

### Type
`function`

### Signature
```typescript
(data: any, index: number) => {length: number, offset: number, index: number}
```

---

## horizontal

### Description
If true, renders items next to each other horizontally instead of stacked vertically.

### Type
`boolean`

### Default
`false`

---

## initialNumToRender

### Description
Number of items to render in the initial batch. Should be enough to fill the screen but not much more. These items are never unmounted as part of windowed rendering to improve perceived performance of scroll-to-top actions.

### Type
`number`

### Default
`10`

---

## initialScrollIndex

### Description
Start at initialScrollIndex instead of the top with the first item. Disables scroll-to-top optimization and requires getItemLayout to be implemented.

### Type
`number`

---

## inverted

### Description
Reverses the direction of scroll using scale transforms of -1.

### Type
`boolean`

### Default
`false`

---

## keyExtractor

### Description
Extracts a unique key for a given item at the specified index. Used for caching and as the react key to track item re-ordering. Default checks item.key, then item.id, then falls back to index.

### Type
`function`

### Signature
```typescript
(item: any, index: number) => string
```

---

## maxToRenderPerBatch

### Description
Maximum number of items to render in each incremental render batch. Higher values improve fill rate but may reduce responsiveness.

### Type
`number`

---

## onEndReached

### Description
Callback called once when the scroll position reaches within onEndReachedThreshold from the logical end of the list.

### Type
`function`

### Signature
```typescript
(info: {distanceFromEnd: number}) => void
```

---

## onEndReachedThreshold

### Description
Distance from the end (in units of visible list length) that triggers the onEndReached callback. Value of 0.5 triggers when end is within half the visible length.

### Type
`number`

### Default
`2`

---

## onRefresh

### Description
Callback for pull-to-refresh functionality. When provided, a standard RefreshControl is added. Also set the refreshing prop correctly.

### Type
`function`

### Signature
```typescript
() => void
```

---

## onScrollToIndexFailed

### Description
Handles failures when scrolling to an index that has not been measured yet. Recommended to compute offset and scrollTo it, or scroll as far as possible and retry.

### Type
`function`

### Signature
```typescript
(info: {
  index: number,
  highestMeasuredFrameIndex: number,
  averageItemLength: number
}) => void
```

---

## onStartReached

### Description
Callback called once when the scroll position reaches within onStartReachedThreshold from the logical start of the list.

### Type
`function`

### Signature
```typescript
(info: {distanceFromStart: number}) => void
```

---

## onStartReachedThreshold

### Description
Distance from the start (in units of visible list length) that triggers the onStartReached callback. Value of 0.5 triggers when start is within half the visible length.

### Type
`number`

### Default
`2`

---

## onViewableItemsChanged

### Description
Callback called when the viewability of rows changes, as defined by the viewabilityConfig prop.

### Type
`function`

### Signature
```typescript
(callback: {changed: ViewToken[], viewableItems: ViewToken[]}) => void
```

---

## persistentScrollbar

### Description
Keeps the scrollbar visible persistently.

### Type
`boolean`

---

## progressViewOffset

### Description
Offset needed for the loading indicator to show correctly.

### Type
`number`

---

## refreshControl

### Description
Custom refresh control element that overrides the default RefreshControl component. The onRefresh and refreshing props are ignored when set. Only works for vertical VirtualizedList.

### Type
`element`

---

## refreshing

### Description
Set to true while waiting for new data from a refresh operation.

### Type
`boolean`

### Default
`false`
```

--------------------------------

### Initialize React Native App with CLI

Source: https://reactnative.dev/docs/0.79/the-new-architecture/pure-cxx-modules

Command to create a new React Native application using the official CLI at version 0.79. This sets up the project structure needed for implementing C++ native modules.

```shell
npx @react-native-community/cli@latest init SampleApp --version 0.79
```

--------------------------------

### Configure Bundle Asset Filename

Source: https://reactnative.dev/docs/0.77/react-native-gradle-plugin

Sets the name of the generated bundle file. Default is 'index.android.bundle'. Customize to use a different filename for your application bundle.

```groovy
bundleAssetName = "MyApplication.android.bundle"
```

--------------------------------

### Example React Native TypeScript Component with Props and State

Source: https://reactnative.dev/docs/0.81/typescript

This code defines a functional React Native component, `Hello`, demonstrating TypeScript usage for props and state. It showcases how to define component properties with types, manage state using `useState`, and style elements within a React Native application, providing type-checking and editor autocompletion benefits.

```typescript
import {useState} from 'react';  
import {Button, StyleSheet, Text, View} from 'react-native';  
  
export type Props = {  
  name: string;  
  baseEnthusiasmLevel?: number;  
};  
  
function Hello({name, baseEnthusiasmLevel = 0}: Props) {  
  const [enthusiasmLevel, setEnthusiasmLevel] = useState(  
    baseEnthusiasmLevel,  
  );  
  
  const onIncrement = () =>  
    setEnthusiasmLevel(enthusiasmLevel + 1);  
  const onDecrement = () =>  
    setEnthusiasmLevel(  
      enthusiasmLevel > 0 ? enthusiasmLevel - 1 : 0,  
    );  
  
  const getExclamationMarks = (numChars: number) =>  
    numChars > 0 ? Array(numChars + 1).join('!') : '';  
  
  return (  
    <View style={styles.container}>  
      <Text style={styles.greeting}>  
        Hello {name}  
        {getExclamationMarks(enthusiasmLevel)}  
      </Text>  
      <View>  
        <Button  
          title="Increase enthusiasm"  
          accessibilityLabel="increment"  
          onPress={onIncrement}  
          color="blue"  
        />  
        <Button  
          title="Decrease enthusiasm"  
          accessibilityLabel="decrement"  
          onPress={onDecrement}  
          color="red"  
        />  
      </View>  
    </View>  
  );  
}  
  
const styles = StyleSheet.create({  
  container: {  
    flex: 1,  
    alignItems: 'center',  
    justifyContent: 'center',  
  },  
  greeting: {  
    fontSize: 20,  
    fontWeight: 'bold',  
    margin: 16,  
  },  
});  
  
export default Hello;  
```

--------------------------------

### Property: `canCancelContentTouches`

Source: https://reactnative.dev/docs/scrollview

Determines if the scroll view will attempt to drag if touch moves after tracking starts (iOS only).

```APIDOC
## Property: `canCancelContentTouches`

### Description
When `false`, once tracking starts, won't try to drag if the touch moves.

### Type
bool

### Default
`true`
```

--------------------------------

### Automatically Link Native Libraries in React Native

Source: https://reactnative.dev/docs/0.79/linking-libraries-ios

This command demonstrates how to install a library with native dependencies, triggering React Native's autolinking mechanism. The `--save` flag is crucial as it adds the dependency to `package.json`, which React Native uses to automatically link native modules upon the next app build.

```shell
npm install <library-with-native-dependencies> --save
```

--------------------------------

### Run React Native iOS Application from Command Line (Bash)

Source: https://reactnative.dev/docs/0.78/fabric-native-components-introduction

This `bash` command initiates a React Native application on an iOS simulator or a connected physical device. It utilizes the `yarn` package manager to run the `ios` script specified in the project's `package.json`. This command is essential for debugging and testing React Native apps on Apple's mobile platform.

```bash
yarn run ios

```

--------------------------------

### Handle asynchronous Fetch API responses using async/await syntax in React Native

Source: https://reactnative.dev/docs/network

This example shows how to handle Fetch API responses using the modern async/await syntax for cleaner asynchronous code. It wraps the Fetch call in a "try...catch" block to gracefully manage potential errors during the network request or response processing.

```tsx
const getMoviesFromApiAsync = async () => {
  try {
    const response = await fetch(
      'https://reactnative.dev/movies.json',
    );
    const json = await response.json();
    return json.movies;
  } catch (error) {
    console.error(error);
  }
};
```

--------------------------------

### Run Android Build with Verbose Output - npm

Source: https://reactnative.dev/docs/0.80/troubleshooting

Execute Android build process with verbose logging using npm to get detailed output for debugging build issues. This command runs from the project root directory and helps identify compilation or configuration problems.

```shell
npm run android -- --verbose
```

--------------------------------

### Implement React Native Host Lifecycle Methods in Java and Kotlin

Source: https://reactnative.dev/docs/0.81/legacy/native-modules-android

These code examples illustrate the implementation of `onHostResume`, `onHostPause`, and `onHostDestroy` methods, which are part of the `LifecycleEventListener` interface. Implementing these methods enables a React Native module to execute specific logic when the host Android activity resumes, pauses, or is destroyed, integrating tightly with the application's lifecycle.

```java
@Override
public void onHostResume() {
   // Activity `onResume`
}
@Override
public void onHostPause() {
   // Activity `onPause`
}
@Override
public void onHostDestroy() {
   // Activity `onDestroy`
}
```

```kotlin
override fun onHostResume() {
    // Activity `onResume`
}
  
override fun onHostPause() {
    // Activity `onPause`
}
  
override fun onHostDestroy() {
    // Activity `onDestroy`
}
```

--------------------------------

### Implement Initialize Method - iOS

Source: https://reactnative.dev/docs/0.81/the-new-architecture/native-modules-lifecycle

Implement the initialize method in NativeModule.mm to run initialization code when the Native Module is first created. This is the appropriate place to set up resources that require ReactApplicationContext or other startup configurations.

```Objective-C++
@implementation NativeModule

- (void)initialize {
  // add the initialization code here
}

@end
```

--------------------------------

### Image onLoadStart callback for loading state in React Native

Source: https://reactnative.dev/docs/0.77/image

Trigger loading state when image starts loading using the onLoadStart callback. Useful for displaying loading indicators or spinners while the image is being fetched.

```javascript
onLoadStart={() => this.setState({loading: true})}
```

--------------------------------

### List USB Devices with lsusb Command

Source: https://reactnative.dev/docs/0.79/running-on-device

Use the lsusb command to display all USB devices connected to the development machine. On macOS, lsusb must be installed first. The output shows bus and device information including vendor IDs that identify connected devices like phones.

```shell
$ lsusb
Bus 002 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 003: ID 22b8:2e76 Motorola PCS
Bus 001 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

--------------------------------

### Configure Android Gradle to Create Multi-CPU APKs

Source: https://reactnative.dev/docs/0.78/signed-apk-android

Modifies the `android/app/build.gradle` file to enable the creation of separate APKs for different CPU architectures (armeabi-v7a, arm64-v8a, x86, x86_64). This reduces APK size by ensuring devices only download the native code they need. Set `universalApk` to `true` for markets not supporting device targeting.

```diff
android {  
  
    splits {  
        abi {  
            reset()  
            enable true  
            universalApk false  
            include "armeabi-v7a", "arm64-v8a", "x86", "x86_64"  
        }  
    }  
  
}
```

--------------------------------

### Create Project Directory Structure for WebView Component

Source: https://reactnative.dev/docs/0.80/fabric-native-components-introduction

This command creates the necessary folder structure within the 'Demo' project for a Fabric Native Component. It sets up directories for Codegen specifications ('specs'), Android native code ('android/app/src/main/java/com/webview'), and implicitly for iOS code, organizing the project for component development.

```bash
mkdir -p Demo/{specs,android/app/src/main/java/com/webview}  
```

--------------------------------

### Apply `skewX` Transform in React Native

Source: https://reactnative.dev/docs/0.77/transforms

This example demonstrates applying a `skewX` transformation to a React Native component. Skew transformations, like `skewX`, require a string value that specifies the skew angle, typically in degrees (e.g., `'45deg'`).

```javascript
{
  transform: [{skewX: '45deg'}],
}
```

--------------------------------

### Create PanResponder with gesture handlers in React Native

Source: https://reactnative.dev/docs/0.77/panresponder

Demonstrates how to initialize PanResponder using React.useRef with configuration handlers for touch initiation, movement, and termination. The example shows all available lifecycle callbacks including onStartShouldSetPanResponder, onPanResponderMove, and onPanResponderRelease, which receive event and gestureState objects. The panHandlers are then spread onto a View component to enable gesture tracking.

```typescript
const ExampleComponent = () => {
  const panResponder = React.useRef(
    PanResponder.create({
      // Ask to be the responder:
      onStartShouldSetPanResponder: (evt, gestureState) => true,
      onStartShouldSetPanResponderCapture: (evt, gestureState) =>
        true,
      onMoveShouldSetPanResponder: (evt, gestureState) => true,
      onMoveShouldSetPanResponderCapture: (evt, gestureState) =>
        true,

      onPanResponderGrant: (evt, gestureState) => {
        // The gesture has started. Show visual feedback so the user knows
        // what is happening!
        // gestureState.d{x,y} will be set to zero now
      },
      onPanResponderMove: (evt, gestureState) => {
        // The most recent move distance is gestureState.move{X,Y}
        // The accumulated gesture distance since becoming responder is
        // gestureState.d{x,y}
      },
      onPanResponderTerminationRequest: (evt, gestureState) =>
        true,
      onPanResponderRelease: (evt, gestureState) => {
        // The user has released all touches while this view is the
        // responder. This typically means a gesture has succeeded
      },
      onPanResponderTerminate: (evt, gestureState) => {
        // Another component has become the responder, so this gesture
        // should be cancelled
      },
      onShouldBlockNativeResponder: (evt, gestureState) => {
        // Returns whether this component should block native components from becoming the JS
        // responder. Returns true by default. Is currently only supported on android.
        return true;
      },
    }),
  ).current;

  return <View {...panResponder.panHandlers} />;
};
```

--------------------------------

### Define Local React Native Module Project Structure

Source: https://reactnative.dev/docs/0.78/the-new-architecture/create-module-library

This shell snippet illustrates the recommended directory structure for developing a React Native application alongside a local React Native library. It shows the `App` and `Library` folders positioned as siblings within a `Development` parent directory, facilitating local module integration without publishing to NPM.

```shell
Development  
├── App  
└── Library
```

--------------------------------

### Platform.Version

Source: https://reactnative.dev/docs/0.79/platform

Returns the operating system's version as a string or number.

```APIDOC
## Platform.Version

### Description
Returns the operating system's version as a string or number.

### Method
Static Property

### Endpoint
Platform.Version

### Parameters
#### Path Parameters

#### Query Parameters

#### Request Body

### Request Example

### Response
#### Success Response (String/Number)
- **Version** (string | number) - The version of the operating system.

#### Response Example
"17.4"
```

--------------------------------

### Register Application Configuration (React Native AppRegistry)

Source: https://reactnative.dev/docs/0.77/appregistry

This static method registers an array of `AppConfig` objects with the `AppRegistry`. It's used to provide configuration details for multiple applications or components at once, streamlining the setup process.

```tsx
static registerConfig(config: AppConfig[]);
```

--------------------------------

### Request Camera Permission in React Native

Source: https://reactnative.dev/docs/next/permissionsandroid

This React Native example demonstrates how to use the `PermissionsAndroid` module to asynchronously request camera access from the user. It defines a function that prompts the user for permission and logs whether the permission was granted or denied, integrating this functionality into a basic UI with a button.

```javascript
import React from 'react';
import {
  Button,
  PermissionsAndroid,
  StatusBar,
  StyleSheet,
  Text,
} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context;

const requestCameraPermission = async () => {
  try {
    const granted = await PermissionsAndroid.request(
      PermissionsAndroid.PERMISSIONS.CAMERA,
      {
        title: 'Cool Photo App Camera Permission',
        message:
          'Cool Photo App needs access to your camera ' +
          'so you can take awesome pictures.',
        buttonNeutral: 'Ask Me Later',
        buttonNegative: 'Cancel',
        buttonPositive: 'OK',
      },
    );
    if (granted === PermissionsAndroid.RESULTS.GRANTED) {
      console.log('You can use the camera');
    } else {
      console.log('Camera permission denied');
    }
  } catch (err) {
    console.warn(err);
  }
};

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <Text style={styles.item}>Try permissions</Text>
      <Button title="request permissions" onPress={requestCameraPermission} />
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingTop: StatusBar.currentHeight,
    backgroundColor: '#ecf0f1',
    padding: 8,
  },
  item: {
    margin: 24,
    fontSize: 18,
    fontWeight: 'bold',
    textAlign: 'center',
  },
});

export default App;
```

--------------------------------

### TouchableWithoutFeedback state management example (React Native)

Source: https://reactnative.dev/docs/next/touchablewithoutfeedback

This example showcases a functional React Native component that uses `TouchableWithoutFeedback` to increment a counter. Tapping the 'Touch Here' button, wrapped inside `TouchableWithoutFeedback`, updates the component's state and displays the new count. It utilizes `useState` for state management and `StyleSheet` for styling, demonstrating a common interaction pattern.

```tsx
import React, {useState} from 'react';
import {StyleSheet, TouchableWithoutFeedback, Text, View} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const TouchableWithoutFeedbackExample = () => {
  const [count, setCount] = useState(0);

  const onPress = () => {
    setCount(count + 1);
  };

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <View style={styles.countContainer}>
          <Text style={styles.countText}>Count: {count}</Text>
        </View>
        <TouchableWithoutFeedback onPress={onPress}>
          <View style={styles.button}>
            <Text>Touch Here</Text>
          </View>
        </TouchableWithoutFeedback>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: 10
  },
  button: {
    alignItems: 'center',
    backgroundColor: '#DDDDDD',
    padding: 10
  },
  countContainer: {
    alignItems: 'center',
    padding: 10
  },
  countText: {
    color: '#FF00FF'
  }
});

export default TouchableWithoutFeedbackExample;
```

--------------------------------

### Static Method: request()

Source: https://reactnative.dev/docs/permissionsandroid

Prompts the user to enable a single permission. This method can display a rationale dialog before the system permission dialog, returning a promise with the permission status.

```APIDOC
## `request()`

### Description
Prompts the user to enable a single permission. This function intelligently checks if a rationale is needed based on OS guidelines and then displays the system permission dialog. It returns a Promise that resolves with a string indicating the user's decision or status regarding the permission request.

### Method Call
`static request(permission: Permission, rationale?: Rationale): Promise<PermissionStatus>`

### Parameters
- **permission** (string) - Required - The specific permission identifier to request, e.g., 'android.permission.CAMERA'.
- **rationale** (object) - Optional - An object providing context for the permission request. If provided, the system may show a dialog explaining why the permission is needed.
  - **title** (string) - Required (within rationale) - The title text for the rationale dialog.
  - **message** (string) - Required (within rationale) - The main message body for the rationale dialog.
  - **buttonPositive** (string) - Required (within rationale) - The text for the positive action button in the rationale dialog.
  - **buttonNegative** (string) - Optional (within rationale) - The text for the negative action button in the rationale dialog.
  - **buttonNeutral** (string) - Optional (within rationale) - The text for a neutral action button in the rationale dialog.

### Request Example
```tsx
import { Permissions } from 'react-native';

const requestCameraPermission = async () => {
  try {
    const status = await Permissions.request(
      'android.permission.CAMERA',
      {
        title: 'Camera Access Needed',
        message: 'This app requires camera access to scan QR codes.',
        buttonPositive: 'Grant',
        buttonNegative: 'Deny'
      }
    );
    console.log('Camera permission status:', status);
    // status can be 'granted', 'denied', or 'never_ask_again'
  } catch (error) {
    console.error('Permission request failed:', error);
  }
};
```

### Response
#### Success Response
- **PermissionStatus** (string) - A string indicating the result of the permission request. Possible values include "granted", "denied", or "never_ask_again".

#### Response Example
```json
"granted"
```
or
```json
"denied"
```
or
```json
"never_ask_again"
```
```

--------------------------------

### Example TextLayoutEvent Object Structure (JavaScript)

Source: https://reactnative.dev/docs/0.77/text

This JavaScript code block demonstrates the structure of a `TextLayoutEvent` object. This object is returned in a callback and contains an array of `TextLayout` objects, corresponding to each rendered text line, along with the `target` node ID.

```js
{
  lines: [
    TextLayout,
    TextLayout,
    // ...
  ],
  target: 1127;
}
```

--------------------------------

### Setup RCTEventEmitter Subclass Header in Objective-C

Source: https://reactnative.dev/docs/0.78/legacy/native-modules-ios

Creates a header file for a native module that subclasses RCTEventEmitter to enable event emission capabilities. Imports necessary React Native bridge modules and declares the interface.

```objectivec
//  CalendarModule.h

#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface CalendarModule : RCTEventEmitter <RCTBridgeModule>
@end
```

--------------------------------

### Configure npm local library dependency

Source: https://reactnative.dev/docs/0.80/legacy/local-library-setup

Add the local library as a file-based dependency in package.json using npm's file: protocol. This creates a symlink to the library under node_modules, enabling autolinking integration with your React Native project.

```json
"dependencies": {
  "awesome-module": "file:./modules/awesome-module"
}
```

--------------------------------

### Animated.ValueXY.setOffset()

Source: https://reactnative.dev/docs/animatedvaluexy

Applies an offset on top of the current value. Useful for scenarios like compensating for the start of a pan gesture.

```APIDOC
## METHOD setOffset

### Description
Sets an offset that is applied on top of whatever value is set, whether via `setValue`, an animation, or `Animated.event`. Useful for compensating things like the start of a pan gesture.

### Method
METHOD

### Endpoint
setOffset(offset: {x: number; y: number})

### Parameters
#### Request Body
- **offset** (object) - Required - Offset value object containing X and Y coordinates.
  - **offset.x** (number) - Required - The X coordinate of the offset.
  - **offset.y** (number) - Required - The Y coordinate of the offset.

### Request Example
{
  "offset": {
    "x": 50,
    "y": 50
  }
}

### Response
#### Success Response (void)
This method does not return a value.

#### Response Example
N/A
```

--------------------------------

### React Native Component Snapshot Testing Example

Source: https://reactnative.dev/docs/0.81/testing-overview

Demonstrates a component snapshot created by Jest's custom React serializer, showing a JSX-like string representation of a Text component with styling. This snapshot serves as a reference for detecting unintended changes to component render output during future test runs.

```tsx
<Text
  style={{
    fontSize: 20,
    textAlign: "center"
  }}>
  Welcome to React Native!
</Text>
```

--------------------------------

### Configure Debuggable Build Variants

Source: https://reactnative.dev/docs/0.77/react-native-gradle-plugin

Specifies which build variants should be debuggable and run without pre-bundled assets. Debuggable variants require Metro to run. Default includes only 'debug' variant. Customize to include additional variants like staging or lite builds.

```groovy
debuggableVariants = ["liteDebug", "prodDebug"]
```

--------------------------------

### Install babel-plugin-module-resolver Development Dependency

Source: https://reactnative.dev/docs/0.77/typescript

These commands show how to add `babel-plugin-module-resolver` as a development dependency to your project using either npm or Yarn. This plugin is crucial for Babel to understand and resolve the custom path aliases defined in your project.

```shell
npm install --save-dev babel-plugin-module-resolver
```

```shell
yarn add --dev babel-plugin-module-resolver
```

--------------------------------

### Android GIF and WebP Support Configuration

Source: https://reactnative.dev/docs/0.80/image

Configure optional Fresco modules in android/app/build.gradle to enable GIF and WebP image format support on Android. These dependencies are required when building native code, as GIF and WebP are not supported by default.

```APIDOC
## Android GIF and WebP Support

### Description
Enable GIF and WebP image format support on Android by adding Fresco library dependencies to your gradle configuration.

### Configuration File
`android/app/build.gradle`

### Dependencies

#### For Ice Cream Sandwich Support (API level < 14)
```groovy
implementation 'com.facebook.fresco:animated-base-support:1.3.0'
```
- Required for Android versions before Ice Cream Sandwich (API level 14)

#### For GIF Support
```groovy
implementation 'com.facebook.fresco:animated-gif:3.6.0'
```
- Enables animated GIF rendering

#### For WebP Support (with animations)
```groovy
implementation 'com.facebook.fresco:animated-webp:3.6.0'
implementation 'com.facebook.fresco:webpsupport:3.6.0'
```
- Supports both static and animated WebP images

#### For WebP Support (static only)
```groovy
implementation 'com.facebook.fresco:webpsupport:3.6.0'
```
- Supports static WebP images without animation support

### Complete Example
```groovy
dependencies {
  // If your app supports Android versions before Ice Cream Sandwich (API level 14)
  implementation 'com.facebook.fresco:animated-base-support:1.3.0'
  
  // For animated GIF support
  implementation 'com.facebook.fresco:animated-gif:3.6.0'
  
  // For WebP support, including animated WebP
  implementation 'com.facebook.fresco:animated-webp:3.6.0'
  implementation 'com.facebook.fresco:webpsupport:3.6.0'
  
  // For WebP support, without animations
  implementation 'com.facebook.fresco:webpsupport:3.6.0'
}
```

### Notes
- Version numbers may not be updated in time; check `packages/react-native/gradle/libs.versions.toml` in the main repository for the correct Fresco version for your tagged React Native version
```

--------------------------------

### Set DrawerLayoutAndroid background color (TypeScript)

Source: https://reactnative.dev/docs/0.79/drawerlayoutandroid

Demonstrates how to set the background color of the `DrawerLayoutAndroid` component using the `drawerBackgroundColor` prop. This example uses an RGBA value to include transparency, affecting the visual appearance of the navigation drawer.

```tsx
return (
  <DrawerLayoutAndroid drawerBackgroundColor="rgba(0,0,0,0.5)" />
);
```

--------------------------------

### Create SampleApp-Bridging-Header.h for Swift-Objective-C Integration

Source: https://reactnative.dev/docs/0.79/the-new-architecture/turbo-modules-with-swift

Bridging header file that exposes Objective-C headers to Swift code. This file imports React-RCTAppDelegate and any other Objective-C APIs needed by Swift implementation. Required for library authors only if distributing as separate package.

```objective-c
//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <React-RCTAppDelegate/RCTDefaultReactNativeFactoryDelegate.h>
```

--------------------------------

### Platform select() with StyleSheet - React Native

Source: https://reactnative.dev/docs/0.77/platform

Demonstrates using Platform.select() to apply platform-specific styles to a React Native component. Shows how to set different background colors for Android, iOS, and other platforms while maintaining consistent flex properties.

```typescript
import {Platform, StyleSheet} from 'react-native';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    ...Platform.select({
      android: {
        backgroundColor: 'green',
      },
      ios: {
        backgroundColor: 'red',
      },
      default: {
        // other platforms, web for example
        backgroundColor: 'blue',
      },
    }),
  },
});
```

--------------------------------

### Pass properties from native to React Native (Java/Kotlin)

Source: https://reactnative.dev/docs/0.79/communication-android

Demonstrates how to pass properties from native (Java or Kotlin) to a React Native application during initialization. This is achieved by overriding `getLaunchOptions` in the `ReactActivityDelegate` and returning a `Bundle` containing the desired properties.  The example includes setting an array of image URLs.

```java
public class MainActivity extends ReactActivity {  
  @Override  
  protected ReactActivityDelegate createReactActivityDelegate() {  
    return new ReactActivityDelegate(this, getMainComponentName()) {  
      @Override  
      protected Bundle getLaunchOptions() {  
        Bundle initialProperties = new Bundle();  
        ArrayList<String> imageList = new ArrayList<String>(Arrays.asList(  
                "https://dummyimage.com/600x400/ffffff/000000.png",  
                "https://dummyimage.com/600x400/000000/ffffff.png"  
        ));  
        initialProperties.putStringArrayList("images", imageList);  
        return initialProperties;  
      }  
    };  
  }  
}  
```

```kotlin
class MainActivity : ReactActivity() {  
    override fun createReactActivityDelegate(): ReactActivityDelegate {  
        return object : ReactActivityDelegate(this, mainComponentName) {  
            override fun getLaunchOptions(): Bundle {  
                val imageList = arrayListOf("https://dummyimage.com/600x400/ffffff/000000.png", "https://dummyimage.com/600x400/000000/ffffff.png")  
                val initialProperties = Bundle().apply { putStringArrayList("images", imageList) }  
                return initialProperties  
            }  
        }  
    }  
}
```

--------------------------------

### clearInteractionHandle()

Source: https://reactnative.dev/docs/interactionmanager

Notifies the InteractionManager that a previously started interaction has completed, potentially allowing `runAfterInteractions` tasks to execute if all other handles are cleared.

```APIDOC
## STATIC METHOD /InteractionManager.clearInteractionHandle

### Description
Notify manager that an interaction has completed.

### Method
STATIC METHOD

### Endpoint
/InteractionManager.clearInteractionHandle

### Parameters
#### Request Body
- **handle** (Handle) - Required - The handle previously obtained from `createInteractionHandle()` that needs to be cleared.

### Request Example
```tsx
// later, on animation completion:
InteractionManager.clearInteractionHandle(handle);
```

### Response
#### Success Response (void)
No specific response value.

#### Response Example
```
// No explicit return value
```
```

--------------------------------

### Install TypeScript Dependencies with Yarn

Source: https://reactnative.dev/docs/next/typescript

Add TypeScript, type definitions, and ESLint plugins to an existing React Native project using Yarn. Provides the same dependencies as npm but uses Yarn's package manager.

```shell
yarn add --dev typescript @react-native/typescript-config @types/jest @types/react @types/react-test-renderer
```

--------------------------------

### Configure React Native Host with Custom Packages - Kotlin

Source: https://reactnative.dev/docs/0.77/turbo-native-modules-introduction_language=typescript&platforms=android

Extends DefaultReactNativeHost to register custom React packages and configure developer support. Enables manual package registration for modules like NativeLocalStorage that cannot be autolinked, and configures New Architecture and Hermes engine settings via BuildConfig flags.

```kotlin
object : DefaultReactNativeHost(this) {
  override fun getPackages(): List<ReactPackage> =
      PackageList(this).packages.apply {
        // Packages that cannot be autolinked yet can be added manually here, for example:
        // add(MyReactNativePackage())
        add(NativeLocalStoragePackage())
      }

  override fun getJSMainModuleName(): String = "index"

  override fun getUseDeveloperSupport(): Boolean = BuildConfig.DEBUG

  override val isNewArchEnabled: Boolean = BuildConfig.IS_NEW_ARCHITECTURE_ENABLED
  override val isHermesEnabled: Boolean = BuildConfig.IS_HERMES_ENABLED
}

override val reactHost: ReactHost
  get() = getDefaultReactHost(applicationContext, reactNativeHost)

override fun onCreate() {
  super.onCreate()
  SoLoader.init(this, false)
  if (BuildConfig.IS_NEW_ARCHITECTURE_ENABLED) {
    // If you opted-in for the New Architecture, we load the native entry point for this app.
    load()
  }
}
```

--------------------------------

### createInteractionHandle()

Source: https://reactnative.dev/docs/interactionmanager

Notifies the InteractionManager that a new user interaction has started, preventing queued `runAfterInteractions` tasks from executing until this interaction is cleared.

```APIDOC
## STATIC METHOD /InteractionManager.createInteractionHandle

### Description
Notify manager that an interaction has started.

### Method
STATIC METHOD

### Endpoint
/InteractionManager.createInteractionHandle

### Parameters
No parameters.

### Request Example
```tsx
const handle = InteractionManager.createInteractionHandle();
// run animation...
```

### Response
#### Success Response (Handle)
- **handle** (Handle) - An opaque handle representing the ongoing interaction. This handle must be passed to `clearInteractionHandle()` when the interaction completes.

#### Response Example
```
// handle will be an opaque object or identifier
```
```

--------------------------------

### Image Prop: `onLoadStart`

Source: https://reactnative.dev/docs/0.77/image

A callback function invoked at the beginning of the image loading process.

```APIDOC
## Prop: `onLoadStart`

### Description
Invoked on load start.

### Type
`() => void`

### Additional Notes
**Example:** `onLoadStart={() => this.setState({loading: true})}`
```

--------------------------------

### Import ECMAScript 2015 Modules in React Native JavaScript

Source: https://reactnative.dev/docs/0.77/javascript-environment

Illustrates the ES6 `import` statement for importing modules, allowing organized and reusable code. This example imports `React` and `Component` from the 'react' library.

```JavaScript
import React, {Component} from 'react';
```

--------------------------------

### Render Basic UI Components in React Native

Source: https://reactnative.dev/docs/0.77/intro-react-native-components

This example demonstrates how to combine several core React Native components such as `View`, `Text`, `Image`, `ScrollView`, and `TextInput` to create a simple user interface. It imports components from the `react-native` library and uses JSX within a functional React component to define the layout and content. The UI includes text, an image loaded from a URL, and an input field, all wrapped in a scrollable view.

```JavaScript
import React from 'react';
import {View, Text, Image, ScrollView, TextInput} from 'react-native';

const App = () => {
  return (
    <ScrollView>
      <Text>Some text</Text>
      <View>
        <Text>Some more text</Text>
        <Image
          source={{
            uri: 'https://reactnative.dev/docs/assets/p_cat2.png',
          }}
          style={{width: 200, height: 200}}
        />
      </View>
      <TextInput
        style={{
          height: 40,
          borderColor: 'gray',
          borderWidth: 1,
        }}
        defaultValue="You can type in me"
      />
    </ScrollView>
  );
};

export default App;
```

--------------------------------

### Build and Run React Native Project - npm/Yarn

Source: https://reactnative.dev/docs/0.77/turbo-native-modules-introduction_language=typescript&platforms=android

Commands to build and run the React Native application on Android emulator and iOS simulator. Provides equivalent npm and Yarn commands for both platforms.

```bash
npm run android
```

```bash
yarn run android
```

```bash
npm run ios
```

```bash
yarn run ios
```

--------------------------------

### Event onScrollBeginDrag

Source: https://reactnative.dev/docs/0.77/scrollview

This event is called when the user initiates a drag gesture on the scroll view, indicating the start of a scroll interaction.

```APIDOC
## EVENT onScrollBeginDrag

### Description
Called when the user begins to drag the scroll view.

### Type
function
```

--------------------------------

### Examine React Native Codegen iOS Output

Source: https://reactnative.dev/docs/0.77/turbo-native-modules-introduction_language=typescript&platforms=ios

This shell output provides an example of the console messages generated when React Native Codegen runs for an iOS project. It shows the various steps, including adding script phases, generating `.podspec.json` files, and identifying codegen-enabled libraries.

```shell
...  
Framework build type is static library  
[Codegen] Adding script_phases to ReactCodegen.  
[Codegen] Generating ./build/generated/ios/ReactCodegen.podspec.json  
[Codegen] Analyzing /Users/me/src/TurboModuleExample/package.json  
[Codegen] Searching for codegen-enabled libraries in the app.  
[Codegen] Found TurboModuleExample  
[Codegen] Searching for codegen-enabled libraries in the project dependencies.  
[Codegen] Found react-native  
...
```

--------------------------------

### Execute React Native Codegen for iOS

Source: https://reactnative.dev/docs/0.77/turbo-native-modules-introduction_language=typescript&platforms=ios

These bash commands are used to prepare and install CocoaPods for an iOS project, which in turn triggers the React Native Codegen process. The Codegen runs as part of the script phases added to the project, generating necessary native interfaces for iOS from your module specifications.

```bash
cd ios  
bundle install  
bundle exec pod install  
```

--------------------------------

### hitSlop - Touch Target Extension

Source: https://reactnative.dev/docs/view

Defines how far a touch event can start away from the view boundaries. Used to extend touch target areas beyond the visual bounds to meet interface guidelines (typically 30-40 points minimum).

```APIDOC
## hitSlop

### Description
Defines how far a touch event can start away from the view. Typical interface guidelines recommend touch targets of at least 30-40 points/density-independent pixels.

### Type
object: `{top: number, left: number, bottom: number, right: number}`

### Parameters
- **top** (number) - Distance in points to extend touch area upward
- **left** (number) - Distance in points to extend touch area leftward
- **bottom** (number) - Distance in points to extend touch area downward
- **right** (number) - Distance in points to extend touch area rightward

### Usage Example
```javascript
<TouchableView hitSlop={{top: 10, bottom: 10, left: 0, right: 0}}>
  <Text>Touchable area height extends from 20 to 40 points</Text>
</TouchableView>
```

### Constraints
- Touch area never extends past parent view bounds
- Z-index of sibling views takes precedence in overlapping areas
- Touch hitting two overlapping views uses sibling Z-order

### Notes
- Improves usability for small touch targets
- Does not affect visual rendering, only touch detection
```

--------------------------------

### Animated.stop()

Source: https://reactnative.dev/docs/0.79/animated

Stops any currently running animation immediately. When an animation is stopped, its completion callback (if provided to `start()`) will be invoked with `finished: false`.

```APIDOC
## Animated.stop()

### Description
Stops any running animation.

### Method
Instance Method (typically called on `Animated.timing`, `Animated.spring`, `Animated.decay`, or `CompositeAnimation` instances)

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
```tsx
const anim = Animated.timing(this.state.fadeAnim, { toValue: 1, duration: 5000, useNativeDriver: true });
anim.start();

// To stop the animation after some time or on user interaction:
setTimeout(() => {
  anim.stop(); // This will trigger the start()'s callback with {finished: false}
}, 2000);
```

### Response
#### Success Response (No explicit return value)
- This method does not return a value. Its effect is to halt the animation.

#### Response Example
```json
// No explicit return value.
```
```

--------------------------------

### Implement Capture Phase Handler with onStartShouldSetResponderCapture

Source: https://reactnative.dev/docs/0.78/gesture-responder-system

Fired during the capture phase before bubbling, allowing parent Views to intercept and prevent child components from becoming responder on touch start. Return true to make the parent become responder and block child components from claiming responsibility.

```javascript
View.props.onStartShouldSetResponderCapture: evt => true,
```

--------------------------------

### Animated.stagger()

Source: https://reactnative.dev/docs/0.79/animated

Array of animations may run in parallel (overlap), but are started in sequence with successive delays. This is useful for creating trailing effects.

```APIDOC
## Animated.stagger()

### Description
Array of animations may run in parallel (overlap), but are started in sequence with successive delays. Nice for doing trailing effects.

### Method
Static Method

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
- **time** (`number`) - Required - The delay in milliseconds between the start of successive animations.
- **animations** (`CompositeAnimation[]`) - Required - An array of animations to stagger.

### Request Example
```tsx
Animated.stagger(100, [
  Animated.spring(this.state.item1Scale, { toValue: 1.1, useNativeDriver: true }),
  Animated.spring(this.state.item2Scale, { toValue: 1.1, useNativeDriver: true }),
  Animated.spring(this.state.item3Scale, { toValue: 1.1, useNativeDriver: true })
]).start();
```

### Response
#### Success Response (Returns CompositeAnimation)
- **CompositeAnimation** (object) - A composite animation object that can be started.

#### Response Example
```json
// The method returns a CompositeAnimation instance, not a direct JSON response.
// Its effect is observed visually.
```
```

--------------------------------

### View ccache Statistics

Source: https://reactnative.dev/docs/next/build-speed

This command displays the current statistics for the ccache compiler, including cache hits, misses, and overall cache usage. It helps in verifying if ccache is working effectively and identifying cache performance.

```shell
$ ccache -s  
Summary:  
  Hits:             196 /  3068 (6.39 %)  
    Direct:           0 /  3068 (0.00 %)  
    Preprocessed:   196 /  3068 (6.39 %)  
  Misses:          2872  
    Direct:        3068  
    Preprocessed:  2872  
  Uncacheable:        1  
Primary storage:  
  Hits:             196 /  6136 (3.19 %)  
  Misses:          5940  
  Cache size (GB): 0.60 / 20.00 (3.00 %)  

```

--------------------------------

### Codegen Output and Verification on iOS

Source: https://reactnative.dev/docs/0.78/turbo-native-modules-introduction

Sample output showing Codegen script phase execution, code generation, and library discovery during iOS pod installation. Verifies that Codegen successfully generates ReactCodegen.podspec.json and identifies codegen-enabled libraries.

```shell
...
Framework build type is static library
[Codegen] Adding script_phases to ReactCodegen.
[Codegen] Generating ./build/generated/ios/ReactCodegen.podspec.json
[Codegen] Analyzing /Users/me/src/TurboModuleExample/package.json
[Codegen] Searching for codegen-enabled libraries in the app.
[Codegen] Found TurboModuleExample
[Codegen] Searching for codegen-enabled libraries in the project dependencies.
[Codegen] Found react-native
...

```

--------------------------------

### Static Method announceForAccessibility()

Source: https://reactnative.dev/docs/next/accessibilityinfo

Posts a string to be announced by the screen reader immediately.

```APIDOC
## Static Method Call announceForAccessibility()

### Description
Posts a string to be announced by the device's screen reader. This method will typically interrupt any ongoing speech to announce the new string immediately.

### Method
Static Method Call

### Endpoint
static announceForAccessibility(announcement: string);

### Parameters
#### Request Body
- **announcement** (string) - Required - The text string that the screen reader should announce.

### Request Example
```javascript
import { AccessibilityInfo } from 'react-native';

AccessibilityInfo.announceForAccessibility("Item added to cart successfully.");
```

### Response
#### Success Response (void)
- This method does not return a value upon successful execution.

#### Response Example
```json
{}
```
```

--------------------------------

### View Style Props - Complete Reference

Source: https://reactnative.dev/docs/0.81/view-style-props

Comprehensive guide to all available style properties for the React Native View component. Includes styling options for backgrounds, borders, colors, and radius customization with directional variants.

```APIDOC
# View Style Props Reference

## Overview
View Style Props define the visual styling properties available for React Native View components. These props control layout, colors, borders, and visual effects.

## Style Properties

### Background & Visibility
- **backfaceVisibility** (enum) - Required: `'visible'` | `'hidden'` - Controls visibility of element back face
- **backgroundColor** (color) - Optional - Sets the background color of the view

### Border Colors
- **borderColor** (color) - Optional - Sets border color for all sides
- **borderTopColor** (color) - Optional - Sets top border color
- **borderBottomColor** (color) - Optional - Sets bottom border color
- **borderLeftColor** (color) - Optional - Sets left border color
- **borderRightColor** (color) - Optional - Sets right border color
- **borderStartColor** (color) - Optional - Sets start border color (RTL aware)
- **borderEndColor** (color) - Optional - Sets end border color (RTL aware)
- **borderBlockColor** (color) - Optional - Sets block border color
- **borderBlockStartColor** (color) - Optional - Sets block start border color
- **borderBlockEndColor** (color) - Optional - Sets block end border color

### Border Widths
- **borderWidth** (number) - Optional - Sets border width for all sides
- **borderTopWidth** (number | string) - Optional - Sets top border width (percentage values supported)
- **borderBottomWidth** (number) - Optional - Sets bottom border width
- **borderLeftWidth** (number) - Optional - Sets left border width
- **borderRightWidth** (number) - Optional - Sets right border width

### Border Radius
- **borderRadius** (number | string) - Optional - Sets border radius for all corners (percentage values supported). Note: Apply `overflow: 'hidden'` if rounded border is not visible
- **borderTopLeftRadius** (number | string) - Optional - Sets top-left corner radius (percentage values supported)
- **borderTopRightRadius** (number | string) - Optional - Sets top-right corner radius (percentage values supported)
- **borderBottomLeftRadius** (number | string) - Optional - Sets bottom-left corner radius (percentage values supported)
- **borderBottomRightRadius** (number | string) - Optional - Sets bottom-right corner radius (percentage values supported)
- **borderTopStartRadius** (number | string) - Optional - Sets top-start corner radius (RTL aware, percentage values supported)
- **borderTopEndRadius** (number | string) - Optional - Sets top-end corner radius (RTL aware, percentage values supported)
- **borderBottomStartRadius** (number | string) - Optional - Sets bottom-start corner radius (RTL aware, percentage values supported)
- **borderBottomEndRadius** (number | string) - Optional - Sets bottom-end corner radius (RTL aware, percentage values supported)
- **borderStartStartRadius** (number | string) - Optional - Sets start-start corner radius (RTL aware, percentage values supported)
- **borderStartEndRadius** (number | string) - Optional - Sets start-end corner radius (RTL aware, percentage values supported)
- **borderEndStartRadius** (number | string) - Optional - Sets end-start corner radius (RTL aware, percentage values supported)
- **borderEndEndRadius** (number | string) - Optional - Sets end-end corner radius (RTL aware, percentage values supported)

### Border Styling
- **borderStyle** (enum) - Optional: `'solid'` | `'dotted'` | `'dashed'` - Sets border style pattern
- **borderCurve** (enum) - Optional (iOS 13+): `'circular'` | `'continuous'` - Changes corner curve of borders on iOS

## Example Usage

```javascript
import React from 'react';
import {View, StyleSheet} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <View style={styles.top} />
      <View style={styles.middle} />
      <View style={styles.bottom} />
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'space-between',
    padding: 20,
    margin: 10,
  },
  top: {
    flex: 0.3,
    backgroundColor: 'grey',
    borderWidth: 5,
    borderTopLeftRadius: 20,
    borderTopRightRadius: 20,
  },
  middle: {
    flex: 0.3,
    backgroundColor: 'beige',
    borderWidth: 5,
  },
  bottom: {
    flex: 0.3,
    backgroundColor: 'pink',
    borderWidth: 5,
    borderBottomLeftRadius: 20,
    borderBottomRightRadius: 20,
  },
});

export default App;
```

## Notes
- RTL (Right-to-Left) aware properties automatically adjust for RTL layouts
- Percentage values are supported for border radius and border width properties
- iOS 13+ supports additional border curve styling options
- Apply `overflow: 'hidden'` if rounded borders are not displaying correctly
```

--------------------------------

### Render an ImageBackground with React Native

Source: https://reactnative.dev/docs/0.77/imagebackground

This React Native example demonstrates how to use the `ImageBackground` component to display text layered over an image. It uses `SafeAreaProvider` and `SafeAreaView` for proper layout across different devices and defines styles for the container, image, and text using `StyleSheet.create`.

```javascript
import React from 'react';
import {ImageBackground, StyleSheet, Text} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const image = {uri: 'https://legacy.reactjs.org/logo-og.png'};

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container} edges={['left', 'right']}>
      <ImageBackground source={image} resizeMode="cover" style={styles.image}>
        <Text style={styles.text}>Inside</Text>
      </ImageBackground>
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  image: {
    flex: 1,
    justifyContent: 'center',
  },
  text: {
    color: 'white',
    fontSize: 42,
    lineHeight: 84,
    fontWeight: 'bold',
    textAlign: 'center',
    backgroundColor: '#000000c0',
  },
});

export default App;
```

--------------------------------

### `onMomentumScrollBegin` Event Property

Source: https://reactnative.dev/docs/0.78/scrollview

Callback function invoked when momentum scroll begins (when the ScrollView starts gliding).

```APIDOC
## Property: `onMomentumScrollBegin`

### Description
Called when the momentum scroll starts (scroll which occurs as the ScrollView starts gliding).

### Type
`function`

### Default Value
N/A

### Platform Specificity
N/A

### Notes
N/A
```

--------------------------------

### Example obfuscated React Native stack trace

Source: https://reactnative.dev/docs/0.77/debugging-release-builds

Sample Android Runtime exception showing minified function names and bytecode offsets (e.g., p@1:132161) that require symbolication to be converted into readable file paths, line numbers, and function names for effective debugging.

```text
07-15 10:58:25.820 18979 18998 E AndroidRuntime: FATAL EXCEPTION: mqt_native_modules
07-15 10:58:25.820 18979 18998 E AndroidRuntime: Process: com.awesomeproject, PID: 18979
07-15 10:58:25.820 18979 18998 E AndroidRuntime: com.facebook.react.common.JavascriptException: Failed, js engine: hermes, stack:
07-15 10:58:25.820 18979 18998 E AndroidRuntime: p@1:132161
07-15 10:58:25.820 18979 18998 E AndroidRuntime: p@1:132084
07-15 10:58:25.820 18979 18998 E AndroidRuntime: f@1:131854
07-15 10:58:25.820 18979 18998 E AndroidRuntime: anonymous@1:131119
```

--------------------------------

### Present React Native View Controller from iOS Button (Objective-C, Swift)

Source: https://reactnative.dev/docs/integration-with-existing-apps

This code demonstrates how to integrate a `ReactViewController` into an existing iOS `UIViewController`. It sets up a `UIButton` programmatically, adds it to the view, defines its layout using Auto Layout, and configures an action to modally present the `ReactViewController` upon tap. The `ReactViewController` instance is retained to prevent re-initialization on subsequent presentations.

```Objective-C
#import "ViewController.h"
#import "ReactViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
  ReactViewController *reactViewController;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.view.backgroundColor = UIColor.systemBackgroundColor;
  UIButton *button = [UIButton new];
  [button setTitle:@"Open React Native" forState:UIControlStateNormal];
  [button setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
  [button setTitleColor:UIColor.blueColor forState:UIControlStateHighlighted];
  [button addTarget:self action:@selector(presentReactNative) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];

  button.translatesAutoresizingMaskIntoConstraints = NO;
  [NSLayoutConstraint activateConstraints:@[
    [button.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
    [button.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
    [button.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
    [button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
  ]];
}

- (void)presentReactNative
{
  if (reactViewController == NULL) {
    reactViewController = [ReactViewController new];
  }
  [self presentViewController:reactViewController animated:YES];
}

@end
```

```Swift
import UIKit

class ViewController: UIViewController {

  var reactViewController: ReactViewController?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.view.backgroundColor = .systemBackground

    let button = UIButton()
    button.setTitle("Open React Native", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    button.addAction(UIAction { [weak self] _ in
      guard let self else { return }
      if reactViewController == nil {
       reactViewController = ReactViewController()
      }
      present(reactViewController!, animated: true)
    }, for: .touchUpInside)
    self.view.addSubview(button)

    button.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
    ])
  }
}
```

--------------------------------

### Consume Promise-based Native Module Method in TypeScript

Source: https://reactnative.dev/docs/0.80/legacy/native-modules-ios

This TypeScript example illustrates how to call a native module method that returns a Promise. It uses the `async/await` syntax for cleaner asynchronous code, handling both successful resolution and potential errors with a `try...catch` block.

```tsx
const onSubmit = async () => {  
  try {  
    const eventId = await CalendarModule.createCalendarEvent(  
      'Party',  
      'my house',  
    );  
    console.log(`Created a new event with id ${eventId}`);  
  } catch (e) {  
    console.error(e);  
  }  
};  
```

--------------------------------

### Platform select() with Native vs Web Components - React Native

Source: https://reactnative.dev/docs/0.77/platform

Demonstrates using Platform.select() to choose between native platform components and web components. Useful for cross-platform applications supporting both React Native and React Web.

```typescript
const Component = Platform.select({
  native: () => require('ComponentForNative'),
  default: () => require('ComponentForWeb'),
})();

<Component />;
```

--------------------------------

### GET flashScrollIndicators()

Source: https://reactnative.dev/docs/0.78/virtualizedlist

Method that triggers a flash animation of the scroll indicators to draw user attention to the scrollable content.

```APIDOC
## flashScrollIndicators()

### Description
Flashes the scroll indicators to draw user attention to the scrollable content.

### Method
Instance method

### Signature
```typescript
flashScrollIndicators(): void
```

### Parameters
None

### Returns
void
```

--------------------------------

### Example of an obfuscated React Native Android stack trace

Source: https://reactnative.dev/docs/0.79/debugging-release-builds

This code block illustrates a typical minified and obfuscated stack trace from an Android React Native release build, characterized by unreadable function names and bytecode offsets, which requires symbolication for debugging.

```shell
07-15 10:58:25.820 18979 18998 E AndroidRuntime: FATAL EXCEPTION: mqt_native_modules  
07-15 10:58:25.820 18979 18998 E AndroidRuntime: Process: com.awesomeproject, PID: 18979 07-15 10:58:25.820 18979 18998 E AndroidRuntime: com.facebook.react.common.JavascriptException: Failed, js engine: hermes, stack:  
07-15 10:58:25.820 18979 18998 E AndroidRuntime: p@1:132161  
07-15 10:58:25.820 18979 18998 E AndroidRuntime: p@1:132084  
07-15 10:58:25.820 18979 18998 E AndroidRuntime: f@1:131854  
07-15 10:58:25.820 18979 18998 E AndroidRuntime: anonymous@1:131119
```

--------------------------------

### Appearance Module Overview

Source: https://reactnative.dev/docs/0.79/appearance

The Appearance module provides APIs to access and manage user appearance preferences. It includes methods to get the current color scheme, set application-level color scheme, and listen for appearance changes.

```APIDOC
# Appearance Module

## Overview
The `Appearance` module exposes information about the user's appearance preferences, such as their preferred color scheme (light or dark).

### Import
```tsx
import {Appearance} from 'react-native';
```

### Platform Support
- Android (API level 29+)
- iOS (13+)
- Web

### Example Usage
```tsx
const colorScheme = Appearance.getColorScheme();
if (colorScheme === 'dark') {
  // Use dark color scheme
}
```

### Notes
- The color scheme preference may change through direct user action or on a schedule
- Rendering logic depending on color scheme should call `getColorScheme()` on every render rather than caching
- Use the `useColorScheme` React hook for automatic subscription to updates
- `getColorScheme()` returns `light` when debugging with Chrome
```

--------------------------------

### Prop: accessible

Source: https://reactnative.dev/docs/0.77/text

When set to true, indicates that the view is an accessibility element. See the Accessibility guide for more information.

```APIDOC
## GET /accessible

### Description
When set to `true`, indicates that the view is an accessibility element.
See the Accessibility guide for more information.

### Method
GET

### Endpoint
/accessible

### Parameters
#### Path Parameters
- **Type** (boolean) - Optional - Indicates if the view is an accessibility element.
- **Default** (`true`) - The default value for the accessible prop.

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
N/A

### Response
#### Success Response (200)
N/A

#### Response Example
N/A
```

--------------------------------

### Create JavaScript Wrapper for Native Module

Source: https://reactnative.dev/docs/0.77/legacy/native-modules-android

Create a JavaScript wrapper file to expose a native module without requiring consumers to access NativeModules directly. This file serves as a convenient entry point and location for adding JavaScript-side functionality. The example wraps the CalendarModule native module.

```JavaScript
/**
 * This exposes the native CalendarModule module as a JS module. This has a
 * function 'createCalendarEvent' which takes the following parameters:
 *
 * 1. String name: A string representing the name of the event
 * 2. String location: A string representing the location of the event
 */
import {NativeModules} from 'react-native';
const {CalendarModule} = NativeModules;
export default CalendarModule;
```

--------------------------------

### Configure gradle.properties for React Native Architecture

Source: https://reactnative.dev/docs/0.78/integration-with-existing-apps

Set architecture and feature flags in gradle.properties file to specify supported CPU architectures, enable new architecture, and enable Hermes JavaScript engine for improved performance.

```properties
reactNativeArchitectures=armeabi-v7a,arm64-v8a,x86,x86_64
newArchEnabled=true
hermesEnabled=true
```

--------------------------------

### onStartShouldSetResponder Handler - React Native

Source: https://reactnative.dev/docs/0.77/view

Callback function that determines if a View should become the responder at the start of a touch event. Returns a boolean indicating whether the View wants to become responder. Used for handling touch interactions and gesture recognition.

```typescript
onStartShouldSetResponder={({nativeEvent: PressEvent}) => boolean}
```

--------------------------------

### Example React Component Snapshot Output in Jest

Source: https://reactnative.dev/docs/0.77/testing-overview

This snippet illustrates a human-readable, JSX-like string generated by Jest's custom React serializer. It represents a React component's render output and is used as a reference in snapshot testing to detect unintended UI changes.

```tsx
<Text  
  style={  
    Object {  
      "fontSize": 20,  
      "textAlign": "center",  
    }  
  }>  
  Welcome to React Native!  
</Text>
```

--------------------------------

### onScrollBeginDrag Callback

Source: https://reactnative.dev/docs/0.80/scrollview

Called when the user begins to drag the scroll view. Use this callback to detect the start of user-initiated scrolling interactions.

```APIDOC
## onScrollBeginDrag

### Description
Called when the user begins to drag the scroll view.

### Type
function
```

--------------------------------

### onSelectionChange

Source: https://reactnative.dev/docs/0.78/textinput

Callback function invoked when the text input selection is changed. Provides the start and end of the selection.

```APIDOC
## PROPERTY `onSelectionChange`

### Description
Callback that is called when the text input selection is changed.

### Property Name
`onSelectionChange`

### Type
`({nativeEvent: {selection: {start, end} }}) => void`

### Usage Example
```javascript
<TextInput
  onSelectionChange={({ nativeEvent: { selection } }) => {
    console.log('Selection changed:', selection);
  }}
  defaultValue="Select some text"
/>
```
```

--------------------------------

### Show React Native Codegen Script Usage

Source: https://reactnative.dev/docs/0.77/the-new-architecture/using-codegen

This snippet displays the command-line interface for the React Native Codegen script. It outlines the available options such as `--path`, `--targetPlatform`, and `--outputPath`, which are crucial for generating native code artifacts. Understanding these options is essential for correctly configuring the Codegen process for different platforms and project setups.

```bash
node node_modules/react-native/scripts/generate-codegen-artifacts.js  
  
Usage: generate-codegen-artifacts.js -p [path to app] -t [target platform] -o [output path]  
  
Options:  
      --help            Show help                                      [boolean]  
      --version         Show version number                            [boolean]  
  -p, --path            Path to the React Native project root.        [required]  
  -t, --targetPlatform  Target platform. Supported values: "android", "ios",  
                        "all".                                        [required]  
  -o, --outputPath      Path where generated artifacts will be output to.  
```

--------------------------------

### Implement Animated Rotation with TransformOrigin in React Native

Source: https://reactnative.dev/docs/next/transforms

This comprehensive example demonstrates an animated rotation of a `View` component using React Native's `Animated` API and `transformOrigin`. It sets up a continuous loop animation that rotates a pink square 360 degrees, with the `transformOrigin` property influencing the pivot point of the rotation. Dependencies include `React`, `Animated`, `StyleSheet`, `Easing`, `SafeAreaView`, and `SafeAreaProvider`.

```jsx
import React, {useEffect, useRef} from 'react';
import {Animated, View, StyleSheet, Easing} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const rotateAnim = useRef(new Animated.Value(0)).current;

  useEffect(() => {
    Animated.loop(
      Animated.timing(rotateAnim, {
        toValue: 1,
        duration: 5000,
        easing: Easing.linear,
        useNativeDriver: true,
      }),
    ).start();
  }, [rotateAnim]);

  const spin = rotateAnim.interpolate({
    inputRange: [0, 1],
    outputRange: ['0deg', '360deg'],
  });

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <View style={styles.transformOriginWrapper}>
          <Animated.View
            style={[
              styles.transformOriginView,
              {
                transform: [{rotate: spin}],
              },
            ]}
          />
        </View>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  transformOriginWrapper: {
    borderWidth: 1,
    borderColor: 'rgba(0, 0, 0, 0.5)',
  },
  transformOriginView: {
    backgroundColor: 'pink',
    width: 100,
    height: 100,
    transformOrigin: 'top',
  },
});

export default App;
```

--------------------------------

### Specify iOS Device Version in Simulator

Source: https://reactnative.dev/docs/0.77/running-on-simulator-ios

Runs React Native app on a specific iOS device model and version combination when multiple iOS versions are installed. Format includes device name and iOS version number in parentheses.

```shell
npm run ios -- --simulator="iPhone 14 Pro (16.0)"
```

```shell
yarn ios --simulator "iPhone 14 Pro (16.0)"
```

--------------------------------

### Configure React Native Architectures and New Arch in gradle.properties

Source: https://reactnative.dev/docs/0.77/integration-with-existing-apps

This snippet adds specific properties to the `gradle.properties` file to configure React Native. It defines supported architectures (`reactNativeArchitectures`), enables the new architecture (`newArchEnabled`), and activates the Hermes JavaScript engine (`hermesEnabled`), which are crucial for build configuration and performance optimization.

```properties
reactNativeArchitectures=armeabi-v7a,arm64-v8a,x86,x86_64  
newArchEnabled=true  
hermesEnabled=true
```

--------------------------------

### setOffset()

Source: https://reactnative.dev/docs/0.77/animatedvalue

Sets an offset that is applied on top of the current Animated.Value. This is useful for compensating for dynamic changes, such as the start of a pan gesture.

```APIDOC
## Class Method Animated.Value.setOffset()

### Description
Sets an offset that is applied on top of whatever value is set, whether via `setValue`, an animation, or `Animated.event`. Useful for compensating things like the start of a pan gesture.

### Usage
```tsx
setOffset(offset: number);
```

### Parameters
- **offset** (number) - Required - The numerical offset value to apply.

### Return Value
None

```

--------------------------------

### Export a React Native Component for App Use

Source: https://reactnative.dev/docs/intro-react

This example demonstrates how to export a functional component, 'Cat', using `export default`. Exporting a component makes it available for import and use in other files and parts of the React Native application, enabling modular and reusable UI development.

```tsx
const Cat = () => {
  return <Text>Hello, I am your cat!</Text>;
};

export default Cat;
```

--------------------------------

### GET getScrollRef()

Source: https://reactnative.dev/docs/0.78/virtualizedlist

Returns a reference to the underlying ScrollView or View component. May return null if the component is not yet mounted.

```APIDOC
## getScrollRef()

### Description
Provides a handle to the underlying ScrollView or View component.

### Method
Instance method

### Signature
```typescript
getScrollRef(): React.ElementRef<typeof ScrollView> | React.ElementRef<typeof View> | null
```

### Parameters
None

### Returns
ElementRef to ScrollView, View, or null if not mounted
```

--------------------------------

### GET getScrollableNode()

Source: https://reactnative.dev/docs/0.78/virtualizedlist

Returns a reference to the underlying scrollable node. Useful for direct access to the native scroll view implementation.

```APIDOC
## getScrollableNode()

### Description
Provides access to the underlying scrollable node.

### Method
Instance method

### Signature
```typescript
getScrollableNode(): any
```

### Parameters
None

### Returns
any - Reference to the underlying scrollable node
```

--------------------------------

### Initialize React Native Application Class - Kotlin

Source: https://reactnative.dev/docs/0.77/integration-with-existing-apps

Implement ReactApplication interface in Kotlin Application class with ReactNativeHost property delegation and package loading configuration. This Kotlin variant uses property overrides and object expressions for cleaner syntax while maintaining the same React Native initialization functionality.

```kotlin
// package <your-package-here>

import android.app.Application
import com.facebook.react.PackageList
import com.facebook.react.ReactApplication
import com.facebook.react.ReactHost
import com.facebook.react.ReactNativeHost
import com.facebook.react.ReactPackage
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint.load
import com.facebook.react.defaults.DefaultReactHost.getDefaultReactHost
import com.facebook.react.defaults.DefaultReactNativeHost
import com.facebook.soloader.SoLoader
import com.facebook.react.soloader.OpenSourceMergedSoMapping

class MainApplication : Application(), ReactApplication {

  override val reactNativeHost: ReactNativeHost =
    object : DefaultReactNativeHost(this) {
      override fun getPackages(): List<ReactPackage> = PackageList(this).packages
      override fun getJSMainModuleName(): String = "index"
      override fun getUseDeveloperSupport(): Boolean = BuildConfig.DEBUG
      override val isNewArchEnabled: Boolean = BuildConfig.IS_NEW_ARCHITECTURE_ENABLED
      override val isHermesEnabled: Boolean = BuildConfig.IS_HERMES_ENABLED
    }

  override val reactHost: ReactHost
    get() = getDefaultReactHost(applicationContext, reactNativeHost)

  override fun onCreate() {
    super.onCreate()
    SoLoader.init(this, OpenSourceMergedSoMapping)
    if (BuildConfig.IS_NEW_ARCHITECTURE_ENABLED) {
      load()
    }
  }
}
```

--------------------------------

### Listen for Keyboard Events and Dismiss in React Native

Source: https://reactnative.dev/docs/0.78/keyboard

This React Native example demonstrates how to use the `Keyboard` module to attach and remove event listeners for `keyboardDidShow` and `keyboardDidHide`. It updates a component's state based on keyboard visibility and includes a `TextInput` that dismisses the keyboard on submission.

```javascript
import React, {useState, useEffect} from 'react';
import {Keyboard, Text, TextInput, StyleSheet} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const Example = () => {
  const [keyboardStatus, setKeyboardStatus] = useState('Keyboard Hidden');

  useEffect(() => {
    const showSubscription = Keyboard.addListener('keyboardDidShow', () => {
      setKeyboardStatus('Keyboard Shown');
    });
    const hideSubscription = Keyboard.addListener('keyboardDidHide', () => {
      setKeyboardStatus('Keyboard Hidden');
    });

    return () => {
      showSubscription.remove();
      hideSubscription.remove();
    };
  }, []);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={style.container}>
        <TextInput
          style={style.input}
          placeholder="Click here…"
          onSubmitEditing={Keyboard.dismiss}
        />
        <Text style={style.status}>{keyboardStatus}</Text>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const style = StyleSheet.create({
  container: {
    flex: 1,
    padding: 36,
  },
  input: {
    padding: 10,
    borderWidth: 0.5,
    borderRadius: 4,
  },
  status: {
    padding: 16,
    textAlign: 'center',
  }
});

export default Example;
```

--------------------------------

### Import React before Firebase to initialize WebSocket polyfills

Source: https://reactnative.dev/docs/0.77/troubleshooting

Import React from 'react' before loading modules that require WebSockets (like Firebase) to ensure proper initialization of WebSocket polyfills in React Native applications.

```javascript
import React from 'react';
import Firebase from 'firebase';
```

--------------------------------

### GIF and WebP Support Configuration

Source: https://reactnative.dev/docs/0.81/image

Configure Android dependencies in build.gradle to enable GIF and WebP image format support in React Native applications. This setup is required when building native code and supports both animated and static WebP formats.

```APIDOC
## Android Media Format Support Configuration

### Description
Add optional Fresco library modules to android/app/build.gradle to enable GIF and WebP support on Android.

### Configuration Steps

#### File Location
`android/app/build.gradle`

#### Dependencies

```groovy
dependencies {
  // If your app supports Android versions before Ice Cream Sandwich (API level 14)
  implementation 'com.facebook.fresco:animated-base-support:1.3.0'
  
  // For animated GIF support
  implementation 'com.facebook.fresco:animated-gif:3.6.0'
  
  // For WebP support, including animated WebP
  implementation 'com.facebook.fresco:animated-webp:3.6.0'
  implementation 'com.facebook.fresco:webpsupport:3.6.0'
  
  // For WebP support, without animations
  implementation 'com.facebook.fresco:webpsupport:3.6.0'
}
```

### Notes
- Check `packages/react-native/gradle/libs.versions.toml` in the main repo for the current Fresco version
- GIF support requires the animated-gif module
- WebP support can be configured with or without animation support
- Android Ice Cream Sandwich (API level 14) and below requires animated-base-support module
```

--------------------------------

### Open Xcode Workspace for iOS Project

Source: https://reactnative.dev/docs/0.77/the-new-architecture/pure-cxx-modules

Opens the CocoaPods-generated Xcode workspace file for the iOS project. The workspace is required instead of the .xcodeproj file because it manages dependencies installed by CocoaPods. This command must be run from the ios directory where the SampleApp.xcworkspace file is located.

```bash
cd ios
open SampleApp.xcworkspace
```

--------------------------------

### Composing multiple stateful React components (TSX)

Source: https://reactnative.dev/docs/intro-react

This example illustrates how a parent `Cafe` component renders multiple instances of the `Cat` component, each managing its own independent `isHungry` state. This demonstrates the reusability of stateful components and how React enables complex UIs through component composition.

```tsx
const Cafe = () => {
  return (
    <>
      <Cat name="Munkustrap" />
      <Cat name="Spot" />
    </>
  );
};
```

--------------------------------

### TextInput clearTextOnFocus Property (iOS)

Source: https://reactnative.dev/docs/next/textinput

Automatically clears the text field when editing begins. This property is iOS-only and useful for fields that should start empty when the user begins interaction.

```APIDOC
## TextInput clearTextOnFocus Property

### Description
Automatically clears the text field when the user begins editing.

### Platform
iOS only

### Property Name
`clearTextOnFocus`

### Type
bool

### Default Value
`false`

### Usage Example
```javascript
<TextInput
  clearTextOnFocus={true}
  placeholder="Text will clear when editing begins"
/>
```
```

--------------------------------

### Navigate Between Screens with React Navigation's `useNavigation` Hook

Source: https://reactnative.dev/docs/0.79/navigation

This TypeScript React example shows how to use the `useNavigation` hook within a screen component to programmatically navigate to another screen, passing parameters, and how to access those parameters in the target screen via `route.params`.

```tsx
import {useNavigation} from '@react-navigation/native';
  
function HomeScreen() {
  const navigation = useNavigation();
  
  return (
    <Button
      title="Go to Jane's profile"
      onPress={() =>
        navigation.navigate('Profile', {name: 'Jane'})
      }
    />
  );
}
  
function ProfileScreen({route}) {
  return <Text>This is {route.params.name}'s profile</Text>;
}
```

--------------------------------

### Use Stage 1 Proposal `export v from` Syntax in JavaScript

Source: https://reactnative.dev/docs/0.77/javascript-environment

Shows a proposed syntax for re-exporting a default export from another module, providing a more concise way to expose default exports under a different name.

```JavaScript
export v from 'mod';
```

--------------------------------

### setOffset()

Source: https://reactnative.dev/docs/animatedvalue

Sets an offset that is applied on top of the current value. The offset is useful for compensating external factors like the start position of a pan gesture.

```APIDOC
## setOffset()

### Description
Sets an offset that is applied on top of whatever value is set, whether via setValue, an animation, or Animated.event. Useful for compensating things like the start of a pan gesture.

### Method
Instance method

### Signature
```typescript
setOffset(offset: number): void;
```

### Parameters
- **offset** (number) - Required - The offset value to apply

### Example
```typescript
const animatedValue = new Animated.Value(0);
animatedValue.setOffset(50);
```
```

--------------------------------

### Conditionally Style Components with Platform.select in React Native

Source: https://reactnative.dev/docs/0.80/platform-specific-code

This example illustrates using `Platform.select` to apply different background colors to a component based on the running platform (iOS, Android, or default for others like web). It allows for more complex conditional logic than `Platform.OS`.

```tsx
import {Platform, StyleSheet} from 'react-native';  
  
const styles = StyleSheet.create({
  container: {
    flex: 1,
    ...Platform.select({
      ios: {
        backgroundColor: 'red',
      },
      android: {
        backgroundColor: 'green',
      },
      default: {
        // other platforms, web for example  
        backgroundColor: 'blue',
      },
    }),
  },
});
```

--------------------------------

### Systrace.endEvent()

Source: https://reactnative.dev/docs/0.77/systrace

Marks the end of a timed JavaScript event that was started with beginEvent(). Completes the profile measurement and records the timing data.

```APIDOC
## Systrace.endEvent()

### Description
Marks the end of a profiled event started with beginEvent(). Must be called within the same call stack frame as the corresponding beginEvent().

### Method
Static Method

### Signature
```typescript
static endEvent(args?: EventArgs): void;
```

### Parameters
- **args** (EventArgs) - Optional - Additional arguments to include in the profile

### Usage Example
```javascript
import {Systrace} from 'react-native';

Systrace.beginEvent('myEvent');
// ... code to profile ...
Systrace.endEvent();
```

### Related Methods
- `beginEvent()` - Mark the beginning of a timed event
- `endAsyncEvent()` - For events that span multiple frames
```

--------------------------------

### Configure Local Library Dependency in package.json

Source: https://reactnative.dev/docs/legacy/local-library-setup

This snippet demonstrates how local libraries are automatically configured in `package.json` as dependencies. Depending on whether `npm` or `Yarn` is used, the library will be linked via a `file:` or `link:` protocol, respectively, creating a symlink that enables autolinking without publishing to a registry.

```json
{
  "dependencies": {
    "awesome-module": "file:./modules/awesome-module"
  }
}
```

```json
{
  "dependencies": {
    "awesome-module": "link:./modules/awesome-module"
  }
}
```

--------------------------------

### Setup Layout with Choreographer Frame Callback

Source: https://reactnative.dev/docs/0.78/legacy/native-components-android

Uses Choreographer to post frame callbacks for continuous layout updates. This ensures proper view measurement and layout dispatch on each frame, accommodating dynamic size changes and maintaining UI synchronization with the rendering pipeline.

```java
public void setupLayout(View view) {
  Choreographer.getInstance().postFrameCallback(new Choreographer.FrameCallback() {
    @Override
    public void doFrame(long frameTimeNanos) {
      manuallyLayoutChildren(view);
      view.getViewTreeObserver().dispatchOnGlobalLayout();
      Choreographer.getInstance().postFrameCallback(this);
    }
  });
}
```

--------------------------------

### Animated.parallel()

Source: https://reactnative.dev/docs/0.77/animated

Starts an array of animations all at the same time. By default, if one of the animations is stopped, they will all be stopped. This behavior can be overridden with the stopTogether flag.

```APIDOC
## Animated.parallel()

### Description
Starts an array of animations all at the same time. By default, if one of the animations is stopped, they will all be stopped. You can override this with the `stopTogether` flag.

### Method
STATIC

### Signature
```typescript
static parallel(
  animations: CompositeAnimation[],
  config?: ParallelConfig
): CompositeAnimation;
```

### Parameters
#### Function Parameters
- **animations** (CompositeAnimation[]) - Required - Array of animations to execute in parallel
- **config** (ParallelConfig) - Optional - Configuration object for parallel execution

#### Config Properties
- **stopTogether** (boolean) - Optional - If false, animations continue running even if one stops. Default is true

### Returns
- **CompositeAnimation** - A composite animation object that can be started, stopped, or reset

### Request Example
```typescript
const parallelAnimation = Animated.parallel([
  Animated.timing(animValue1, {toValue: 100, duration: 500}),
  Animated.timing(animValue2, {toValue: 200, duration: 500})
], {stopTogether: false});
parallelAnimation.start();
```
```

--------------------------------

### Configure Metro for React Native projects

Source: https://reactnative.dev/docs/0.77/integration-with-existing-apps

This JavaScript snippet shows how to create a basic `metro.config.js` file using `@react-native/metro-config`. It's essential for Metro bundler to correctly process application code, enabling features like hot reloading. Place this file in the root of your project.

```javascript
const {getDefaultConfig} = require('@react-native/metro-config');
module.exports = getDefaultConfig(__dirname);
```

--------------------------------

### Analyze iOS Codegen Artifact Generation Output

Source: https://reactnative.dev/docs/0.77/turbo-native-modules-introduction

This shell output demonstrates the successful execution of the Codegen process during `pod install` for iOS. It shows that script phases are added, a `ReactCodegen.podspec.json` is generated, and the Codegen tool identifies relevant `codegen-enabled` libraries within the project and its dependencies.

```shell
...  
Framework build type is static library  
[Codegen] Adding script_phases to ReactCodegen.  
[Codegen] Generating ./build/generated/ios/ReactCodegen.podspec.json  
[Codegen] Analyzing /Users/me/src/TurboModuleExample/package.json  
[Codegen] Searching for codegen-enabled libraries in the app.  
[Codegen] Found TurboModuleExample  
[Codegen] Searching for codegen-enabled libraries in the project dependencies.  
[Codegen] Found react-native  
...  
```

--------------------------------

### Add TypeScript and type definitions to an existing React Native project

Source: https://reactnative.dev/docs/0.79/typescript

These commands install TypeScript, the official React Native TypeScript configuration, and type definitions for popular libraries like Jest, React, and React Test Renderer. These packages are added as development dependencies. It's important to note that specific versions might need to be adjusted to match your project's existing dependencies.

```shell
npm install -D typescript @react-native/typescript-config @types/jest @types/react @types/react-test-renderer
```

```shell
yarn add --dev typescript @react-native/typescript-config @types/jest @types/react @types/react-test-renderer
```

--------------------------------

### Implement Pull-to-Refresh with RefreshControl in React Native

Source: https://reactnative.dev/docs/0.77/refreshcontrol

Creates a basic pull-to-refresh implementation using RefreshControl component with ScrollView. The example demonstrates state management for the refreshing indicator, a callback handler that simulates a 2-second refresh delay, and styling configuration. Requires react-native and react-native-safe-area-context packages.

```javascript
import React from 'react';
import {RefreshControl, ScrollView, StyleSheet, Text} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const [refreshing, setRefreshing] = React.useState(false);

  const onRefresh = React.useCallback(() => {
    setRefreshing(true);
    setTimeout(() => {
      setRefreshing(false);
    }, 2000);
  }, []);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <ScrollView
          contentContainerStyle={styles.scrollView}
          refreshControl={
            <RefreshControl refreshing={refreshing} onRefresh={onRefresh} />
          }>
          <Text>Pull down to see RefreshControl indicator</Text>
        </ScrollView>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  scrollView: {
    flex: 1,
    backgroundColor: 'pink',
    alignItems: 'center',
    justifyContent: 'center',
  },
});

export default App;
```

--------------------------------

### sendIntent()

Source: https://reactnative.dev/docs/linking

Launches an Android intent with an optional array of extras. This method is Android-specific.

```APIDOC
## Function Call sendIntent()

### Description
Launch an Android intent with extras.

### Method
Function Call

### Endpoint
`static sendIntent(action: string, extras?: Array<{key: string; value: string | number | boolean}>): Promise<void>`

### Parameters
#### Path Parameters
_None_

#### Query Parameters
_None_

#### Request Body
- **action** (string) - Required - The action to perform (e.g., "android.intent.action.VIEW").
- **extras** (Array<{key: string; value: string | number | boolean}>) - Optional - An array of objects, each containing a `key` and `value` to be passed as extras to the intent.

### Request Example
_Not Applicable_

### Response
#### Success Response (Promise<void>)
- _No specific return value_ - The Promise resolves when the intent is successfully launched.

#### Response Example
_No direct response, action is launching an intent_
```

--------------------------------

### Implement AndroidX Fragment to Host Custom View (Kotlin/Java)

Source: https://reactnative.dev/docs/0.80/legacy/native-components-android

This snippet provides examples in Kotlin and Java for creating an AndroidX `Fragment` named `MyFragment`. It shows how to instantiate and return the previously defined `CustomView` within the `onCreateView` lifecycle method, along with common lifecycle overrides.

```kotlin
// replace with your package  
package com.mypackage  
  
import android.os.Bundle  
import android.view.LayoutInflater  
import android.view.View  
import android.view.ViewGroup  
import androidx.fragment.app.Fragment  
  
// replace with your view's import  
import com.mypackage.CustomView  
  
class MyFragment : Fragment() {  
  private lateinit var customView: CustomView  
  
  override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {  
    super.onCreateView(inflater, container, savedInstanceState)  
    customView = CustomView(requireNotNull(context))  
    return customView // this CustomView could be any view that you want to render  
  }  
  
  override fun onViewCreated(view: View, savedInstanceState: Bundle?) {  
    super.onViewCreated(view, savedInstanceState)  
    // do any logic that should happen in an `onCreate` method, e.g:  
    // customView.onCreate(savedInstanceState);  
  }  
  
  override fun onPause() {  
    super.onPause()  
    // do any logic that should happen in an `onPause` method  
    // e.g.: customView.onPause();  
  }  
  
  override fun onResume() {  
    super.onResume()  
    // do any logic that should happen in an `onResume` method  
    // e.g.: customView.onResume();  
  }  
  
  override fun onDestroy() {  
    super.onDestroy()  
    // do any logic that should happen in an `onDestroy` method  
    // e.g.: customView.onDestroy();  
  }  
}  
```

```java
// replace with your package  
package com.mypackage;  
  
import android.os.Bundle;  
import android.view.LayoutInflater;  
import android.view.View;  
import android.view.ViewGroup;  
import androidx.fragment.app.Fragment;  
  
// replace with your view's import  
import com.mypackage.CustomView;  
  
public class MyFragment extends Fragment {  
    CustomView customView;  
  
    @Override  
    public View onCreateView(LayoutInflater inflater, ViewGroup parent, Bundle savedInstanceState) {  
        super.onCreateView(inflater, parent, savedInstanceState);  
        customView = new CustomView(this.getContext());  
        return customView; // this CustomView could be any view that you want to render  
    }  
  
    @Override  
    public void onViewCreated(View view, Bundle savedInstanceState) {  
        super.onViewCreated(view, savedInstanceState);  
        // do any logic that should happen in an `onCreate` method, e.g:  
        // customView.onCreate(savedInstanceState);  
    }  
  
    @Override  
    public void onPause() {  
        super.onPause();  
        // do any logic that should happen in an `onPause` method  
        // e.g.: customView.onPause();  
    }  
  
    @Override  
    public void onResume() {  
        super.onResume();  
       // do any logic that should happen in an `onResume` method  
       // e.g.: customView.onResume();  
    }  
  
    @Override  
    public void onDestroy() {  
        super.onDestroy();  
        // do any logic that should happen in an `onDestroy` method  
        // e.g.: customView.onDestroy();  
    }  
}  
```

--------------------------------

### Callback: onSelectionChange

Source: https://reactnative.dev/docs/0.77/textinput

Called when the text input's text selection changes. Provides the start and end indices of the selection.

```APIDOC
## Callback: `onSelectionChange`

### Description
Callback that is called when the text input selection is changed.

### Type
`({nativeEvent: {selection: {start, end} }}) => void`
```

--------------------------------

### Systrace.endAsyncEvent()

Source: https://reactnative.dev/docs/0.77/systrace

Marks the end of an asynchronous JavaScript event that was started with beginAsyncEvent(). Accepts the event name and the cookie identifier returned from beginAsyncEvent().

```APIDOC
## Systrace.endAsyncEvent()

### Description
Marks the end of an asynchronous profiled event. Completes the profile measurement for an event started with beginAsyncEvent(). Can occur on another thread or out of the current stack frame.

### Method
Static Method

### Signature
```typescript
static endAsyncEvent(
  eventName: string,
  cookie: number,
  args?: EventArgs
): void;
```

### Parameters
- **eventName** (string) - Required - Name of the event (must match beginAsyncEvent call)
- **cookie** (number) - Required - The cookie identifier returned from beginAsyncEvent()
- **args** (EventArgs) - Optional - Additional arguments to include in the profile

### Usage Example
```javascript
import {Systrace} from 'react-native';

const cookie = Systrace.beginAsyncEvent('asyncTask');

setTimeout(() => {
  Systrace.endAsyncEvent('asyncTask', cookie);
}, 1000);
```

### Related Methods
- `beginAsyncEvent()` - Start an async event and get cookie
- `endEvent()` - For synchronous events
```

--------------------------------

### Configure Maven Mirror for Android Builds

Source: https://reactnative.dev/docs/0.78/build-speed

This snippet demonstrates how to configure an `exclusiveEnterpriseRepository` in your `android/gradle.properties` file. By setting this property to an internal Maven mirror URL, Gradle will exclusively fetch dependencies from this repository, potentially speeding up Android build times by reducing external network calls.

```properties
# Use this property to enable or disable the Hermes JS engine.
# If set to false, you will be using JSC instead.
hermesEnabled=true

# Use this property to configure a Maven enterprise repository
# that will be used exclusively to fetch all of your dependencies.
exclusiveEnterpriseRepository=https://my.internal.proxy.net/
```

--------------------------------

### Configure Custom React Native Platform in package.json for Metro

Source: https://reactnative.dev/docs/0.77/out-of-tree-platforms

This JSON configuration block within the `package.json` file is used to register a custom React Native platform with Metro, React Native's JavaScript bundler. It leverages the `rnpm.haste` field to specify `providesModuleNodeModules` for Haste module resolution and `platforms` to define valid platform suffixes, enabling commands like `npx react-native bundle --platform example` to correctly find platform-specific files.

```json
{
  "rnpm": {
    "haste": {
      "providesModuleNodeModules": ["react-native-example"],
      "platforms": ["example"]
    }
  }
}
```

--------------------------------

### PressEvent Object Type

Source: https://reactnative.dev/docs/0.80/pressevent

`PressEvent` object is returned in the callback as a result of user press interaction, for example `onPress` in Button component.

```APIDOC
## PressEvent Object Type

### Description
`PressEvent` object is returned in the callback as a result of user press interaction, for example `onPress` in Button component.

### Object Properties
- **changedTouches** (array of PressEvents) - Required - Array of all PressEvents that have changed since the last event.
- **force** (number) - Optional - Amount of force used during the 3D Touch press. Returns the float value in range from `0.0` to `1.0`. (iOS only)
- **identifier** (number) - Required - Unique numeric identifier assigned to the event.
- **locationX** (number) - Required - Touch origin X coordinate inside touchable area (relative to the element).
- **locationY** (number) - Required - Touch origin Y coordinate inside touchable area (relative to the element).
- **pageX** (number) - Required - Touch origin X coordinate on the screen (relative to the root view).
- **pageY** (number) - Required - Touch origin Y coordinate on the screen (relative to the root view).
- **target** (number, null, undefined) - Required - The node id of the element receiving the PressEvent.
- **timestamp** (number) - Required - Timestamp value when a PressEvent occurred. Value is represented in milliseconds.
- **touches** (array of PressEvents) - Required - Array of all current PressEvents on the screen.

### Object Example
```json
{
    "changedTouches": [],
    "identifier": 1,
    "locationX": 8,
    "locationY": 4.5,
    "pageX": 24,
    "pageY": 49.5,
    "target": 1127,
    "timestamp": 85131876.58868201,
    "touches": []
}
```
```

--------------------------------

### Define React Native Module Information (Java/Kotlin)

Source: https://reactnative.dev/docs/0.80/turbo-native-modules-introduction

This snippet shows how to provide metadata for a native module within a React Native package using either Java or Kotlin. It defines the module's name, class name, and configuration flags like 'isTurboModule', allowing React Native to correctly identify and load the native module.

```java
public Map<String, ReactModuleInfo> getReactModuleInfos() {  
  Map<String, ReactModuleInfo> map = new HashMap<>();  
  map.put(NativeLocalStorageModule.NAME, new ReactModuleInfo(  
    NativeLocalStorageModule.NAME,       // name  
    NativeLocalStorageModule.NAME,       // className  
    false, // canOverrideExistingModule  
    false, // needsEagerInit  
    false, // isCXXModule  
    true   // isTurboModule  
  ));  
  return map;  
}
```

```kotlin
override fun getReactModuleInfoProvider() = ReactModuleInfoProvider {  
    mapOf(  
      NativeLocalStorageModule.NAME to ReactModuleInfo(  
        name = NativeLocalStorageModule.NAME,  
        className = NativeLocalStorageModule.NAME,  
        canOverrideExistingModule = false,  
        needsEagerInit = false,  
        isCxxModule = false,  
        isTurboModule = true  
      )  
    )  
  }
```

--------------------------------

### Find and terminate process on port 8081 using shell commands

Source: https://reactnative.dev/docs/0.77/troubleshooting

Locate the process ID listening on port 8081 using lsof command, then terminate it using the kill command. This resolves Metro bundler port conflicts on Unix-based systems.

```shell
sudo lsof -i :8081
```

```shell
kill -9 <PID>
```

--------------------------------

### Animated.loop()

Source: https://reactnative.dev/docs/0.77/animated

Loops a given animation continuously, so that each time it reaches the end, it resets and begins again from the start. Can prevent VirtualizedList components from rendering while running.

```APIDOC
## Animated.loop()

### Description
Loops a given animation continuously, so that each time it reaches the end, it resets and begins again from the start. Will loop without blocking the JS thread if the child animation is set to `useNativeDriver: true`. In addition, loops can prevent `VirtualizedList`-based components from rendering more rows while the animation is running. You can pass `isInteraction: false` in the child animation config to fix this.

### Method
STATIC

### Signature
```typescript
static loop(
  animation: CompositeAnimation[],
  config?: LoopAnimationConfig
): CompositeAnimation;
```

### Parameters
#### Function Parameters
- **animation** (CompositeAnimation[]) - Required - Animation to loop
- **config** (LoopAnimationConfig) - Optional - Configuration object for looping behavior

#### Config Properties
- **iterations** (number) - Optional - Number of times the animation should loop. Default is -1 (infinite)

### Returns
- **CompositeAnimation** - A composite animation object that can be started, stopped, or reset

### Request Example
```typescript
const loopedAnimation = Animated.loop(
  Animated.timing(animValue, {toValue: 100, duration: 500}),
  {iterations: 5}
);
loopedAnimation.start();
```
```

--------------------------------

### Mark Systrace Event Start in React Native

Source: https://reactnative.dev/docs/0.78/systrace

The `beginEvent()` method marks the beginning of a synchronous profiling event on the Systrace timeline. It accepts an event name (string or function returning string) and optional arguments. This method should be paired with `endEvent()` within the same call stack frame.

```typescript
static beginEvent(eventName: string | (() => string), args?: EventArgs);
```

--------------------------------

### ScrollView zoomScale iOS Property

Source: https://reactnative.dev/docs/scrollview

Gets or sets the current scale of the scroll view content on iOS platform. Defaults to 1.0, representing normal zoom level without scaling.

```typescript
zoomScale={1.0}
```

--------------------------------

### Add React Native Subspecs to Podfile (CocoaPods)

Source: https://reactnative.dev/docs/next/troubleshooting

Demonstrates how to include specific React Native subspecs (e.g., RCTText, RCTImage, RCTNetwork) in your `Podfile` when using CocoaPods. This ensures that necessary dependencies are linked for features like React Native's Text, Image, and network APIs.

```ruby
pod 'React', :path => '../node_modules/react-native', :subspecs => [
  'RCTText',
  'RCTImage',
  'RCTNetwork',
  'RCTWebSocket'
]
```

--------------------------------

### Configure Metro Bundler for Local Library - JavaScript

Source: https://reactnative.dev/docs/0.77/the-new-architecture/create-module-library

Updates metro.config.js to enable Metro to resolve files from an external library directory. Includes watchFolders to monitor the library path and resolver configuration to provide React Native dependencies to the library.

```javascript
const {getDefaultConfig, mergeConfig} = require('@react-native/metro-config');

/**
 * Metro configuration
 * https://reactnative.dev/docs/metro
 *
 * @type {import('metro-config').MetroConfig}
 */
const path = require('path');

const config = {
  // Make Metro able to resolve required external dependencies
  watchFolders: [
    path.resolve(__dirname, '../Library'),
  ],
  resolver: {
    extraNodeModules: {
      'react-native': path.resolve(__dirname, 'node_modules/react-native'),
    },
  },
};

module.exports = mergeConfig(getDefaultConfig(__dirname), config);
```

--------------------------------

### zoomScale Property

Source: https://reactnative.dev/docs/0.79/scrollview

iOS only. Gets or sets the current scale of the scroll view content for zoom functionality. Default value is 1.0.

```APIDOC
## zoomScale Property

### Description
The current scale of the scroll view content.

### Platform
iOS

### Type
`number`

### Default
`1.0`

### Example
```tsx
<ScrollView
  zoomScale={1.0}
  maximumZoomScale={3.0}
  minimumZoomScale={0.5}
>
  {/* Content */}
</ScrollView>
```
```

--------------------------------

### Monitor AccessibilityInfo State in React Native

Source: https://reactnative.dev/docs/0.77/accessibilityinfo

This React Native example demonstrates how to use the `AccessibilityInfo` API to check the current 'reduce motion' and 'screen reader enabled' states and subscribe to their changes. It utilizes React hooks like `useState` and `useEffect` to manage and display these accessibility settings dynamically within a functional component.

```javascript
import React, {useState, useEffect} from 'react';
import {AccessibilityInfo, Text, StyleSheet} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  const [reduceMotionEnabled, setReduceMotionEnabled] = useState(false);
  const [screenReaderEnabled, setScreenReaderEnabled] = useState(false);

  useEffect(() => {
    const reduceMotionChangedSubscription = AccessibilityInfo.addEventListener(
      'reduceMotionChanged',
      isReduceMotionEnabled => {
        setReduceMotionEnabled(isReduceMotionEnabled);
      },
    );
    const screenReaderChangedSubscription = AccessibilityInfo.addEventListener(
      'screenReaderChanged',
      isScreenReaderEnabled => {
        setScreenReaderEnabled(isScreenReaderEnabled);
      },
    );

    AccessibilityInfo.isReduceMotionEnabled().then(isReduceMotionEnabled => {
      setReduceMotionEnabled(isReduceMotionEnabled);
    });
    AccessibilityInfo.isScreenReaderEnabled().then(isScreenReaderEnabled => {
      setScreenReaderEnabled(isScreenReaderEnabled);
    });

    return () => {
      reduceMotionChangedSubscription.remove();
      screenReaderChangedSubscription.remove();
    };
  }, []);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Text style={styles.status}>
          The reduce motion is {reduceMotionEnabled ? 'enabled' : 'disabled'}.
        </Text>
        <Text style={styles.status}>
          The screen reader is {screenReaderEnabled ? 'enabled' : 'disabled'}.
        </Text>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  status: {
    margin: 30,
  },
});

export default App;
```

--------------------------------

### GET getScrollResponder()

Source: https://reactnative.dev/docs/0.78/virtualizedlist

Returns the underlying scroll responder mixin. Note that the internal reference might not be a ScrollView, so the method checks if it responds to getScrollResponder before calling it.

```APIDOC
## getScrollResponder()

### Description
Provides a handle to the underlying scroll responder. Note that the internal reference might not be a ScrollView, so we need to check that it responds to getScrollResponder before calling it.

### Method
Instance method

### Signature
```typescript
getScrollResponder(): ScrollResponderMixin | null
```

### Parameters
None

### Returns
ScrollResponderMixin or null
```

--------------------------------

### Configure NVM for Xcode in zsh

Source: https://reactnative.dev/docs/0.78/set-up-your-environment

This snippet initializes NVM in a zsh shell, setting the `NVM_DIR` and loading `nvm.sh`. This configuration helps Xcode locate the correct Node.js executable, especially when using multiple Node.js versions managed by NVM. It is recommended to place this in `~/.zshenv`.

```zsh
export NVM_DIR="$HOME/.nvm"  
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

```

--------------------------------

### Define Native Component with Codegen Types (Before Strict API)

Source: https://reactnative.dev/docs/0.80/strict-typescript-api

This example demonstrates how to define a native component and its properties using codegen types before opting into the Strict TypeScript API. Types like `Int32` and `WithDefault`, along with `codegenNativeComponent`, were typically imported from deep, internal paths within the `react-native/Libraries` directory.

```typescript
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type {
  Int32,
  WithDefault,
} from 'react-native/Libraries/Types/CodegenTypes';
  
interface NativeProps extends ViewProps {
  enabled?: WithDefault<boolean, true>;
  size?: Int32;
}
  
export default codegenNativeComponent<NativeProps>(
  'RNCustomComponent',
);
```

--------------------------------

### Animated.stagger()

Source: https://reactnative.dev/docs/0.77/animated

Array of animations may run in parallel with overlap, but are started in sequence with successive delays. Useful for creating trailing effects and cascading animations.

```APIDOC
## Animated.stagger()

### Description
Array of animations may run in parallel (overlap), but are started in sequence with successive delays. Nice for doing trailing effects.

### Method
STATIC

### Signature
```typescript
static stagger(
  time: number,
  animations: CompositeAnimation[]
): CompositeAnimation;
```

### Parameters
#### Function Parameters
- **time** (number) - Required - Delay in milliseconds between starting each animation
- **animations** (CompositeAnimation[]) - Required - Array of animations to stagger

### Returns
- **CompositeAnimation** - A composite animation object that can be started, stopped, or reset

### Request Example
```typescript
const staggeredAnimation = Animated.stagger(100, [
  Animated.timing(animValue1, {toValue: 100, duration: 500}),
  Animated.timing(animValue2, {toValue: 200, duration: 500}),
  Animated.timing(animValue3, {toValue: 300, duration: 500})
]);
staggeredAnimation.start();
```
```

--------------------------------

### Configure Yarn local library dependency

Source: https://reactnative.dev/docs/0.80/legacy/local-library-setup

Add the local library as a link-based dependency in package.json using Yarn's link: protocol. This creates a symlink to the library under node_modules, enabling autolinking integration with your React Native project.

```json
"dependencies": {
  "awesome-module": "link:./modules/awesome-module"
}
```

--------------------------------

### Example ViewToken Object Structure in JavaScript

Source: https://reactnative.dev/docs/0.81/viewtoken

This JavaScript code snippet illustrates the typical structure and content of a `ViewToken` object. It shows properties like `item`, `key`, `index`, and `isViewable`, which are provided in the `onViewableItemsChanged` callback.

```javascript
{
  item: {key: "key-12"},  
  key: "key-12",  
  index: 11,  
  isViewable: true  
}
```

--------------------------------

### Layout Prop: alignItems

Source: https://reactnative.dev/docs/0.80/layout-props

`alignItems` aligns children in the cross direction. For example, if children are flowing vertically, `alignItems` controls how they align horizontally. It works like `align-items` in CSS (default: stretch).

```APIDOC
## Prop: alignItems

### Description
`alignItems` aligns children in the cross direction. For example, if children are flowing vertically, `alignItems` controls how they align horizontally. It works like `align-items` in CSS (default: stretch). See https://developer.mozilla.org/en-US/docs/Web/CSS/align-items for more details.

### Type
`enum('flex-start', 'flex-end', 'center', 'stretch', 'baseline')`

### Required
No
```

--------------------------------

### Configure ANDROID_HOME Environment Variable in Shell

Source: https://reactnative.dev/docs/0.77/set-up-your-environment

Sets up required environment variables for React Native Android development by exporting ANDROID_HOME path and adding emulator and platform-tools to PATH. This configuration should be added to shell profile files (~/.zprofile, ~/.zshrc for zsh, or ~/.bash_profile, ~/.bashrc for bash) and then sourced to load into the current shell session.

```shell
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

--------------------------------

### TextInput Selection Change Callback

Source: https://reactnative.dev/docs/0.80/textinput

Called when the text input selection changes. Provides selection object with start and end positions indicating the selected text range.

```javascript
const handleSelectionChange = ({nativeEvent}) => {
  const {start, end} = nativeEvent.selection;
  console.log(`Selection - Start: ${start}, End: ${end}`);
};

<TextInput
  onSelectionChange={handleSelectionChange}
/>
```

--------------------------------

### Basic TouchableHighlight Usage in React Native (TSX)

Source: https://reactnative.dev/docs/0.77/touchablehighlight

This example demonstrates a basic implementation of `TouchableHighlight` in React Native using TypeScript JSX. It wraps a custom component, `MyComponent`, and shows how to set `activeOpacity`, `underlayColor`, and an `onPress` handler. Note that `TouchableHighlight` requires exactly one child component.

```tsx
function MyComponent(props: MyComponentProps) {  
  return (  
    <View {...props} style={{flex: 1, backgroundColor: '#fff'}}>  
      <Text>My Component</Text>  
    </View>  
  );  
}  
  
<TouchableHighlight  
  activeOpacity={0.6}  
  underlayColor="#DDDDDD"  
  onPress={() => alert('Pressed!')}>  
  <MyComponent />  
</TouchableHighlight>;
```

--------------------------------

### React Native Text Node Placement Rules

Source: https://reactnative.dev/docs/0.79/text

This example highlights the strict rule in React Native that all text nodes must be wrapped within a `<Text>` component. Placing plain text directly as a child of a `<View>` will result in an error.

```tsx
// BAD: will raise exception, can't have a text node as child of a <View>  
<View>  
  Some text  
</View>  
  
// GOOD  
<View>  
  <Text>  
    Some text  
  </Text>  
</View>
```

--------------------------------

### Create React Module Info Map - Java

Source: https://reactnative.dev/docs/turbo-native-modules-introduction

Initializes a HashMap containing ReactModuleInfo for the NativeLocalStorageModule with Turbo module support enabled. This configuration specifies module metadata including name, class name, and capability flags for the React Native bridge.

```java
Map<String, ReactModuleInfo> map = new HashMap<>();
map.put(NativeLocalStorageModule.NAME, new ReactModuleInfo(
  NativeLocalStorageModule.NAME,       // name
  NativeLocalStorageModule.NAME,       // className
  false, // canOverrideExistingModule
  false, // needsEagerInit
  false, // isCXXModule
  true   // isTurboModule
));
return map;
```

--------------------------------

### Apply Platform-Specific Styles using React Native Platform.select

Source: https://reactnative.dev/docs/0.78/platform-specific-code

This example illustrates how to use `Platform.select` to define different styles for iOS, Android, and other platforms (like web). It allows for a more organized way to manage platform-specific styling within a single style object.

```tsx
import {Platform, StyleSheet} from 'react-native';  
  
const styles = StyleSheet.create({  
  container: {  
    flex: 1,  
    ...Platform.select({  
      ios: {  
        backgroundColor: 'red',  
      },  
      android: {  
        backgroundColor: 'green',
      },
      default: {  
        // other platforms, web for example  
        backgroundColor: 'blue',
      },
    }),  
  },
});
```

--------------------------------

### Access C++ Turbo Native Module from React Native App.tsx

Source: https://reactnative.dev/docs/0.78/the-new-architecture/pure-cxx-modules

This TypeScript React code demonstrates how to import and interact with a C++ Turbo Native Module (`SampleTurboModule`) from a React Native application's `App.tsx` file. It sets up a basic UI with a text input and a button to call the `reverseString` method of the native module, displaying the result. While this example directly imports the module spec, best practice suggests wrapping specs in a separate file for better control.

```TypeScript
import React from 'react';  
import {  
  Button,  
  SafeAreaView,  
  StyleSheet,  
  Text,  
  TextInput,  
  View,  
} from 'react-native';  
import SampleTurboModule from './specs/NativeSampleModule';  
  
function App(): React.JSX.Element {  
  const [value, setValue] = React.useState('');  
  const [reversedValue, setReversedValue] = React.useState('');  
  
  const onPress = () => {  
    const revString = SampleTurboModule.reverseString(value);  
    setReversedValue(revString);  
  };  
  
  return (  
    <SafeAreaView style={styles.container}>  
      <View>  
        <Text style={styles.title}>  
          Welcome to C++ Turbo Native Module Example  
        </Text>  
        <Text>Write down here the text you want to reverse</Text>  
        <TextInput  
          style={styles.textInput}  
          placeholder="Write your text here"  
          onChangeText={setValue}  
          value={value}  
        />  
        <Button title="Reverse" onPress={onPress} />  
        <Text>Reversed text: {reversedValue}</Text>  
      </View>  
    </SafeAreaView>  
  );  
}  
  
const styles = StyleSheet.create({  
  container: {  
    flex: 1,  
    justifyContent: 'center',  
    alignItems: 'center',  
  },  
  title: {  
    fontSize: 18,  
    marginBottom: 20,  
  },  
  textInput: {  
    borderColor: 'black',  
    borderWidth: 1,  
    borderRadius: 5,  
    padding: 10,  
    marginTop: 10,  
  },  
});  
  
export default App;
```

--------------------------------

### GET Dimensions.get()

Source: https://reactnative.dev/docs/0.80/dimensions

Retrieves the current dimensions of the device screen and visible application window. Returns a DimensionsValue object containing ScaledSize information for both screen and window.

```APIDOC
## GET Dimensions.get()

### Description
Retrieves the current dimensions of the device screen and application window, including width, height, scale, and font scale values.

### Method
GET

### Endpoint
Dimensions.get()

### Response
#### Success Response (200)
Returns a DimensionsValue object containing:
- **window** (ScaledSize) - Required - Size of the visible Application window
- **screen** (ScaledSize) - Required - Size of the device's screen

#### ScaledSize Object Properties
- **width** (number) - Required - Width in pixels
- **height** (number) - Required - Height in pixels
- **scale** (number) - Required - Scale factor of the device
- **fontScale** (number) - Required - Font scale factor of the device

#### Response Example
{
  "window": {
    "width": 375,
    "height": 667,
    "scale": 2,
    "fontScale": 1
  },
  "screen": {
    "width": 375,
    "height": 812,
    "scale": 3,
    "fontScale": 1
  }
}
```

--------------------------------

### Prop: onAccessibilityAction

Source: https://reactnative.dev/docs/0.77/text

Invoked when the user performs the accessibility actions. The only argument to this function is an event containing the name of the action to perform. See the Accessibility guide for more information.

```APIDOC
## GET /onAccessibilityAction

### Description
Invoked when the user performs the accessibility actions. The only argument to this function is an event containing the name of the action to perform.
See the Accessibility guide for more information.

### Method
GET

### Endpoint
/onAccessibilityAction

### Parameters
#### Path Parameters
- **Type** (function) - Optional - Callback function invoked when an accessibility action is performed.

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
N/A

### Response
#### Success Response (200)
N/A

#### Response Example
N/A
```

--------------------------------

### Implement NativeLocalStorageModule for Android with Java/Kotlin

Source: https://reactnative.dev/docs/0.80/turbo-native-modules-introduction

This snippet provides the Java and Kotlin implementations for the `NativeLocalStorageModule`. It extends `NativeLocalStorageSpec` and uses Android's `SharedPreferences` to manage persistent key-value pairs, offering methods for `setItem`, `getItem`, `removeItem`, and `clear`.

```java
package com.nativelocalstorage;  
  
import android.content.Context;  
import android.content.SharedPreferences;  
import com.nativelocalstorage.NativeLocalStorageSpec;  
import com.facebook.react.bridge.ReactApplicationContext;  
  
public class NativeLocalStorageModule extends NativeLocalStorageSpec {  
  
  public static final String NAME = "NativeLocalStorage";  
  
  public NativeLocalStorageModule(ReactApplicationContext reactContext) {  
    super(reactContext);  
  }  
  
  @Override  
  public String getName() {  
    return NAME;  
  }  
  
  @Override  
  public void setItem(String value, String key) {  
    SharedPreferences sharedPref = getReactApplicationContext().getSharedPreferences("my_prefs", Context.MODE_PRIVATE);  
    SharedPreferences.Editor editor = sharedPref.edit();  
    editor.putString(key, value);  
    editor.apply();  
  }  
  
  @Override  
  public String getItem(String key) {  
    SharedPreferences sharedPref = getReactApplicationContext().getSharedPreferences("my_prefs", Context.MODE_PRIVATE);  
    String username = sharedPref.getString(key, null);  
    return username;  
  }  
  
  @Override  
  public void removeItem(String key) {  
    SharedPreferences sharedPref = getReactApplicationContext().getSharedPreferences("my_prefs", Context.MODE_PRIVATE);  
    sharedPref.edit().remove(key).apply();  
  }  
  
  @Override  
  public void clear() {  
    SharedPreferences sharedPref = getReactApplicationContext().getSharedPreferences("my_prefs", Context.MODE_PRIVATE);  
    sharedPref.edit().clear().apply();  
  }  
}
```

```kotlin
package com.nativelocalstorage  
  
import android.content.Context  
import android.content.SharedPreferences  
import com.nativelocalstorage.NativeLocalStorageSpec  
import com.facebook.react.bridge.ReactApplicationContext  
  
class NativeLocalStorageModule(reactContext: ReactApplicationContext) : NativeLocalStorageSpec(reactContext) {  
  
  override fun getName() = NAME  
  
  override fun setItem(value: String, key: String) {  
    val sharedPref = getReactApplicationContext().getSharedPreferences("my_prefs", Context.MODE_PRIVATE)  
    val editor = sharedPref.edit()  
    editor.putString(key, value)  
    editor.apply()  
  }  
  
  override fun getItem(key: String): String? {  
    val sharedPref = getReactApplicationContext().getSharedPreferences("my_prefs", Context.MODE_PRIVATE)  
    val username = sharedPref.getString(key, null)  
    return username.toString()  
  }  
  
  override fun removeItem(key: String) {  
    val sharedPref = getReactApplicationContext().getSharedPreferences("my_prefs", Context.MODE_PRIVATE)  
    val editor = sharedPref.edit()  
    editor.remove(key)  
    editor.apply()  
  }  
  
  override fun clear() {  
    val sharedPref = getReactApplicationContext().getSharedPreferences("my_prefs", Context.MODE_PRIVATE)  
    val editor = sharedPref.edit()  
    editor.clear()  
    editor.apply()  
  }  
  
  companion object {  
    const val NAME = "NativeLocalStorage"  
  }
}
```

--------------------------------

### Configure Gradle Properties for App Signing

Source: https://reactnative.dev/docs/0.77/signed-apk-android

Sets up global Gradle variables for React Native Android app signing configuration. These variables store the keystore file path, alias, and passwords, and should be placed in ~/.gradle/gradle.properties to prevent git commits. Replace asterisks with actual keystore and key passwords.

```gradle
MYAPP_UPLOAD_STORE_FILE=my-upload-key.keystore
MYAPP_UPLOAD_KEY_ALIAS=my-key-alias
MYAPP_UPLOAD_STORE_PASSWORD=*****
MYAPP_UPLOAD_KEY_PASSWORD=*****
```

--------------------------------

### resetAnimation() Method

Source: https://reactnative.dev/docs/0.79/animatedvaluexy

Stops any running animation and resets the ValueXY to its original starting values. The optional callback receives the reset value, allowing you to handle state updates after the reset.

```APIDOC
## resetAnimation()

### Description
Stops any animation and resets the value to its original state.

### Method Signature
```typescript
resetAnimation(callback?: (value: {x: number; y: number}) => void): void;
```

### Parameters
- **callback** (function) - Optional - A function that will receive the original value as an object with `x` and `y` properties.

### Usage Example
```typescript
this.state.anim.resetAnimation((resetValue) => {
  console.log('Animation reset to:', resetValue);
});
```
```

--------------------------------

### Register Native Package in MainApplication - Kotlin

Source: https://reactnative.dev/docs/0.77/turbo-native-modules-introduction

Registers the NativeLocalStoragePackage in the React Native application using Kotlin syntax. Extends Application and ReactApplication, configuring the ReactNativeHost to include the native package in its package list. Sets up the React application environment with support for New Architecture, developer tools, and Hermes engine initialization.

```kotlin
package com.inappmodule

import android.app.Application
import com.facebook.react.PackageList
import com.facebook.react.ReactApplication
import com.facebook.react.ReactHost
import com.facebook.react.ReactNativeHost
import com.facebook.react.ReactPackage
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint.load
import com.facebook.react.defaults.DefaultReactHost.getDefaultReactHost
import com.facebook.react.defaults.DefaultReactNativeHost
import com.facebook.soloader.SoLoader
import com.nativelocalstorage.NativeLocalStoragePackage

class MainApplication : Application(), ReactApplication {

  override val reactNativeHost: ReactNativeHost
```

--------------------------------

### Initialize React Native Project with CLI

Source: https://reactnative.dev/docs/next/the-new-architecture/using-codegen

Creates a new React Native project using the official CLI. This project is required as a foundation for properly generating Codegen code, since the Codegen process is tightly coupled with the app build. The command initializes the latest version of React Native.

```shell
npx @react-native-community/cli@latest init SampleApp --version latest
```

--------------------------------

### Example React Native ViewToken Object Structure

Source: https://reactnative.dev/docs/0.77/viewtoken

Demonstrates the structure of a `ViewToken` object, which provides information about a list item's viewability and its associated data. This object is typically received within the `onViewableItemsChanged` callback of list components.

```json
{
  "item": {"key": "key-12"},
  "key": "key-12",
  "index": 11,
  "isViewable": true
}
```

--------------------------------

### Basic Button Component with Props

Source: https://reactnative.dev/docs/0.77/button

Creates a basic button with an onPress handler, title text, custom color, and accessibility label. This example demonstrates the minimal required props for rendering a functional button component that works across iOS and Android platforms.

```jsx
<Button
  onPress={onPressLearnMore}
  title="Learn More"
  color="#841584"
  accessibilityLabel="Learn more about this purple button"
/>
```

--------------------------------

### Get Scroll Responder in React Native

Source: https://reactnative.dev/docs/flatlist

This method returns a handle to the underlying scroll responder. The `ScrollResponderMixin` provides a set of methods for handling various scroll events and behaviors within a scrollable component.

```tsx
getScrollResponder(): ScrollResponderMixin;
```

--------------------------------

### Extend ReactActivity in Java and Kotlin

Source: https://reactnative.dev/docs/0.78/integration-with-existing-apps

Create a new Activity that extends ReactActivity to host React Native code and manage the React Native runtime. The activity implements getMainComponentName() to specify the root component and createReactActivityDelegate() to configure the React Native environment with the new architecture support.

```java
// package <your-package-here>;

import com.facebook.react.ReactActivity;
import com.facebook.react.ReactActivityDelegate;
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint;
import com.facebook.react.defaults.DefaultReactActivityDelegate;

public class MyReactActivity extends ReactActivity {

    @Override
    protected String getMainComponentName() {
        return "HelloWorld";
    }

    @Override
    protected ReactActivityDelegate createReactActivityDelegate() {
        return new DefaultReactActivityDelegate(this, getMainComponentName(), DefaultNewArchitectureEntryPoint.getFabricEnabled());
    }
}
```

```kotlin
// package <your-package-here>

import com.facebook.react.ReactActivity
import com.facebook.react.ReactActivityDelegate
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint.fabricEnabled
import com.facebook.react.defaults.DefaultReactActivityDelegate

class MyReactActivity : ReactActivity() {

    override fun getMainComponentName(): String = "HelloWorld"

    override fun createReactActivityDelegate(): ReactActivityDelegate =
        DefaultReactActivityDelegate(this, mainComponentName, fabricEnabled)
}
```

--------------------------------

### Define React Native Module Package and Info (Android Java/Kotlin)

Source: https://reactnative.dev/docs/next/turbo-native-modules-introduction_platforms=ios

This code demonstrates how to create a React Native package on Android, either in Java or Kotlin. It involves extending `BaseReactPackage` and overriding methods to provide the native module instance and its metadata (`ReactModuleInfo`), which is crucial for React Native's module discovery and integration.

```java
      public Map<String, ReactModuleInfo> getReactModuleInfos() {  
        Map<String, ReactModuleInfo> map = new HashMap<>();  
        map.put(NativeLocalStorageModule.NAME, new ReactModuleInfo(  
          NativeLocalStorageModule.NAME,       // name  
          NativeLocalStorageModule.NAME,       // className  
          false, // canOverrideExistingModule  
          false, // needsEagerInit  
          false, // isCXXModule  
          true   // isTurboModule  
        ));  
        return map;  
      }  
    };
```

```kotlin
package com.nativelocalstorage  
  
import com.facebook.react.BaseReactPackage  
import com.facebook.react.bridge.NativeModule  
import com.facebook.react.bridge.ReactApplicationContext  
import com.facebook.react.module.model.ReactModuleInfo  
import com.facebook.react.module.model.ReactModuleInfoProvider  
  
class NativeLocalStoragePackage : BaseReactPackage() {  
  
  override fun getModule(name: String, reactContext: ReactApplicationContext): NativeModule? =  
    if (name == NativeLocalStorageModule.NAME) {  
      NativeLocalStorageModule(reactContext)  
    } else {  
      null  
    }  
  
  override fun getReactModuleInfoProvider() = ReactModuleInfoProvider {  
    mapOf(  
      NativeLocalStorageModule.NAME to ReactModuleInfo(  
        name = NativeLocalStorageModule.NAME,  
        className = NativeLocalStorageModule.NAME,  
        canOverrideExistingModule = false,  
        needsEagerInit = false,  
        isCxxModule = false,  
        isTurboModule = true  
      )  
    )  
  }
}
```

--------------------------------

### Create ReactPackage Implementation - Android Java/Kotlin

Source: https://reactnative.dev/docs/0.78/legacy/native-modules-android

Implements ReactPackage interface to register native modules. The createNativeModules() method instantiates and returns native modules as a list. This example shows MyAppPackage registering CalendarModule. Java uses List<NativeModule> while Kotlin uses MutableList<NativeModule> for return types.

```java
package com.your-app-name;
import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.ViewManager;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MyAppPackage implements ReactPackage {

   @Override
   public List<ViewManager> createViewManagers(ReactApplicationContext reactContext) {
       return Collections.emptyList();
   }

   @Override
   public List<NativeModule> createNativeModules(
           ReactApplicationContext reactContext) {
       List<NativeModule> modules = new ArrayList<>();
       modules.add(new CalendarModule(reactContext));
       return modules;
   }
}
```

```kotlin
package com.your-app-name

import android.view.View
import com.facebook.react.ReactPackage
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.ReactShadowNode
import com.facebook.react.uimanager.ViewManager

class MyAppPackage : ReactPackage {

    override fun createViewManagers(
        reactContext: ReactApplicationContext
    ): MutableList<ViewManager<View, ReactShadowNode<*>>> = mutableListOf()

    override fun createNativeModules(
        reactContext: ReactApplicationContext
    ): MutableList<NativeModule> = listOf(CalendarModule(reactContext)).toMutableList()
}
```

--------------------------------

### quad() - Quadratic Easing Function

Source: https://reactnative.dev/docs/0.78/easing

A quadratic easing function where f(t) = t * t. Position equals the square of elapsed time, providing accelerating animation that starts slow and speeds up.

```TypeScript
static quad(t: number);
```

--------------------------------

### Displaying Various Image Sources in React Native

Source: https://reactnative.dev/docs/0.77/image

This example demonstrates how to use the `Image` component in React Native to display images from different sources: local static assets (using `require`), network URLs, and base64 encoded data URIs. It utilizes `SafeAreaView` and `StyleSheet` for layout and styling, noting that dimensions must be manually specified for network and data images.

```javascript
import React from 'react';
import {Image, StyleSheet} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  tinyLogo: {
    width: 50,
    height: 50,
  },
  logo: {
    width: 66,
    height: 58,
  },
});

const DisplayAnImage = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <Image
        style={styles.tinyLogo}
        source={require('@expo/snack-static/react-native-logo.png')}
      />
      <Image
        style={styles.tinyLogo}
        source={{
          uri: 'https://reactnative.dev/img/tiny_logo.png',
        }}
      />
      <Image
        style={styles.logo}
        source={{
          uri: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADMAAAAzCAYAAAA6oTAqAAAAEXRFWHRTb2Z0d2FyZQBwbmdjcnVzaEB1SfMAAABQSURBVGje7dSxCQBACARB+2/ab8BEeQNhFi6WSYzYLYudDQYGBgYGBgYGBgYGBgYGBgZmcvDqYGBgmhivGQYGBgYGBgYGBgYGBgYGBgbmQw+P/eMrC5UTVAAAAABJRU5ErkJggg==',
        }}
      />
    </SafeAreaView>
  </SafeAreaProvider>
);

export default DisplayAnImage;
```

--------------------------------

### Configure Babel to Remove Console Statements

Source: https://reactnative.dev/docs/0.77/performance

Configure the Babel transpiler to automatically strip all console.* calls from production builds using the transform-remove-console plugin. This eliminates JavaScript thread bottlenecks caused by console logging. Install the plugin via npm and modify .babelrc to apply it only in production environments.

```json
{
  "env": {
    "production": {
      "plugins": ["transform-remove-console"]
    }
  }
}
```

--------------------------------

### Pass Initial Properties from Native to React Native

Source: https://reactnative.dev/docs/0.78/communication-android

Demonstrates how to pass initial properties (props) from a native Android activity (Java or Kotlin) to a React Native application upon launch. This is achieved by overriding `getLaunchOptions` in a custom `ReactActivityDelegate` and returning a `Bundle` with the desired data. The React Native component then accesses these properties via `this.props`.

```java
public class MainActivity extends ReactActivity {  
  @Override  
  protected ReactActivityDelegate createReactActivityDelegate() {  
    return new ReactActivityDelegate(this, getMainComponentName()) {  
      @Override  
      protected Bundle getLaunchOptions() {  
        Bundle initialProperties = new Bundle();  
        ArrayList<String> imageList = new ArrayList<String>(Arrays.asList(  
                "https://dummyimage.com/600x400/ffffff/000000.png",  
                "https://dummyimage.com/600x400/000000/ffffff.png"  
        ));  
        initialProperties.putStringArrayList("images", imageList);  
        return initialProperties;  
      }  
    };  
  }  
}  

```

```kotlin
class MainActivity : ReactActivity() {  
    override fun createReactActivityDelegate(): ReactActivityDelegate {  
        return object : ReactActivityDelegate(this, mainComponentName) {  
            override fun getLaunchOptions(): Bundle {  
                val imageList = arrayListOf("https://dummyimage.com/600x400/ffffff/000000.png", "https://dummyimage.com/600x400/000000/ffffff.png")  
                val initialProperties = Bundle().apply { putStringArrayList("images", imageList) }  
                return initialProperties  
            }  
        }  
    }  
}  

```

```tsx
import React from 'react';  
import {View, Image} from 'react-native';  
  
export default class ImageBrowserApp extends React.Component {  
  renderImage(imgURI) {  
    return <Image source={{uri: imgURI}} />;  
  }  
  render() {  
    return <View>{this.props.images.map(this.renderImage)}</View>;  
  }  
}  

```

--------------------------------

### Web CSS Font Style Inheritance Example

Source: https://reactnative.dev/docs/0.77/text

This CSS snippet demonstrates a common web pattern for applying default font styles (family, size, color) to an entire document, where child elements automatically inherit these properties. This is presented to highlight the contrast with React Native's more limited text style inheritance model.

```css
html {  
  font-family:  
    'lucida grande', tahoma, verdana, arial, sans-serif;  
  font-size: 11px;  
  color: #141823;  
}  
```

--------------------------------

### Apply Multiple Rotation Transforms in React Native

Source: https://reactnative.dev/docs/0.77/transforms

These examples illustrate two methods for applying multiple rotation transformations in React Native. It shows how to use an array of transformation objects for `rotateX` and `rotateZ`, and an alternative using a space-separated string for the same effect. Rotation values can be specified in degrees (`deg`) or radians (`rad`).

```javascript
{
  transform: [{rotateX: '45deg'}, {rotateZ: '0.785398rad'}],
}
```

```javascript
{
  transform: 'rotateX(45deg) rotateZ(0.785398rad)',
}
```

--------------------------------

### Create Watchman Configuration - .watchmanconfig

Source: https://reactnative.dev/docs/0.78/integration-with-existing-apps

Creates a .watchmanconfig file in the project root containing an empty JSON object. Watchman monitors file system changes to enable hot reloading and efficient rebuilds during React Native development.

```Shell
echo {} > .watchmanconfig
```

--------------------------------

### Set up RCTEventEmitter for Native Module Events (Objective-C Header)

Source: https://reactnative.dev/docs/0.80/legacy/native-modules-ios

This Objective-C header file defines a native module `CalendarModule` that subclasses `RCTEventEmitter` and conforms to `RCTBridgeModule`. This setup is crucial for enabling the module to send events from native code to JavaScript.

```objectivec
//  CalendarModule.h  
  
#import <React/RCTBridgeModule.h>  
#import <React/RCTEventEmitter.h>  
  
@interface CalendarModule : RCTEventEmitter <RCTBridgeModule>  
@end  
```

--------------------------------

### Apply ECMAScript 2015 Destructuring Assignment in JavaScript

Source: https://reactnative.dev/docs/0.77/javascript-environment

Shows object destructuring, a convenient way to extract values from data stored in objects into distinct variables. This example extracts `isActive` and `style` from `this.props`.

```JavaScript
const {isActive, style} = this.props;
```

--------------------------------

### Basic SectionList Implementation in React Native

Source: https://reactnative.dev/docs/0.77/sectionlist

This example demonstrates how to use the `SectionList` component in a React Native application to display categorized data. It initializes a `DATA` array containing sections with titles and associated data items, then uses `renderItem` to render each item and `renderSectionHeader` to display the section titles. The component is wrapped in `SafeAreaView` and `SafeAreaProvider` for proper layout, and includes basic styling using `StyleSheet`.

```javascript
import React from 'react';
import {StyleSheet, Text, View, SectionList, StatusBar} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const DATA = [
  {
    title: 'Main dishes',
    data: ['Pizza', 'Burger', 'Risotto'],
  },
  {
    title: 'Sides',
    data: ['French Fries', 'Onion Rings', 'Fried Shrimps'],
  },
  {
    title: 'Drinks',
    data: ['Water', 'Coke', 'Beer'],
  },
  {
    title: 'Desserts',
    data: ['Cheese Cake', 'Ice Cream'],
  },
];

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container} edges={['top']}>
      <SectionList
        sections={DATA}
        keyExtractor={(item, index) => item + index}
        renderItem={({item}) => (
          <View style={styles.item}>
            <Text style={styles.title}>{item}</Text>
          </View>
        )}
        renderSectionHeader={({section: {title}}) => (
          <Text style={styles.header}>{title}</Text>
        )}
      />
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: StatusBar.currentHeight,
    marginHorizontal: 16,
  },
  item: {
    backgroundColor: '#f9c2ff',
    padding: 20,
    marginVertical: 8,
  },
  header: {
    fontSize: 32,
    backgroundColor: '#fff',
  },
  title: {
    fontSize: 24,
  },
});

export default App;
```

--------------------------------

### Implement RCTWebView Component in Objective-C++

Source: https://reactnative.dev/docs/0.80/fabric-native-components-introduction

Implementation file that initializes WKWebView, manages prop updates, handles layout, and implements navigation delegate methods for web view events. Uses Objective-C++ syntax to combine C++ and Objective-C, including Facebook React namespace and WebKit framework integration.

```Objective-C++
#import "RCTWebView.h"

#import <react/renderer/components/AppSpec/ComponentDescriptors.h>
#import <react/renderer/components/AppSpec/EventEmitters.h>
#import <react/renderer/components/AppSpec/Props.h>
#import <react/renderer/components/AppSpec/RCTComponentViewHelpers.h>
#import <WebKit/WebKit.h>

using namespace facebook::react;

@interface RCTWebView () <RCTCustomWebViewViewProtocol, WKNavigationDelegate>
@end

@implementation RCTWebView {
  NSURL * _sourceURL;
  WKWebView * _webView;
}

-(instancetype)init
{
  if(self = [super init]) {
    _webView = [WKWebView new];
    _webView.navigationDelegate = self;
    [self addSubview:_webView];
  }
  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &oldViewProps = *std::static_pointer_cast<CustomWebViewProps const>(_props);
  const auto &newViewProps = *std::static_pointer_cast<CustomWebViewProps const>(props);

  // Handle your props here
  if (oldViewProps.sourceURL != newViewProps.sourceURL) {
    NSString *urlString = [NSString stringWithCString:newViewProps.sourceURL.c_str() encoding:NSUTF8StringEncoding];
    _sourceURL = [NSURL URLWithString:urlString];
    if ([self urlIsValid:newViewProps.sourceURL]) {
      [_webView loadRequest:[NSURLRequest requestWithURL:_sourceURL]];
    }
  }

  [super updateProps:props oldProps:oldProps];
}

-(void)layoutSubviews
{
  [super layoutSubviews];
  _webView.frame = self.bounds;

}

#pragma mark - WKNavigationDelegate

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
  CustomWebViewEventEmitter::OnScriptLoaded result = CustomWebViewEventEmitter::OnScriptLoaded{CustomWebViewEventEmitter::OnScriptLoadedResult::Success};
  self.eventEmitter.onScriptLoaded(result);
}

- (BOOL)urlIsValid:(std::string)propString
{
  if (propString.length() > 0 && !_sourceURL) {
    CustomWebViewEventEmitter::OnScriptLoaded result = CustomWebViewEventEmitter::OnScriptLoaded{CustomWebViewEventEmitter::OnScriptLoadedResult::Error};

    self.eventEmitter.onScriptLoaded(result);
    return NO;
  }
  return YES;
}

// Event emitter convenience method
- (const CustomWebViewEventEmitter &)eventEmitter
{
  return static_cast<const CustomWebViewEventEmitter &>(*_eventEmitter);
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<CustomWebViewComponentDescriptor>();
}

@end
```

--------------------------------

### Execute React Native iOS Codegen Script and View Options

Source: https://reactnative.dev/docs/0.79/the-new-architecture/using-codegen

This snippet demonstrates how to run the `generate-codegen-artifacts.js` script to generate Codegen artifacts for React Native. It also lists the available command-line options, including `--path`, `--targetPlatform`, and `--outputPath`, which are crucial for configuring the script's execution.

```bash
node node_modules/react-native/scripts/generate-codegen-artifacts.js  
  
Usage: generate-codegen-artifacts.js -p [path to app] -t [target platform] -o [output path]  
  
Options:  
      --help            Show help                                      [boolean]  
      --version         Show version number                            [boolean]  
  -p, --path            Path to the React Native project root.        [required]  
  -t, --targetPlatform  Target platform. Supported values: "android", "ios",  
                        "all".                                        [required]  
  -o, --outputPath      Path where generated artifacts will be output to.
```

--------------------------------

### Get recommended accessibility timeout in React Native (Android TSX)

Source: https://reactnative.dev/docs/0.77/accessibilityinfo

Retrieves the user-configured accessibility timeout in milliseconds from Android's 'Accessibility' settings. If the setting is not configured, it returns the provided `originalTimeout` value as a fallback.

```tsx
static getRecommendedTimeoutMillis(originalTimeout: number): Promise<number>;
```

--------------------------------

### Build React Native Application in Release Mode

Source: https://reactnative.dev/docs/0.81/hermes

These shell commands demonstrate how to build a React Native application for both Android and iOS platforms in release mode, using either npm or Yarn. Building in release mode compiles JavaScript to Hermes Bytecode, which significantly improves the app's startup speed on devices.

```shell
npm run android -- --mode="release"
```

```shell
yarn android --mode release
```

```shell
npm run ios -- --mode="Release"
```

```shell
yarn ios --mode Release
```

--------------------------------

### back() - Back Animation Effect

Source: https://reactnative.dev/docs/0.78/easing

Creates a basic effect where the object animates back slightly as the animation starts. Use with Animated.parallel() to create anticipatory motion in React Native animations.

```TypeScript
static back(s);
```

--------------------------------

### Platform select() with Native Components - React Native

Source: https://reactnative.dev/docs/0.77/platform

Demonstrates using Platform.select() to conditionally require and render platform-specific components. Shows syntax for iOS and Android-specific component loading.

```typescript
const Component = Platform.select({
  ios: () => require('ComponentIOS'),
  android: () => require('ComponentAndroid'),
})();

<Component />;
```

--------------------------------

### Cancel Vibration - React Native

Source: https://reactnative.dev/docs/0.77/vibration

Stops an ongoing vibration that was started with `vibrate()` method when repetition is enabled. This static method takes no parameters and is used to halt looping vibration patterns.

```typescript
static cancel();
```

--------------------------------

### React Native Local Library Directory Structure

Source: https://reactnative.dev/docs/0.79/legacy/local-library-setup

This plaintext code block illustrates the recommended directory structure for a React Native project that incorporates local libraries. Local libraries are housed within a 'modules' folder, distinct from the `android/` and `ios/` directories, which simplifies future React Native upgrades and enhances project portability.

```plaintext
MyApp  
├── node_modules  
├── modules <-- folder for your local libraries  
│ └── awesome-module <-- your local library  
├── android  
├── ios  
├── src  
├── index.js  
└── package.json
```

--------------------------------

### Handle errors with separate success and failure callbacks in React Native

Source: https://reactnative.dev/docs/legacy/native-modules-android

This example demonstrates an alternative error handling approach using two distinct callbacks: one for success and one for failure. This provides explicit separation of success and error paths in both the native module definition and the JavaScript call.

```java
@ReactMethod
public void createCalendarEvent(String name, String location, Callback myFailureCallback, Callback mySuccessCallback) {
}
```

```kotlin
@ReactMethod
  fun createCalendarEvent(
      name: String,
      location: String,
      myFailureCallback: Callback,
      mySuccessCallback: Callback
  ) {}
```

```tsx
const onPress = () => {
  CalendarModule.createCalendarEvent(
    'testName',
    'testLocation',
    error => {
      console.error(`Error found! ${error}`);
    },
    eventId => {
      console.log(`event id ${eventId} returned`);
    },
  );
};
```

--------------------------------

### Load Android Drawable Resources by Name in React Native

Source: https://reactnative.dev/docs/0.79/images

This example shows how to load drawable resources that are placed in the Android `res/drawable` folder by referencing their name (without extension) via the `uri` property in the `source` object. This method requires the Android application to be rebuilt if the asset's name or directory changes.

```tsx
<Image  
  source={{uri: 'my_icon'}}  
  style={{width: 40, height: 40}}
/>
```

--------------------------------

### Define an unoptimized, computationally expensive React Native component

Source: https://reactnative.dev/docs/0.77/optimizing-javascript-loading

This component serves as a hypothetical example of a module that is expensive to load due to its complexity or dependencies. It is used to demonstrate scenarios where optimization techniques would be beneficial to defer its loading until needed.

```tsx
import {Component} from 'react';  
import {Text} from 'react-native';  
// ... import some very expensive modules  
  
export default function VeryExpensive() {  
  // ... lots and lots of rendering logic  
  return <Text>Very Expensive Component</Text>;  
}
```

--------------------------------

### Open iOS Xcode Workspace for Project Configuration

Source: https://reactnative.dev/docs/0.79/the-new-architecture/pure-cxx-modules

This command sequence allows developers to navigate to the `ios` directory and open the generated Xcode Workspace for the React Native application. Opening the workspace is a prerequisite for making further configurations, such as adding shared folders to the iOS project for C++ module visibility.

```bash
cd ios  
open SampleApp.xcworkspace
```

--------------------------------

### Get Native Scroll Reference in React Native

Source: https://reactnative.dev/docs/flatlist

This method provides a direct reference to the underlying native scroll component. It returns an `ElementRef` type specific to `ScrollViewComponent`, which can be useful for direct manipulation or integration with native modules.

```tsx
getNativeScrollRef(): React.ElementRef<typeof ScrollViewComponent>;
```

--------------------------------

### Configure iOS Native View with React Native Initial Props

Source: https://reactnative.dev/docs/0.80/integration-with-existing-apps

These snippets demonstrate how to modify `ReactViewController` in both Objective-C and Swift to pass an `initialProperties` dictionary to a React Native `HelloWorld` module. This allows the React Native application to receive crucial initial data, such as `userID` and `token`, directly from the native iOS environment.

```Objective-C
 - (void)viewDidLoad {  
   [super viewDidLoad];  
   // Do any additional setup after loading the view.  
  
   _factoryDelegate = [ReactNativeFactoryDelegate new];  
   _factoryDelegate.dependencyProvider = [RCTAppDependencyProvider new];  
   _factory = [[RCTReactNativeFactory alloc] initWithDelegate:_factoryDelegate];  
-  self.view = [_factory.rootViewFactory viewWithModuleName:@"HelloWorld"];  
+  self.view = [_factory.rootViewFactory viewWithModuleName:@"HelloWorld" initialProperties:@{  
+    @"userID": @"12345678",  
+    @"token": @"secretToken"  
+  }];  
}
```

```Swift
  override func viewDidLoad() {  
    super.viewDidLoad()  
    reactNativeFactoryDelegate = ReactNativeDelegate()  
    reactNativeFactoryDelegate!.dependencyProvider = RCTAppDependencyProvider()  
    reactNativeFactory = RCTReactNativeFactory(delegate: reactNativeFactoryDelegate!)  
-   view = reactNativeFactory!.rootViewFactory.view(withModuleName: "HelloWorld")  
+   view = reactNativeFactory!.rootViewFactory.view(withModuleName: "HelloWorld" initialProperties: [  
+     "userID": "12345678",  
+     "token": "secretToken"  
+])  
  
  }
}
```

--------------------------------

### Get CSS translate transform from Animated.ValueXY in TypeScript/TSX

Source: https://reactnative.dev/docs/animatedvaluexy

Converts the `{x, y}` components of Animated.ValueXY into a format suitable for a CSS `transform` array, specifically for `translateX` and `translateY`. This allows for easily applying 2D translations in animated styles.

```tsx
getTranslateTransform(): [
  {translateX: Animated.Value},
  {translateY: Animated.Value},
];
```

--------------------------------

### GET Dimensions.window

Source: https://reactnative.dev/docs/0.81/dimensions

Retrieves the size of the visible Application window. Returns a ScaledSize object containing width, height, scale, and fontScale properties that represent the current application window dimensions.

```APIDOC
## GET Dimensions.window

### Description
Returns the size of the visible Application window including width, height, device scale, and font scale factors.

### Method
GET

### Endpoint
Dimensions.get('window')

### Response
#### Success Response (200)
- **width** (number) - Width of the application window in pixels
- **height** (number) - Height of the application window in pixels
- **scale** (number) - Scale factor of the device display
- **fontScale** (number) - Font scale factor for text rendering

### Response Example
{
  "width": 375,
  "height": 812,
  "scale": 3,
  "fontScale": 1.0
}
```

--------------------------------

### Referencing Specific Native Views with React `ref`s in React Native

Source: https://reactnative.dev/docs/0.77/legacy/native-components-ios

This example demonstrates how to assign unique React `ref`s to individual instances of `MyNativeView`. By holding references to each component, the application can precisely invoke methods on a specific native view, such as `callNativeMethod` on `myNativeReference`, resolving the ambiguity of targeting multiple instances.

```tsx
<View>  
  <MyNativeView ref={this.myNativeReference} />  
  <MyNativeView ref={this.myNativeReference2} />  
  <Button  
    onPress={() => {  
      this.myNativeReference.callNativeMethod();  
    }}  
  />  
</View>
```

--------------------------------

### React Native App with Event Subscription Setup

Source: https://reactnative.dev/docs/0.81/the-new-architecture/native-modules-custom-events

Complete App.tsx component that demonstrates event subscription management using React hooks. This includes importing EventSubscription type, using useRef for subscription tracking, and implementing proper cleanup in useEffect. The component manages key-value storage operations with event listener callbacks triggered from native code.

```TypeScript
import React from 'react';
import {
  Alert,
  EventSubscription,
  SafeAreaView,
  StyleSheet,
  Text,
  TextInput,
  Button,
} from 'react-native';

import NativeLocalStorage from './specs/NativeLocalStorage';

const EMPTY = '<empty>';

function App(): React.JSX.Element {
  const [value, setValue] = React.useState<string | null>(null);
  const [key, setKey] = React.useState<string | null>(null);
  const listenerSubscription = React.useRef<null | EventSubscription>(null);

  React.useEffect(() => {
    listenerSubscription.current = NativeLocalStorage?.onKeyAdded((pair) => Alert.alert(`New key added: ${pair.key} with value: ${pair.value}`));

    return () => {
      listenerSubscription.current?.remove();
      listenerSubscription.current = null;
    }
  }, [])

  const [editingValue, setEditingValue] = React.useState<
    string | null
  >(null);

  function saveValue() {
    if (key == null) {
      Alert.alert('Please enter a key');
      return;
    }
    NativeLocalStorage?.setItem(editingValue ?? EMPTY, key);
    setValue(editingValue);
  }

  function clearAll() {
    NativeLocalStorage?.clear();
    setValue('');
  }

  function deleteValue() {
    if (key == null) {
      Alert.alert('Please enter a key');
      return;
    }
    NativeLocalStorage?.removeItem(key);
    setValue('');
  }

  function retrieveValue() {
    if (key == null) {
      Alert.alert('Please enter a key');
      return;
    }
    const val = NativeLocalStorage?.getItem(key);
    setValue(val);
  }

  return (
    <SafeAreaView style={{flex: 1}}>
      <Text style={styles.text}>
        Current stored value is: {value ?? 'No Value'}
      </Text>
      <Text>Key:</Text>
      <TextInput
        placeholder="Enter the key you want to store"
        style={styles.textInput}
        onChangeText={setKey}
      />
      <Text>Value:</Text>
      <TextInput
        placeholder="Enter the text you want to store"
        style={styles.textInput}
        onChangeText={setEditingValue}
      />
      <Button title="Save" onPress={saveValue} />
      <Button title="Retrieve" onPress={retrieveValue} />
      <Button title="Delete" onPress={deleteValue} />
      <Button title="Clear" onPress={clearAll} />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  text: {
    margin: 10,
    fontSize: 20,
  },
  textInput: {
    margin: 10,
    height: 40,
    borderColor: 'black',
    borderWidth: 1,
    paddingLeft: 5,
    paddingRight: 5,
    borderRadius: 5,
  },
});

export default App;
```

--------------------------------

### getRecommendedTimeoutMillis() - Get Accessibility Timeout

Source: https://reactnative.dev/docs/0.79/accessibilityinfo

Retrieves the timeout in milliseconds that the user has configured in accessibility settings. This value comes from the 'Time to take action (Accessibility timeout)' setting on Android devices.

```APIDOC
## getRecommendedTimeoutMillis()

### Description
Gets the timeout in milliseconds that the user needs, as configured in the device's accessibility settings. This value is set in 'Time to take action (Accessibility timeout)' under Accessibility settings.

### Method
STATIC

### Endpoint
AccessibilityInfo.getRecommendedTimeoutMillis(originalTimeout)

### Platform
Android

### Parameters
#### Function Parameters
- **originalTimeout** (number) - Required - The default timeout value to return (in milliseconds) if the accessibility timeout setting is not configured

### Request Example
```tsx
static getRecommendedTimeoutMillis(originalTimeout: number): Promise<number>;
```

### Response
#### Success Response (Promise<number>)
- **timeout** (number) - The recommended timeout in milliseconds from accessibility settings, or the originalTimeout if not set

### Response Example
```tsx
AccessibilityInfo.getRecommendedTimeoutMillis(3000).then(timeout => {
  console.log(`Use timeout: ${timeout}ms`);
});
```
```

--------------------------------

### Implement InputAccessoryView for Custom Keyboard Toolbar in React Native

Source: https://reactnative.dev/docs/0.77/inputaccessoryview

This React Native example demonstrates how to use `InputAccessoryView` to create a custom keyboard accessory. It attaches a "Clear text" button above the software keyboard for a `TextInput`, allowing users to reset the input field. The `InputAccessoryView` is linked to the `TextInput` using a `nativeID`.

```javascript
import React, {useState} from 'react';
import {
  Button,
  InputAccessoryView,
  ScrollView,
  TextInput,
  StyleSheet,
} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const inputAccessoryViewID = 'uniqueID';
const initialText = '';

const App = () => {
  const [text, setText] = useState(initialText);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <ScrollView keyboardDismissMode="interactive">
          <TextInput
            style={styles.textInput}
            inputAccessoryViewID={inputAccessoryViewID}
            onChangeText={setText}
            value={text}
            placeholder={'Please type here…'}
          />
        </ScrollView>
      </SafeAreaView>
      <InputAccessoryView nativeID={inputAccessoryViewID}>
        <Button onPress={() => setText(initialText)} title="Clear text" />
      </InputAccessoryView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: 20,
  },
  textInput: {
    padding: 16,
    borderColor: 'black',
    borderWidth: 1,
  },
});

export default App;
```

--------------------------------

### Configure Android Deep Links with Launch Mode

Source: https://reactnative.dev/docs/linking

Sets the MainActivity launch mode to 'singleTask' in AndroidManifest.xml to enable receiving intents in an existing MainActivity instance rather than creating a new one. This configuration is required for proper deep link handling on Android.

```xml
<activity
  android:name=".MainActivity"
  android:launchMode="singleTask">
```

--------------------------------

### Perform a POST request with custom headers and body using Fetch API in React Native

Source: https://reactnative.dev/docs/network

This example illustrates how to send a POST request with the Fetch API, including setting custom headers like "Accept" and "Content-Type", and sending a JSON-stringified body. It's essential for interacting with RESTful APIs that require specific data formats and authentication.

```tsx
fetch('https://mywebsite.com/endpoint/', {
  method: 'POST',
  headers: {
    Accept: 'application/json',
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    firstParam: 'yourValue',
    secondParam: 'yourOtherValue',
  }),
});
```

--------------------------------

### Get Keyboard Metrics in React Native

Source: https://reactnative.dev/docs/0.77/keyboard

The metrics method returns the dimensions and position metrics of the soft keyboard if it is currently visible. Returns a KeyboardMetrics object or undefined if the keyboard is not visible.

```typescript
static metrics(): KeyboardMetrics | undefined;
```

--------------------------------

### Initialize React Native Project for Turbo Modules

Source: https://reactnative.dev/docs/next/turbo-native-modules-introduction

This command initializes a new React Native project named 'TurboModuleExample' using the latest CLI version, which is a prerequisite for building Turbo Native Modules.

```shell
npx @react-native-community/cli@latest init TurboModuleExample --version latest
```

--------------------------------

### Pass Initial Properties from Native (Objective-C) to React Native Component

Source: https://reactnative.dev/docs/0.77/communication-ios

This example demonstrates how to initialize a React Native application embedded in an `RCTRootView` with properties passed from the native iOS side. An `NSDictionary` in Objective-C is converted into a JSON object, making the data accessible to the top-level React Native component upon its creation.

```objectivec
NSArray *imageList = @[@"https://dummyimage.com/600x400/ffffff/000000.png",  
                       @"https://dummyimage.com/600x400/000000/ffffff.png"];  
  
NSDictionary *props = @{@"images" : imageList};  
  
RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge  
                                                 moduleName:@"ImageBrowserApp"  
                                          initialProperties:props];
```

```tsx
import React from 'react';  
import {View, Image} from 'react-native';  
  
export default class ImageBrowserApp extends React.Component {  
  renderImage(imgURI) {  
    return <Image source={{uri: imgURI}} />;
  }  
  render() {  
    return <View>{this.props.images.map(this.renderImage)}</View>;  
  }  
}
```

--------------------------------

### Multi-Segment Interpolation with Dead Zones in React Native

Source: https://reactnative.dev/docs/animations

Demonstrates advanced interpolation with multiple range segments to create complex mappings including dead zones. This example creates a negation relationship with specific input-output mapping rules, useful for non-linear animations and custom animation curves.

```typescript
value.interpolate({
  inputRange: [-300, -100, 0, 100, 101],
  outputRange: [300, 0, 1, 0, 0],
});
```

--------------------------------

### Implement createViewInstance Method for React Native Android

Source: https://reactnative.dev/docs/0.77/legacy/native-components-android

This snippet shows the implementation of the `createViewInstance` method within a `ViewManager` subclass. This method is responsible for creating and initializing the custom native view (`ReactImageView` in this example) in its default state, using `ThemedReactContext` and `Fresco` for image handling.

```kotlin
  override fun createViewInstance(context: ThemedReactContext) =
      ReactImageView(context, Fresco.newDraweeControllerBuilder(), null, callerContext)  
```

```java
  @Override  
  public ReactImageView createViewInstance(ThemedReactContext context) {
    return new ReactImageView(context, Fresco.newDraweeControllerBuilder(), null, mCallerContext);
  }  
```

--------------------------------

### Configure ReactViewController to Load React Native Module in iOS (Objective-C & Swift)

Source: https://reactnative.dev/docs/0.79/integration-with-existing-apps

This snippet demonstrates how to modify or create a `ReactViewController` in both Objective-C and Swift to integrate and display a React Native module. It involves importing necessary React Native frameworks, initializing an `RCTReactNativeFactory` with a custom delegate, and setting the view controller's view to the React Native root view for a specified module (e.g., 'HelloWorld'). The custom delegate handles determining the correct JavaScript bundle URL for both debug and release builds.

```Objective-C
#import "ReactViewController.h"
#import <React/RCTBundleURLProvider.h>
#import <RCTReactNativeFactory.h>
#import <RCTDefaultReactNativeFactoryDelegate.h>
#import <RCTAppDependencyProvider.h>


@interface ReactViewController ()

@end

@interface ReactNativeFactoryDelegate: RCTDefaultReactNativeFactoryDelegate
@end

@implementation ReactViewController {
  RCTReactNativeFactory *_factory;
  id<RCTReactNativeFactoryDelegate> _factoryDelegate;
}

 - (void)viewDidLoad {
     [super viewDidLoad];
     // Do any additional setup after loading the view.
    _factoryDelegate = [ReactNativeFactoryDelegate new];
    _factoryDelegate.dependencyProvider = [RCTAppDependencyProvider new];
    _factory = [[RCTReactNativeFactory alloc] initWithDelegate:_factoryDelegate];
    self.view = [_factory.rootViewFactory viewWithModuleName:@"HelloWorld"];
 }

@end

@implementation ReactNativeFactoryDelegate

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
  return [self bundleURL];
}

- (NSURL *)bundleURL
{
#if DEBUG
  return [RCTBundleURLProvider.sharedSettings jsBundleURLForBundleRoot:@"index"];
#else
  return [NSBundle.mainBundle URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
```

```Swift
import UIKit
import React
import React_RCTAppDelegate
import ReactAppDependencyProvider

class ReactViewController: UIViewController {
  var reactNativeFactory: RCTReactNativeFactory?
  var reactNativeFactoryDelegate: RCTReactNativeFactoryDelegate?

  override func viewDidLoad() {
    super.viewDidLoad()
    reactNativeFactoryDelegate = ReactNativeDelegate()
    reactNativeFactoryDelegate!.dependencyProvider = RCTAppDependencyProvider()
    reactNativeFactory = RCTReactNativeFactory(delegate: reactNativeFactoryDelegate!)
    view = reactNativeFactory!.rootViewFactory.view(withModuleName: "HelloWorld")

  }
}

class ReactNativeDelegate: RCTDefaultReactNativeFactoryDelegate {
    override func sourceURL(for bridge: RCTBridge) -> URL? {
      self.bundleURL()
    }

    override func bundleURL() -> URL? {
      #if DEBUG
      RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index")
      #else
      Bundle.main.url(forResource: "main", withExtension: "jsbundle")
      #endif
    }

}
```

--------------------------------

### ease() - Basic Inertial Easing Function

Source: https://reactnative.dev/docs/0.78/easing

A basic inertial interaction easing function similar to an object slowly accelerating to speed. Commonly used for natural-looking animations that start slowly and speed up.

```TypeScript
static ease(t: number);
```

--------------------------------

### Implement various Touchable components in React Native

Source: https://reactnative.dev/docs/0.77/handling-touches

This code snippet demonstrates the implementation of different React Native touchable components, including TouchableHighlight, TouchableOpacity, TouchableNativeFeedback, and TouchableWithoutFeedback. It shows how to attach `onPress` and `onLongPress` event handlers to trigger alerts and also highlights the Android-specific `TouchableNativeFeedback` behavior. The example uses `StyleSheet` for basic styling.

```javascript
import React from 'react';
import {
  Alert,
  Platform,
  StyleSheet,
  Text,
  TouchableHighlight,
  TouchableOpacity,
  TouchableNativeFeedback,
  TouchableWithoutFeedback,
  View,
} from 'react-native';

const Touchables = () => {
  const onPressButton = () => {
    Alert.alert('You tapped the button!');
  };

  const onLongPressButton = () => {
    Alert.alert('You long-pressed the button!');
  };

  return (
    <View style={styles.container}>
      <TouchableHighlight onPress={onPressButton} underlayColor="white">
        <View style={styles.button}>
          <Text style={styles.buttonText}>TouchableHighlight</Text>
        </View>
      </TouchableHighlight>
      <TouchableOpacity onPress={onPressButton}>
        <View style={styles.button}>
          <Text style={styles.buttonText}>TouchableOpacity</Text>
        </View>
      </TouchableOpacity>
      <TouchableNativeFeedback
        onPress={onPressButton}
        background={
          Platform.OS === 'android'
            ? TouchableNativeFeedback.SelectableBackground()
            : undefined
        }>
        <View style={styles.button}>
          <Text style={styles.buttonText}>
            TouchableNativeFeedback{' '}
            {Platform.OS !== 'android' ? '(Android only)' : ''}
          </Text>
        </View>
      </TouchableNativeFeedback>
      <TouchableWithoutFeedback onPress={onPressButton}>
        <View style={styles.button}>
          <Text style={styles.buttonText}>TouchableWithoutFeedback</Text>
        </View>
      </TouchableWithoutFeedback>
      <TouchableHighlight
        onPress={onPressButton}
        onLongPress={onLongPressButton}
        underlayColor="white">
        <View style={styles.button}>
          <Text style={styles.buttonText}>Touchable with Long Press</Text>
        </View>
      </TouchableHighlight>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    paddingTop: 60,
    alignItems: 'center',
  },
  button: {
    marginBottom: 30,
    width: 260,
    alignItems: 'center',
    backgroundColor: '#2196F3',
  },
  buttonText: {
    textAlign: 'center',
    padding: 20,
    color: 'white',
  },
});

export default Touchables;
```

--------------------------------

### POST PermissionsAndroid.request()

Source: https://reactnative.dev/docs/0.79/permissionsandroid

Prompts the user to enable a specific permission and returns a promise with the result. Optionally displays a rationale dialog explaining why the permission is needed before showing the system permission dialog.

```APIDOC
## PermissionsAndroid.request()

### Description
Prompts the user to enable a permission and returns a promise resolving to a string value indicating whether the user allowed, denied the request, or does not want to be asked again. If a rationale is provided, it checks with the OS whether a dialog is necessary and displays the system permission dialog accordingly.

### Method
POST (async)

### Signature
```
static request(
  permission: Permission,
  rationale?: Rationale
): Promise<PermissionStatus>;
```

### Parameters
#### Method Parameters
- **permission** (string) - Required - The permission to request. Must be a valid permission constant from PermissionsAndroid.PERMISSIONS.
- **rationale** (object) - Optional - An object containing dialog text and button labels to explain why the permission is needed.

#### Rationale Object
- **title** (string) - Required - The title of the permission dialog.
- **message** (string) - Required - The message explaining why the permission is needed.
- **buttonPositive** (string) - Required - The text label for the positive (allow) button.
- **buttonNegative** (string) - Optional - The text label for the negative (deny) button.
- **buttonNeutral** (string) - Optional - The text label for the neutral button.

### Request Example
```
const rationale = {
  title: 'Camera Permission',
  message: 'This app needs access to your camera to take photos',
  buttonPositive: 'Allow',
  buttonNegative: 'Deny',
  buttonNeutral: 'Ask Me Later'
};

const result = await PermissionsAndroid.request(
  PermissionsAndroid.PERMISSIONS.CAMERA,
  rationale
);
```

### Response
#### Success Response
- **string** - Returns one of: 'granted', 'denied', or 'never_ask_again' (use PermissionsAndroid.RESULTS constants)

#### Response Example
```
'granted'
```

### Usage Example
```
const result = await PermissionsAndroid.request(
  PermissionsAndroid.PERMISSIONS.CAMERA,
  {
    title: 'Camera Permission Required',
    message: 'We need access to your camera for video calls',
    buttonPositive: 'Allow',
    buttonNegative: 'Cancel'
  }
);

if (result === PermissionsAndroid.RESULTS.GRANTED) {
  console.log('Camera permission granted');
} else if (result === PermissionsAndroid.RESULTS.DENIED) {
  console.log('Camera permission denied');
} else if (result === PermissionsAndroid.RESULTS.NEVER_ASK_AGAIN) {
  console.log('User chose not to be asked again');
}
```
```

--------------------------------

### Create React Native Android ViewManager Subclass for Fragment Hosting (Kotlin & Java)

Source: https://reactnative.dev/docs/0.80/legacy/native-components-android

This snippet provides the implementation of a `ViewManager` subclass (`MyViewManager`) in both Kotlin and Java. It demonstrates how to create a `FrameLayout` as the host for a native Android Fragment, define custom commands (like 'create'), handle these commands to instantiate and replace a React Native view with a `Fragment`, and manage view properties like width and height using `@ReactPropGroup` for layout. The Kotlin version includes full layout setup and frame callback logic, while the Java snippet is a partial implementation.

```kotlin
// replace with your package  
package com.mypackage  
  
import android.view.Choreographer  
import android.view.View  
import android.view.ViewGroup  
import android.widget.FrameLayout  
import androidx.fragment.app.FragmentActivity  
import com.facebook.react.bridge.ReactApplicationContext  
import com.facebook.react.bridge.ReadableArray  
import com.facebook.react.uimanager.ThemedReactContext  
import com.facebook.react.uimanager.ViewGroupManager  
import com.facebook.react.uimanager.annotations.ReactPropGroup  
  
class MyViewManager(  
    private val reactContext: ReactApplicationContext  
) : ViewGroupManager<FrameLayout>() {  
  private var propWidth: Int? = null  
  private var propHeight: Int? = null  
  
  override fun getName() = REACT_CLASS  
  
  /**  
   * Return a FrameLayout which will later hold the Fragment  
   */  
  override fun createViewInstance(reactContext: ThemedReactContext) =  
      FrameLayout(reactContext)  
  
  /**  
   * Map the "create" command to an integer  
   */  
  override fun getCommandsMap() = mapOf("create" to COMMAND_CREATE)  
  
  /**  
   * Handle "create" command (called from JS) and call createFragment method  
   */  
  override fun receiveCommand(  
      root: FrameLayout,  
      commandId: String,  
      args: ReadableArray?  
  ) {  
    super.receiveCommand(root, commandId, args)  
    val reactNativeViewId = requireNotNull(args).getInt(0)  
  
    when (commandId.toInt()) {  
      COMMAND_CREATE -> createFragment(root, reactNativeViewId)  
    }  
  }
  
  @ReactPropGroup(names = ["width", "height"], customType = "Style")  
  fun setStyle(view: FrameLayout, index: Int, value: Int) {  
    if (index == 0) propWidth = value  
    if (index == 1) propHeight = value  
  }  
  
  /**  
   * Replace your React Native view with a custom fragment  
   */  
  fun createFragment(root: FrameLayout, reactNativeViewId: Int) {  
    val parentView = root.findViewById<ViewGroup>(reactNativeViewId)  
    setupLayout(parentView)  
  
    val myFragment = MyFragment()  
    val activity = reactContext.currentActivity as FragmentActivity  
    activity.supportFragmentManager  
        .beginTransaction()  
        .replace(reactNativeViewId, myFragment, reactNativeViewId.toString())  
        .commit()  
  }  
  
  fun setupLayout(view: View) {  
    Choreographer.getInstance().postFrameCallback(object: Choreographer.FrameCallback {  
      override fun doFrame(frameTimeNanos: Long) {  
        manuallyLayoutChildren(view)  
        view.viewTreeObserver.dispatchOnGlobalLayout()  
        Choreographer.getInstance().postFrameCallback(this)  
      }  
    })  
  }  
  
  /**  
   * Layout all children properly  
   */  
  private fun manuallyLayoutChildren(view: View) {  
    // propWidth and propHeight coming from react-native props  
    val width = requireNotNull(propWidth)  
    val height = requireNotNull(propHeight)  
  
    view.measure(  
        View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),  
        View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY))  
  
    view.layout(0, 0, width, height)  
  }  
  
  companion object {  
    private const val REACT_CLASS = "MyViewManager"  
    private const val COMMAND_CREATE = 1  
  }  
}
```

```java
// replace with your package  
package com.mypackage;  
  
import android.view.Choreographer;  
import android.view.View;  
import android.view.ViewGroup;  
import android.widget.FrameLayout;  
  
import androidx.annotation.NonNull;  
import androidx.annotation.Nullable;  
import androidx.fragment.app.FragmentActivity;  
  
import com.facebook.react.bridge.ReactApplicationContext;  
import com.facebook.react.bridge.ReadableArray;  
import com.facebook.react.common.MapBuilder;  
import com.facebook.react.uimanager.annotations.ReactProp;  
import com.facebook.react.uimanager.annotations.ReactPropGroup;  
import com.facebook.react.uimanager.ViewGroupManager;  
import com.facebook.react.uimanager.ThemedReactContext;  
  
import java.util.Map;  
  
public class MyViewManager extends ViewGroupManager<FrameLayout> {  
  
  public static final String REACT_CLASS = "MyViewManager";  
  public final int COMMAND_CREATE = 1;  
  private int propWidth;  
  private int propHeight;  
  
  ReactApplicationContext reactContext;  
  
  public MyViewManager(ReactApplicationContext reactContext) {  
    this.reactContext = reactContext;  
  }  
  
  @Override  
  public String getName() {  
    return REACT_CLASS;  
  }  
  
  /**  
   * Return a FrameLayout which will later hold the Fragment  
   */  
  @Override  
  public FrameLayout createViewInstance(ThemedReactContext reactContext) {  
    return new FrameLayout(reactContext);  
  }  
  
  /**  
   * Map the "create" command to an integer  
   */  
  @Nullable  
  @Override  
  public Map<String, Integer> getCommandsMap() {  
```

--------------------------------

### Create ViewController with React Native presentation button

Source: https://reactnative.dev/docs/0.77/integration-with-existing-apps

Implements a view controller with a button that presents a React Native view controller modally. The code creates a UIButton with styling and layout constraints, then handles the presentation of ReactViewController when tapped. Supports both Objective-C and Swift implementations.

```Objective-C
#import "ViewController.h"
#import "ReactViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
  ReactViewController *reactViewController;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = UIColor.systemBackgroundColor;
  UIButton *button = [UIButton new];
  [button setTitle:@"Open React Native" forState:UIControlStateNormal];
  [button setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
  [button setTitleColor:UIColor.blueColor forState:UIControlStateHighlighted];
  [button addTarget:self action:@selector(presentReactNative) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];

  button.translatesAutoresizingMaskIntoConstraints = NO;
  [NSLayoutConstraint activateConstraints:@[
    [button.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
    [button.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
    [button.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
    [button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor]
  ]];
}

- (void)presentReactNative
{
  if (reactViewController == NULL) {
    reactViewController = [ReactViewController new];
  }
  [self presentViewController:reactViewController animated:YES completion:nil];
}

@end
```

```Swift
import UIKit

class ViewController: UIViewController {

  var reactViewController: ReactViewController?

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .systemBackground

    let button = UIButton()
    button.setTitle("Open React Native", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    button.addAction(UIAction { [weak self] _ in
      guard let self else { return }
      if self.reactViewController == nil {
        self.reactViewController = ReactViewController()
      }
      self.present(self.reactViewController!, animated: true)
    }, for: .touchUpInside)
    self.view.addSubview(button)

    button.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
    ])
  }
}
```

--------------------------------

### ScrollView stickyHeaderIndices Property for Fixed Headers

Source: https://reactnative.dev/docs/scrollview

Accepts an array of child indices to fix specific children to the top during scrolling. For example, [0] fixes the first child, or [0,1,2] fixes multiple items. Not supported with horizontal={true} orientation.

```typescript
stickyHeaderIndices={[0]}
```

--------------------------------

### onStartShouldSetResponderCapture Handler - React Native

Source: https://reactnative.dev/docs/0.77/view

Callback function used by parent View to prevent child View from becoming responder on touch start. Returns true to intercept and capture the responder. Enables parent components to control touch event propagation to children.

```typescript
onStartShouldSetResponderCapture={({nativeEvent: PressEvent}) => boolean}
```

--------------------------------

### Displaying Nested and Interactive Text with Styling in React Native

Source: https://reactnative.dev/docs/0.79/text

This example demonstrates a functional React Native component using the `Text` component for displaying nested and interactive text. It showcases how parent styles (like `fontFamily`) are inherited by child `Text` elements, how child elements can add or override styles (like `fontSize`, `fontWeight`), and how touch handling (`onPress`) can be implemented on specific text parts. `useState` is used for dynamic content, and `StyleSheet` for defining component styles.

```javascript
import React, {useState} from 'react';
import {Text, StyleSheet} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const TextInANest = () => {
  const [titleText, setTitleText] = useState("Bird's Nest");
  const bodyText = 'This is not really a bird nest.';

  const onPressTitle = () => {
    setTitleText("Bird's Nest [pressed]");
  };

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Text style={styles.baseText}>
          <Text style={styles.titleText} onPress={onPressTitle}>
            {titleText}
            {' '}
            {' '}
          </Text>
          <Text numberOfLines={5}>{bodyText}</Text>
        </Text>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  baseText: {
    fontFamily: 'Cochin',
  },
  titleText: {
    fontSize: 20,
    fontWeight: 'bold',
  },
});

export default TextInANest;
```

--------------------------------

### Request Camera Permission in React Native for Android

Source: https://reactnative.dev/docs/0.79/permissionsandroid

This React Native example demonstrates how to request camera permission using `PermissionsAndroid.request`. It includes a custom rationale object to display messages to the user and handles the promise resolution, logging whether the permission was granted or denied. This is crucial for functionalities requiring access to sensitive device features on Android.

```javascript
import React from 'react';
import {
  Button,
  PermissionsAndroid,
  StatusBar,
  StyleSheet,
  Text,
} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const requestCameraPermission = async () => {
  try {
    const granted = await PermissionsAndroid.request(
      PermissionsAndroid.PERMISSIONS.CAMERA,
      {
        title: 'Cool Photo App Camera Permission',
        message:
          'Cool Photo App needs access to your camera ' +
          'so you can take awesome pictures.',
        buttonNeutral: 'Ask Me Later',
        buttonNegative: 'Cancel',
        buttonPositive: 'OK',
      },
    );
    if (granted === PermissionsAndroid.RESULTS.GRANTED) {
      console.log('You can use the camera');
    } else {
      console.log('Camera permission denied');
    }
  } catch (err) {
    console.warn(err);
  }
};

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <Text style={styles.item}>Try permissions</Text>
      <Button title="request permissions" onPress={requestCameraPermission} />
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingTop: StatusBar.currentHeight,
    backgroundColor: '#ecf0f1',
    padding: 8,
  },
  item: {
    margin: 24,
    fontSize: 18,
    fontWeight: 'bold',
    textAlign: 'center',
  },
});

export default App;
```

--------------------------------

### Display image to the left of TextInput (Android)

Source: https://reactnative.dev/docs/0.80/textinput

If specified, an image resource will be rendered on the left side of the text input. The image file must reside in `/android/app/src/main/res/drawable` and is referenced by its name, as shown in the example.

```jsx
<TextInput  inlineImageLeft='search_icon'/>
```

--------------------------------

### Monitor Dimension Changes with Event Listener in React Native

Source: https://reactnative.dev/docs/0.77/dimensions

Complete example demonstrating how to use Dimensions.addEventListener() to monitor and respond to window and screen dimension changes. Uses React hooks to manage state and properly cleanup subscriptions. Useful for foldable devices or responsive layouts.

```typescript
import React, {useState, useEffect} from 'react';
import {StyleSheet, Text, Dimensions} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const windowDimensions = Dimensions.get('window');
const screenDimensions = Dimensions.get('screen');

const App = () => {
  const [dimensions, setDimensions] = useState({
    window: windowDimensions,
    screen: screenDimensions,
  });

  useEffect(() => {
    const subscription = Dimensions.addEventListener(
      'change',
      ({window, screen}) => {
        setDimensions({window, screen});
      },
    );
    return () => subscription?.remove();
  });

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <Text style={styles.header}>Window Dimensions</Text>
        {Object.entries(dimensions.window).map(([key, value]) => (
          <Text>
            {key} - {value}
          </Text>
        ))}
        <Text style={styles.header}>Screen Dimensions</Text>
        {Object.entries(dimensions.screen).map(([key, value]) => (
          <Text>
            {key} - {value}
          </Text>
        ))}
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  header: {
    fontSize: 16,
    marginVertical: 10,
  },
});

export default App;
```

--------------------------------

### Configure Babel with module resolver for path aliases

Source: https://reactnative.dev/docs/typescript

This configuration snippet for your `babel.config.js` file adds the `module-resolver` plugin to Babel's processing. It specifies the root directory for alias resolution, lists relevant file extensions, and defines specific aliases like `tests` and `@components` to mirror the setup in `tsconfig.json`, enabling Babel to correctly resolve these module paths during transpilation.

```javascript
{
   presets: ['module:metro-react-native-babel-preset'],
   plugins: [
     [
        'module-resolver',
        {
          root: ['./src'],
          extensions: ['.ios.js', '.android.js', '.js', '.ts', '.tsx', '.json'],
          alias: {
            tests: ['./tests/'],
            "@components": "./src/components"
          }
        }
     ]
   ]
}
```

--------------------------------

### TypeScript Type Annotation Transformation in React Native

Source: https://reactnative.dev/docs/next/javascript-environment

Demonstrates the transformation of TypeScript type annotations by Babel in React Native. This allows developers to use TypeScript for static typing, enhancing code quality and maintainability, with types being stripped during compilation. The example shows a function with TypeScript type annotations for parameters and return type.

```typescript
function foo(x: {hello: true, target: 'react native!' }): string {};
```

--------------------------------

### Targeting Specific Native View Instances with React Refs

Source: https://reactnative.dev/docs/0.79/legacy/native-components-ios

This React Native JSX example shows how to use `ref`s to obtain a direct reference to each `MyNativeView` instance. This allows a `Button` component to specifically call a method on one of the `MyNativeView` instances, enabling targeted interactions.

```tsx
<View>
  <MyNativeView ref={this.myNativeReference} />
  <MyNativeView ref={this.myNativeReference2} />
  <Button
    onPress={() => {
      this.myNativeReference.callNativeMethod();
    }}
  />
</View>
```

--------------------------------

### Create Directory Structure for WebView Native Component

Source: https://reactnative.dev/docs/0.81/fabric-native-components-introduction

This command sets up the initial directory structure for a custom WebView native component within the 'Demo' project, creating dedicated folders for Codegen specifications, Android, and iOS native code.

```bash
mkdir -p Demo/{specs,android/app/src/main/java/com/webview}

```

--------------------------------

### GET Dimensions.screen

Source: https://reactnative.dev/docs/0.81/dimensions

Retrieves the size of the device's physical screen. Returns a ScaledSize object containing the total screen dimensions, scale, and font scale information independent of the application window.

```APIDOC
## GET Dimensions.screen

### Description
Returns the size of the device's physical screen including width, height, device scale, and font scale factors.

### Method
GET

### Endpoint
Dimensions.get('screen')

### Response
#### Success Response (200)
- **width** (number) - Width of the device screen in pixels
- **height** (number) - Height of the device screen in pixels
- **scale** (number) - Scale factor of the device display
- **fontScale** (number) - Font scale factor for text rendering

### Response Example
{
  "width": 375,
  "height": 812,
  "scale": 3,
  "fontScale": 1.0
}
```

--------------------------------

### Download Base OnLoad.cpp for C++ Module Registration

Source: https://reactnative.dev/docs/0.79/the-new-architecture/pure-cxx-modules

This command downloads the default `OnLoad.cpp` file from the React Native GitHub repository. This file serves as a base template that will later be modified to register custom C++ Turbo Native Modules within the Android application's runtime.

```shell
curl -O https://raw.githubusercontent.com/facebook/react-native/v0.79.0/packages/react-native/ReactAndroid/cmake-utils/default-app-setup/OnLoad.cpp
```

--------------------------------

### Register ReactWebViewPackage in MainApplication Kotlin

Source: https://reactnative.dev/docs/0.80/fabric-native-components-introduction

Registers the ReactWebViewPackage in the MainApplication class by importing the package and adding it to the list of packages returned by the getPackages() function. This enables the WebView native module to be available in the React Native application.

```kotlin
package com.demo

import android.app.Application
import com.facebook.react.PackageList
import com.facebook.react.ReactApplication
import com.facebook.react.ReactHost
import com.facebook.react.ReactNativeHost
import com.facebook.react.ReactPackage
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint.load
import com.facebook.react.defaults.DefaultReactHost.getDefaultReactHost
import com.facebook.react.defaults.DefaultReactNativeHost
import com.facebook.react.soloader.OpenSourceMergedSoMapping
import com.facebook.soloader.SoLoader
import com.webview.ReactWebViewPackage

class MainApplication : Application(), ReactApplication {

  override val reactNativeHost: ReactNativeHost =
      object : DefaultReactNativeHost(this) {
        override fun getPackages(): List<ReactPackage> =
            PackageList(this).packages.apply {
              add(ReactWebViewPackage())
            }

        override fun getJSMainModuleName(): String = "index"

        override fun getUseDeveloperSupport(): Boolean = BuildConfig.DEBUG

        override val isNewArchEnabled: Boolean = BuildConfig.IS_NEW_ARCHITECTURE_ENABLED
        override val isHermesEnabled: Boolean = BuildConfig.IS_HERMES_ENABLED
      }

  override val reactHost: ReactHost
    get() = getDefaultReactHost(applicationContext, reactNativeHost)

  override fun onCreate() {
    super.onCreate()
    SoLoader.init(this, OpenSourceMergedSoMapping)
    if (BuildConfig.IS_NEW_ARCHITECTURE_ENABLED) {
      load()
    }
  }
}
```

--------------------------------

### Get Scroll Responder Method TypeScript

Source: https://reactnative.dev/docs/0.78/virtualizedlist

Provides access to the underlying ScrollResponderMixin, which handles scroll gesture responses. Validates that the scroll reference implements the responder interface before returning. Returns ScrollResponderMixin or null.

```typescript
getScrollResponder () => ScrollResponderMixin | null;
```

--------------------------------

### Get React Module Info for TurboModule Registration

Source: https://reactnative.dev/docs/0.78/turbo-native-modules-introduction

Returns module metadata for React Native TurboModule registration. Configures module properties including name, class reference, and TurboModule flag to enable React Native's new architecture support.

```Java
public Map<String, ReactModuleInfo> getReactModuleInfos() {
  Map<String, ReactModuleInfo> map = new HashMap<>();
  map.put(NativeLocalStorageModule.NAME, new ReactModuleInfo(
    NativeLocalStorageModule.NAME,       // name
    NativeLocalStorageModule.NAME,       // className
    false, // canOverrideExistingModule
    false, // needsEagerInit
    false, // isCXXModule
    true   // isTurboModule
  ));
  return map;
}
```

```Kotlin
override fun getReactModuleInfoProvider() = ReactModuleInfoProvider {
  mapOf(
    NativeLocalStorageModule.NAME to ReactModuleInfo(
      name = NativeLocalStorageModule.NAME,
      className = NativeLocalStorageModule.NAME,
      canOverrideExistingModule = false,
      needsEagerInit = false,
      isCxxModule = false,
      isTurboModule = true
    )
  )
}
```

--------------------------------

### Open iOS Xcode Project Workspace

Source: https://reactnative.dev/docs/0.77/turbo-native-modules-introduction_language=typescript&platforms=ios

This bash command navigates into the `ios` directory of the React Native project and then opens the Xcode workspace. This action is necessary to configure and manage the iOS native module within the Xcode integrated development environment.

```bash
cd ios  
open TurboModuleExample.xcworkspace
```

--------------------------------

### TextInput placeholder and placeholderTextColor Properties

Source: https://reactnative.dev/docs/0.79/textinput

placeholder defines the text displayed before user input, while placeholderTextColor sets the color of the placeholder text. These properties help guide users on expected input format.

```javascript
placeholder="Enter text"
placeholderTextColor="#999999"
```

--------------------------------

### Configure React Native Codegen in package.json

Source: https://reactnative.dev/docs/0.77/the-new-architecture/create-module-library

This JSON configuration block, found in the `package.json` file, sets up Codegen for a React Native library. It defines the module name, type ('all'), source directory for JavaScript (`jsSrcsDir`), and output directories for generated code specific to iOS and Android platforms, including the Java package name for Android.

```json
"codegenConfig": {
  "name": "RN<your module name>Spec",
  "type": "all",
  "jsSrcsDir": "src",
  "outputDir": {
    "ios": "ios/generated",
    "android": "android/generated"
  },
  "android": {
    "javaPackageName": "com.<name-of-the-module>"
  }
}
```

--------------------------------

### snapToStart Property

Source: https://reactnative.dev/docs/0.79/scrollview

Controls whether the beginning of the list counts as a snap offset. Set to false to allow the list to scroll freely between its start and the first snapToOffsets offset. Used in conjunction with snapToOffsets.

```APIDOC
## snapToStart Property

### Description
Use in conjunction with `snapToOffsets`. By default, the beginning of the list counts as a snap offset. Set `snapToStart` to `false` to disable this behavior and allow the list to scroll freely between its start and the first `snapToOffsets` offset.

### Type
`bool`

### Default
`true`

### Example
```tsx
<ScrollView
  snapToOffsets={[100, 250, 400]}
  snapToStart={false}
>
  {/* Children */}
</ScrollView>
```
```

--------------------------------

### Define Styles with StyleSheet.create in React Native

Source: https://reactnative.dev/docs/0.77/style

This example demonstrates how to use `StyleSheet.create` to define and apply multiple styles to React Native `Text` components. It showcases style inheritance and precedence when an array of styles is passed to the `style` prop. The `container`, `bigBlue`, and `red` styles are defined and then applied to `View` and `Text` elements, illustrating how later styles in an array override previous ones.

```javascript
import React from 'react';
import {StyleSheet, Text, View} from 'react-native';

const LotsOfStyles = () => {
  return (
    <View style={styles.container}>
      <Text style={styles.red}>just red</Text>
      <Text style={styles.bigBlue}>just bigBlue</Text>
      <Text style={[styles.bigBlue, styles.red]}>bigBlue, then red</Text>
      <Text style={[styles.red, styles.bigBlue]}>red, then bigBlue</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    marginTop: 50,
  },
  bigBlue: {
    color: 'blue',
    fontWeight: 'bold',
    fontSize: 30,
  },
  red: {
    color: 'red',
  },
});

export default LotsOfStyles;
```

--------------------------------

### Create styled View components with React Native StyleSheet

Source: https://reactnative.dev/docs/0.77/view-style-props

Demonstrates how to create multiple styled View components using React Native's StyleSheet API with properties like flex, backgroundColor, borderWidth, and borderRadius. The example shows a layout with three colored boxes arranged vertically using SafeAreaView for safe area consideration. Requires react-native and react-native-safe-area-context packages.

```javascript
import React from 'react';
import {View, StyleSheet} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <View style={styles.top} />
      <View style={styles.middle} />
      <View style={styles.bottom} />
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'space-between',
    padding: 20,
    margin: 10,
  },
  top: {
    flex: 0.3,
    backgroundColor: 'grey',
    borderWidth: 5,
    borderTopLeftRadius: 20,
    borderTopRightRadius: 20,
  },
  middle: {
    flex: 0.3,
    backgroundColor: 'beige',
    borderWidth: 5,
  },
  bottom: {
    flex: 0.3,
    backgroundColor: 'pink',
    borderWidth: 5,
    borderBottomLeftRadius: 20,
    borderBottomRightRadius: 20,
  },
});

export default App;
```

--------------------------------

### Verify React Native Source Map Output Locations

Source: https://reactnative.dev/docs/next/debugging-release-builds

Examples of Metro build console output confirming the successful generation and specified file paths for React Native bundles and their corresponding source maps. This verification step ensures that source map generation is correctly configured for both Android and iOS builds.

```text
Writing bundle output to:, android/app/build/generated/assets/react/release/index.android.bundle  
Writing sourcemap output to:, android/app/build/intermediates/sourcemaps/react/release/index.android.bundle.packager.map  

```

```text
Writing bundle output to:, Build/Intermediates.noindex/ArchiveIntermediates/application/BuildProductsPath/Release-iphoneos/main.jsbundle  
Writing sourcemap output to:, Build/Intermediates.noindex/ArchiveIntermediates/application/BuildProductsPath/Release-iphoneos/main.jsbundle.map  

```

--------------------------------

### Apply borderColor and borderWidth to Image in React Native

Source: https://reactnative.dev/docs/0.77/image-style-props

Displays an Image component with a red border (5px width) using inline styles. The example uses SafeAreaProvider and SafeAreaView for proper layout, and centers content using flexbox. Dependencies include react-native and react-native-safe-area-context.

```javascript
import React from 'react';
import {Image, StyleSheet, Text} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const DisplayAnImageWithStyle = () => (
  <SafeAreaProvider>
    <SafeAreaView style={styles.container}>
      <Image
        style={{
          borderColor: 'red',
          borderWidth: 5,
          height: 100,
          width: 200,
        }}
        source={require('@expo/snack-static/react-native-logo.png')}
      />
      <Text>borderColor & borderWidth</Text>
    </SafeAreaView>
  </SafeAreaProvider>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
    justifyContent: 'center',
    alignItems: 'center',
  },
});

export default DisplayAnImageWithStyle;
```

--------------------------------

### Configure React Native Gradle Settings Plugin

Source: https://reactnative.dev/docs/0.78/integration-with-existing-apps

Set up the React Native Gradle Settings plugin in settings.gradle to enable autolinking of React Native libraries. This configuration must be added at the beginning of the settings.gradle file and includes the plugin management block and React Native extensions.

```groovy
// Configures the React Native Gradle Settings plugin used for autolinking
pluginManagement { includeBuild("../node_modules/@react-native/gradle-plugin") }
plugins { id("com.facebook.react.settings") }
extensions.configure(com.facebook.react.ReactSettingsExtension){ ex -> ex.autolinkLibrariesFromCommand() }
// If using .gradle.kts files:
// extensions.configure<com.facebook.react.ReactSettingsExtension> { autolinkLibrariesFromCommand() }
includeBuild("../node_modules/@react-native/gradle-plugin")

// Include your existing Gradle modules here.
// include(":app")
```

--------------------------------

### Display Platform Information in React Native

Source: https://reactnative.dev/docs/0.77/platform

A complete React Native component that displays platform-specific information including OS, version, device type, and platform constants. Uses SafeAreaProvider and ScrollView for safe and scrollable layout. This example demonstrates how to access Platform.OS, Platform.Version, Platform.isTV, Platform.isPad, and Platform.constants properties, with conditional rendering for iOS-specific properties.

```javascript
import React from 'react';
import {Platform, StyleSheet, Text, ScrollView} from 'react-native';
import {SafeAreaView, SafeAreaProvider} from 'react-native-safe-area-context';

const App = () => {
  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.safeArea}>
        <ScrollView contentContainerStyle={styles.container}>
          <Text>OS</Text>
          <Text style={styles.value}>{Platform.OS}</Text>
          <Text>OS Version</Text>
          <Text style={styles.value}>{Platform.Version}</Text>
          <Text>isTV</Text>
          <Text style={styles.value}>{Platform.isTV.toString()}</Text>
          {Platform.OS === 'ios' && (
            <>
              <Text>isPad</Text>
              <Text style={styles.value}>{Platform.isPad.toString()}</Text>
            </>
          )}
          <Text>Constants</Text>
          <Text style={styles.value}>
            {JSON.stringify(Platform.constants, null, 2)}
          </Text>
        </ScrollView>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  value: {
    fontWeight: '600',
    padding: 4,
    marginBottom: 8,
  },
  safeArea: {
    flex: 1,
  },
});

export default App;
```

--------------------------------

### Specify Debuggable Build Variants for React Native Gradle Plugin

Source: https://reactnative.dev/docs/0.77/react-native-gradle-plugin

This snippet shows how to instruct the React Native Gradle Plugin about which custom Android build variants should be treated as 'debuggable'. Listing variants here ensures that the plugin skips JS bundling for them, expecting Metro to run instead. This configuration is crucial for development builds and typically part of your `app/build.gradle`.

```groovy
apply plugin: "com.facebook.react"

react {
  debuggableVariants = ["fullStaging", "fullDebug"]
}
```

--------------------------------

### onRefresh

Source: https://reactnative.dev/docs/sectionlist

If provided, a standard RefreshControl will be added for "Pull to Refresh" functionality. Make sure to also set the `refreshing` prop correctly. To offset the RefreshControl from the top (e.g. by 100 pts), use `progressViewOffset={100}`.

```APIDOC
## onRefresh

### Description
If provided, a standard RefreshControl will be added for "Pull to Refresh" functionality. Make sure to also set the `refreshing` prop correctly. To offset the RefreshControl from the top (e.g. by 100 pts), use `progressViewOffset={100}`.

### Type
function
```

--------------------------------

### Register React Native HeadlessJsTaskService in AndroidManifest

Source: https://reactnative.dev/docs/0.77/headless-js-android

This XML snippet shows how to declare the custom `MyTaskService` within your Android application's `AndroidManifest.xml` file. This registration is essential for the operating system to recognize and start your headless task service.

```xml
<service android:name="com.example.MyTaskService" />  
```

--------------------------------

### Add Debug Logging to React Native Native Method

Source: https://reactnative.dev/docs/0.79/legacy/native-modules-android

This example shows how to incorporate debug logging into a native method to confirm its invocation and inspect passed arguments. It uses `Log.d` from the Android util package, which needs to be imported, to print messages to the console.

```java
import android.util.Log;  
  
@ReactMethod  
public void createCalendarEvent(String name, String location) {  
   Log.d("CalendarModule", "Create event called with name: " + name  
   + " and location: " + location);  
}  
```

```kotlin
import android.util.Log  
  
@ReactMethod  
fun createCalendarEvent(name: String, location: String) {  
    Log.d("CalendarModule", "Create event called with name: $name and location: $location")  
}  
```

--------------------------------

### Basic SafeAreaView Implementation in React Native

Source: https://reactnative.dev/docs/0.77/safeareaview

This example demonstrates how to integrate `SafeAreaView` into a React Native application. By wrapping the top-level view with `SafeAreaView` and applying `flex: 1` to its style, it ensures that the 'Page content' text is rendered within the device's safe area, avoiding obstruction by notches or system bars on iOS devices.

```javascript
import React from 'react';
import {StyleSheet, Text, SafeAreaView} from 'react-native';

const App = () => {
  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.text}>Page content</Text>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  text: {
    fontSize: 25,
    fontWeight: '500',
  },
});

export default App;
```

--------------------------------

### Demonstrate module side effects in React Native

Source: https://reactnative.dev/docs/0.77/optimizing-javascript-loading

This example illustrates an anti-pattern where a module performs side effects, such as modifying global variables, at its top level. Such code can prevent effective lazy loading and lead to unexpected behavior if the module's execution is deferred.

```tsx
import Logger from './utils/Logger';  
  
//  🚩 🚩 🚩 Side effect! This must be executed before React can even begin to  
// render the SplashScreen component, and can unexpectedly break code elsewhere  
// in your app if you later decide to lazy-load SplashScreen.  
global.logger = new Logger();  
  
export function SplashScreen() {  
  // ...  
}
```

--------------------------------

### Configure CPU Architecture-Specific APKs in Gradle

Source: https://reactnative.dev/docs/0.77/signed-apk-android

Configures android/app/build.gradle to generate separate APKs for different CPU architectures (armeabi-v7a, arm64-v8a, x86, x86_64). Reduces APK size by eliminating unused native code per device. Set universalApk to true for stores that don't support multiple APKs.

```groovy
android {
  
    splits {
        abi {
            reset()
            enable true
            universalApk false
            include "armeabi-v7a", "arm64-v8a", "x86", "x86_64"
        }
    }
  
}
```

--------------------------------

### Define DropShadowValue Object in JavaScript

Source: https://reactnative.dev/docs/0.79/dropshadowvalue

This example demonstrates how to define a `DropShadowValue` object in JavaScript. It configures a drop shadow with a horizontal offset of 10, a vertical offset of -3, a standard deviation of '15px' for blurriness, and a blue color.

```javascript
{
  offsetX: 10,
  offsetY: -3,
  standardDeviation: '15px',
  color: 'blue'
}
```

--------------------------------

### borderStartStartRadius

Source: https://reactnative.dev/docs/view-style-props

Sets the radius for the start-start corner of the border, accepting number or percentage values.

```APIDOC
## STYLE PROPERTY borderStartStartRadius

### Description
Sets the radius for the start-start corner of the border.

### Method
Property

### Endpoint
/borderStartStartRadius

### Parameters
#### Request Body
- **borderStartStartRadius** (number, string (percentage value)) - Required - The radius for the start-start corner.

### Request Example
```javascript
{
  "borderStartStartRadius": "8%"
}
```

### Response
N/A
```

--------------------------------

### File naming convention for native-specific React Native modules

Source: https://reactnative.dev/docs/0.79/platform-specific-code

This example illustrates the file structure for sharing code using the `.native.js` extension. `Container.js` is intended for web bundlers like webpack or Rollup, while `Container.native.js` is automatically picked up by the React Native bundler (Metro) for both Android and iOS, allowing for a single shared module across native platforms.

```shell
Container.js # picked up by webpack, Rollup or any other Web bundler
Container.native.js # picked up by the React Native bundler for both Android and iOS (Metro)
```

--------------------------------

### Import and use local library module in React Native

Source: https://reactnative.dev/docs/0.77/legacy/local-library-setup

JavaScript import statement to use exported functions or components from a local library in your React Native application. The module is imported by its package name as configured in package.json.

```javascript
import {multiply} from 'awesome-module';
```

--------------------------------

### Use Flex Dimensions for Responsive React Native Layouts

Source: https://reactnative.dev/docs/0.77/height-and-width

This example illustrates how to use the 'flex' property in React Native styles to create dynamically sized components. Setting 'flex: 1' on a component allows it to expand and fill available space, shared proportionally among siblings. A parent component must have defined dimensions for its flex children to be visible and expand.

```javascript
import React from 'react';
import {View} from 'react-native';

const FlexDimensionsBasics = () => {
  return (
    // Try removing the `flex: 1` on the parent View.
    // The parent will not have dimensions, so the children can't expand.
    // What if you add `height: 300` instead of `flex: 1`?
    <View style={{flex: 1}}>
      <View style={{flex: 1, backgroundColor: 'powderblue'}} />
      <View style={{flex: 2, backgroundColor: 'skyblue'}} />
      <View style={{flex: 3, backgroundColor: 'steelblue'}} />
    </View>
  );
};

export default FlexDimensionsBasics;
```