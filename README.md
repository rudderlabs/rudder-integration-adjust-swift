# What is RudderStack?

[RudderStack](https://rudderstack.com/) is a **customer data pipeline** tool for collecting, routing and processing data from your websites, apps, cloud tools, and data warehouse.

More information on RudderStack can be found [here](https://github.com/rudderlabs/rudder-server).

## Getting Started with the RudderStack iOS SDK for Adjust

1. Add [Adjust](https://www.adjust.com) as a destination in the [Dashboard](https://app.rudderstack.com/) and define ```appToken``` and ```eventMapping```

2. RudderAdjust is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'RudderAdjust'
```

## Initialize ```RSClient```

Put this code in your ```AppDelegate.m``` file under the method ```didFinishLaunchingWithOptions```
```
RSConfig *config = [[RSConfig alloc] initWithWriteKey:WRITE_KEY];
[config dataPlaneURL:DATA_PLANE_URL];
RSClient *client = [[RSClient alloc] initWithConfig:config];
[client addWithDestination:[[RudderAdjustDestination alloc] init]];
```

## Send Events

Follow the steps from the [documentation](https://docs.rudderstack.com/destinations/adjust) to send the events.

## Contact Us

If you come across any issues while configuring or using this SDK, please feel free to start a conversation on our [Slack](https://resources.rudderstack.com/join-rudderstack-slack) channel. We will be happy to help you.
