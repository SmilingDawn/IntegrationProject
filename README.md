IntegrationProject
========================

## Introduction
기존 구현이 되어 있는 Native코드에 일부 화면 ReactNative 적용.[React Natvie Integration][1]을 참조.  
```
React Native 공식문서의 iOS Pod설정을 적용하면 동작하지 않는데   
RN버전과 cocoaPod버전에 따라 설정방법이 다르다.
```

## Config

* Version
  - React Native : 0.69.1
  - React : 18.0.0
  - iOS Target : 15
  - Android Target : 32


## Code 

index.js
```JavaScript
import React from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';

const HelloWorld = () => {
  return (
    <View style={styles.container}>
      <Text style={styles.hello}>Hello, World2</Text>
    </View>
  );
};
var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center'
  },
  hello: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10
  }
});

AppRegistry.registerComponent(
  'IntegrationProject',
  () => HelloWorld
);
```

iOS
```swift
@IBAction func moveReactNativeButtonTapped(_ sender: Any) {
    let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")

      let rootView = RCTRootView(
          bundleURL: jsCodeLocation!,
          moduleName: "IntegrationProject",
          initialProperties: nil,
          launchOptions: nil
      )
      let vc = UIViewController()
      vc.view = rootView
      self.present(vc, animated: true, completion: nil)
  }
```

Android
```kotlin
class SecondActivity : AppCompatActivity(), DefaultHardwareBackBtnHandler {
    private lateinit var reactRootView: ReactRootView
    private lateinit var reactInstanceManager: ReactInstanceManager

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (!Settings.canDrawOverlays(this)) {
                overlayPermissionResult.launch(
                    Intent(
                        Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                        Uri.parse("package: $packageName")
                    )
                )
            }
        }

        SoLoader.init(this, false)
        reactRootView = ReactRootView(this)

        val packages: List<ReactPackage> = PackageList(application).packages
        reactInstanceManager = ReactInstanceManager.builder()
            .setApplication(application)
            .setCurrentActivity(this)
            .setBundleAssetName("index.android.bundle")
            .setJSMainModulePath("index")
            .addPackages(packages)
            .setUseDeveloperSupport(BuildConfig.DEBUG)
            .setInitialLifecycleState(LifecycleState.RESUMED)
            .build()

        reactRootView?.startReactApplication(reactInstanceManager, "IntegrationProject", null)
        setContentView(reactRootView)
    }

    override fun onPause() {
        super.onPause()
        reactInstanceManager.onHostPause(this)
    }

    override fun onResume() {
        super.onResume()
        reactInstanceManager.onHostResume(this)
    }

    override fun onDestroy() {
        super.onDestroy()
        reactInstanceManager.onHostDestroy(this)
        reactRootView.unmountReactApplication()
    }

    override fun onBackPressed() {
        reactInstanceManager.onBackPressed()
        super.onBackPressed()
    }

    override fun onKeyUp(keyCode: Int, event: KeyEvent?): Boolean {
        if (keyCode == KeyEvent.KEYCODE_MENU && reactInstanceManager != null) {
            reactInstanceManager.showDevOptionsDialog()
            return true
        }
        return super.onKeyUp(keyCode, event)
    }


    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == OVERLAY_PERMISSION_REQ_CODE) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                if (!Settings.canDrawOverlays(this)) {
                    // SYSTEM_ALERT_WINDOW permission not granted
                }
            }
        }
        reactInstanceManager?.onActivityResult(this, requestCode, resultCode, data)
    }

    override fun invokeDefaultOnBackPressed() {
        super.onBackPressed()
    }
    private var overlayPermissionResult: ActivityResultLauncher<Intent> =
        registerForActivityResult(ActivityResultContracts.StartActivityForResult()) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                if (!Settings.canDrawOverlays(this)) {
                    // SYSTEM_ALERT_WINDOW permission not granted
                }
            }
            reactInstanceManager?.onActivityResult(
                this,
                OVERLAY_PERMISSION_REQ_CODE,
                it.resultCode,
                it.data
            )
        }

    companion object {
        const val OVERLAY_PERMISSION_REQ_CODE = 1  // Choose any value
    }
```


[1]: https://reactnative.dev/docs/integration-with-existing-apps
