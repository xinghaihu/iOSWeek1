# Adding Tip Calculator Settings Page

Start by adding a Settings button in the navigation bar, as depicted below.

<img src="http://i.imgur.com/t3ZlMPl.png?1" />

In `TipController.m`, add the line below to the `viewDidLoad` method. The target is the object that will be called when the button is tapped, and the action is the method that will be called on the target. In Objective-C, methods are described by selectors. In the code below, when a user taps on the Settings button, the `onSettingsButton` method will be called in the `TipController` class.

```
self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
```

Similar to the `updateValues` method, you must define the `onSettingsButton` method yourself.

## Creating a Settings View Controller

In the same way that you created the TipViewController, create the SettingsViewController by clicking File->New->File and selecting Objective-C class. Make sure the subclass is UIViewController and the "With XIB for user interface" is checked.

In the `onSettingsButton` method, launch the settings view controller using the code below. Be sure to add the import to the top of the file.

```
#import "SettingsViewController.h"
```

```
- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}
```