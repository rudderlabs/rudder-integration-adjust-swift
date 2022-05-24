//
//  RSAdjustDestination.swift
//  RudderAdjust
//
//  Created by Pallab Maiti on 04/03/22.
//

import Foundation
import Rudder
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
        guard let adjustConfig: RudderAdjustConfig = serverConfig.getConfig(forPlugin: self) else {
            return
        }
        self.customMappings = adjustConfig.customMappings
        if !adjustConfig.appToken.isEmpty {
            var delayTime: Double = 0.0
            if var delay = Double(adjustConfig.delay) {
                if delay < 0 {
                    delay = 0
                } else if delay > 10 {
                    delay = 10
                }
                delayTime = delay
            }
            let adjustConfig = ADJConfig(appToken: adjustConfig.appToken, environment: ADJEnvironmentProduction)
            adjustConfig?.logLevel = logLevel(client?.configuration?.logLevel ?? .none)
            adjustConfig?.eventBufferingEnabled = true
            if delayTime > 0 {
                adjustConfig?.delayStart = delayTime
            }
            adjust = Adjust()
            adjust?.appDidLaunch(adjustConfig)
        }
    }
    
    func identify(message: IdentifyMessage) -> IdentifyMessage? {
        if let anonymousId = message.anonymousId {
            adjust?.addSessionPartnerParameter("anonymousId", value: anonymousId)
        }
        
        if let userId = message.userId {
            adjust?.addSessionPartnerParameter(RSKeys.Identify.userId, value: userId)
        }
        return message
    }
    
    func track(message: TrackMessage) -> TrackMessage? {
        if let eventToken = customMappings?[message.event] {
            let event = ADJEvent(eventToken: eventToken)
            if let properties = message.properties {
                for (key, value) in properties {
                    if let value = value as? String {
                        event?.addCallbackParameter(key, value: value)
                    }
                }
                if let revenue = properties[RSKeys.Ecommerce.revenue] as? Double, let currency = properties[RSKeys.Ecommerce.currency] as? String {
                    event?.setRevenue(Double(revenue), currency: currency)
                }
            }
            adjust?.trackEvent(event)
        }
        return message
    }
    
    func reset() {
        Adjust.resetSessionPartnerParameters()
    }
}

// MARK: - Support methods

extension RSAdjustDestination {
    func logLevel(_ logLevel: RSLogLevel) -> ADJLogLevel {
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

struct RudderAdjustConfig: Codable {
    struct RSDictionary: Codable {
        let to: String?
        let from: String?
    }
    
    private let _appToken: String?
    var appToken: String {
        return _appToken ?? ""
    }
    
    private var _customMappings: [RSDictionary]?
    var customMappings: [String: String] {
        var customMappingsDict = [String: String]()
        if let from: [String] = _customMappings?.map({String($0.from ?? "") }),
           let to: [String] = _customMappings?.map({String($0.to ?? "") }) {
            customMappingsDict = Dictionary(uniqueKeysWithValues: zip(from, to))
        }
        return customMappingsDict
    }
    
    private let _delay: String?
    var delay: String {
        return _delay ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case _appToken = "appToken"
        case _customMappings = "customMappings"
        case _delay = "delay"
    }
}

@objc
public class RudderAdjustDestination: RudderDestination {
    
    public override init() {
        super.init()
        plugin = RSAdjustDestination()
    }
}
