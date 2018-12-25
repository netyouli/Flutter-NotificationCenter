
# Flutter-NotificationCenter

[![build status](https://img.shields.io/travis/flutterchina/Flutter-NotificationCenter/vm.svg?style=flat-square)](https://travis-ci.org/flutterchina/Flutter-NotificationCenter)
[![Pub](https://img.shields.io/pub/v/notification_center.svg?style=flat-square)](https://pub.dartlang.org/packages/notification_center)
[![support](https://img.shields.io/badge/platform-flutter%7Cdart%20vm-ff69b4.svg?style=flat-square)](https://github.com/netyouli/Flutter-NotificationCenter)
[![License MIT](http://img.shields.io/badge/license-MIT-orange.svg?style=flat)](https://raw.githubusercontent.com/netyouli/Flutter-NotificationCenter/master/LICENSE)

A lightweight, easy-to-use notification component library that corresponds to Dart supports post notification listening for notifications and notification removal

## Content

- [Installation](#installation)
- [Getting started](#getting-started)
- [API](#api)
- [Contribution](#contribution)

## Installation

```yaml
dependencies:
  notification_center: x.x.x  #latest version
```

## Getting started  

Add `notification_center.dart` to your js file.

`import 'package:notification_center/notification_center.dart'`

Add observer notification:

```dart
 NotificationCenter.addObserver(this, 'NotificationName', (param) {
    ....
 });

```

Post notification:

```dart
NotificationCenter.post('NotificationName', 'param value');
```

Remove specified observer notification:

```dart
NotificationCenter.removeObserver(this);

```

Remove all observer notification:

```dart
NotificationCenter.removeObserver(this, 'NotificationName');

```

## API


Method   |  Type     | Optional | Description
----------------- | -------- | -------- | -----------
post(string, any)   | function | true | post notification
addObserver(object, string, function)  |   function  |  true   | observer notification
removeObserver(object, string)  |   function  |  true   | remove observer notification


## Contribution

Issues are welcome. Please add a screenshot of bug and code snippet. Quickest way to solve issue is to reproduce it on one of the examples.

Pull requests are welcome. If you want to change API or making something big better to create issue and discuss it first.

---

**MIT Licensed**
