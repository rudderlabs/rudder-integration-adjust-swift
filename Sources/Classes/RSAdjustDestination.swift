//
//  RSAdjustDestination.swift
//  RudderAdjust
//
//  Created by Pallab Maiti on 04/03/22.
//

import Foundation
import RudderStack
import Adjust

class RSAdjustDestination: RSDestinationPlugin {
    let type = PluginType.destination
    let key = "Adjust"
    var client: RSClient?
    var controller = RSController()
    var customMappings: [String: String]?
    var adjust: Adjust?
        
    func update(serverConfig: RSServerConfig, type: UpdateType) {
        guard type == .initial else { return }
        if let destinations = serverConfig.destinations {
            if let destination = destinations.first(where: { $0.destinationDefinition?.displayName == self.key }) {
                if let customMappings = destination.config?.dictionaryValue?["customMappings"] as? [[String: String]] {
                    var tempDict = [String: String]()
                    for customMapping in customMappings {
                        if let from = customMapping["from"], let to = customMapping["to"] {
                            tempDict[from] = to
                        }
                    }
                    self.customMappings = tempDict
                }
                if let appToken = destination.config?.dictionaryValue?["appToken"] as? String {
                    var delayTime: Double = 0.0
                    if var delay = destination.config?.dictionaryValue?["delay"] as? Int {
                        if delay < 0 {
                            delay = 0
                        } else if delay > 10 {
                            delay = 10
                        }
                        delayTime = Double(delay)
                    }
                    let adjustConfig = ADJConfig(appToken: appToken, environment: ADJEnvironmentProduction)                    
                    adjustConfig?.logLevel =  RSAdjustDestination.logLevel(client?.configuration.logLevel ?? .none)
                    adjustConfig?.eventBufferingEnabled = true
                    if delayTime > 0 {
                        adjustConfig?.delayStart = delayTime
                    }
                    adjust = Adjust()
                    adjust?.appDidLaunch(adjustConfig)
                }
            }
        }
    }
    
    func identify(message: IdentifyMessage) -> IdentifyMessage? {
        if let anonymousId = message.anonymousId {
            adjust?.addSessionPartnerParameter("anonymousId", value: anonymousId)
        }
        
        if let userId = message.userId {
            adjust?.addSessionPartnerParameter("userId", value: userId)
        }
        return message
    }
    
    func track(message: TrackMessage) -> TrackMessage? {
        if let event = message.event {
            if let eventToken = customMappings?[event] {
                if let anonymousId = message.anonymousId {
                    adjust?.addSessionPartnerParameter("anonymousId", value: anonymousId)
                }
                if let userId = message.userId {
                    adjust?.addSessionPartnerParameter("userId", value: userId)
                }
                let event = ADJEvent(eventToken: eventToken)
                if let properties = message.properties {
                    for key in properties.keys {
                        if let value = properties[key] as? String {
                            event?.addCallbackParameter(key, value: value)
                        }
                    }
                    if let revenue = properties["revenue"] as? Int, let currency = properties["currency"] as? String {
                        event?.setRevenue(Double(revenue), currency: currency)
                    }
                }
                adjust?.trackEvent(event)
            }
        }
        return message
    }
    
    func screen(message: ScreenMessage) -> ScreenMessage? {
        client?.log(message: "MessageType is not supported", logLevel: .warning)
        return message
    }
    
    func group(message: GroupMessage) -> GroupMessage? {
        client?.log(message: "MessageType is not supported", logLevel: .warning)
        return message
    }
    
    func alias(message: AliasMessage) -> AliasMessage? {
        client?.log(message: "MessageType is not supported", logLevel: .warning)
        return message
    }
}

// MARK: - Support methods

extension RSAdjustDestination {
    static func logLevel(_ logLevel: RSLogLevel) -> ADJLogLevel {
        switch logLevel {
        case .verbose:
            return ADJLogLevelVerbose
        case .debug:
            return ADJLogLevelDebug
        case .info:
            return ADJLogLevelInfo
        case .warning:
            return ADJLogLevelWarn
        case .error:
            return ADJLogLevelError
        case .none:
            return ADJLogLevelVerbose
        }
    }
}

@objc
public class RudderAdjustDestination: RudderDestination {
    
    public override init() {
        super.init()
        plugin = RSAdjustDestination()
    }
}
