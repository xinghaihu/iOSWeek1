# Adding Tip Calculator Settings Page

Start by adding a Settings button in the navigation bar, as depicted below.

<img src="http://i.imgur.com/t3ZlMPl.png?1" />

In `TipViewController.m`, add the line below to the `viewDidLoad` method. The target is the object that will be called when the button is tapped, and the action is the method that will be called on the target. In Objective-C, methods are described by selectors. In the code below, when a user taps on the Settings button, the `onSettingsButton` method will be called in the `TipViewController` class.

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

In iOS, navigation stacks are one of the most common navigation mechanisms. You've seen it in many apps when you tap a button a new view slides in from the right. When you tap the back button, the previous view slides in from the left. A UINavigationController maintains the stack of view controllers and you can push new view controllers onto the stack. The back button is automatically added and tapping on the back button will pop the most recent view controller.

## Designing the Settings Page

The purpose of the settings page is to configure the default tip percentage. In SettingsViewController.xib, design what you think the SettingsViewController should look like. It should at least contain a UILabel explaining the purpose of the page.

## Loading and Saving

There are several different persistence mechanisms in iOS. The simplest to use is a persistent key-value store called NSUserDefaults. You might use NSUserDefaults for similar purposes as cookies in web development. They can store things like application settings, the current user, or a flag for whether a user has already seen a helpful hints popover.

To save a key to NSUserDefaults, do something like this:

```
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
[defaults setObject:@"some_string_to_save" forKey:@"some_key_that_you_choose"];
[defaults setInteger:123 forKey:@"another_key_that_you_choose"];
[defaults synchronize];
```

To load a key from NSUserDefaults, do something like this:

```
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
NSString *stringValue = [defaults objectForKey:@"some_key_that_you_choose"];
int intValue = [defaults integerForKey:@"another_key_that_you_choose"];
```

Note the `synchronize` call. NSUserDefaults automatically and periodically synchronizes, but to manually flush the keys and values to disk, call `synchronize` to guarantee that your updates are saved.

## View Controller Lifecycle

When returning to the main tip view controller from the settings page, it would be good to have the tip percentage reflect the new default value. One way to do that is load the tip percentage from NSUserDefaults whenever the view appears.

A view controller has a series of "lifecycle" methods that are called at various stages. When the view controller is initially set up, `viewDidLoad` is called. As it is shown and hidden, `viewWillAppear`, `viewDidAppear`, `viewWillDisappear`, and `viewDidDisappear` will be called. The appearance and disappearance are split into two methods because sometimes you want some behavior to happen before the transition animation starts or after the transition animation ends.

In `TipViewController.m`, try adding the following methods and watch the console output as you navigate into the settings view and back.

```
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}
```