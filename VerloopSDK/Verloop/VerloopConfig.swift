//
//  VerloopConfig.swift
//  VerloopSDK
//
//  Created by Prashanta Kumar Nayak on 24/05/17.
//  Copyright © 2017 Verloop. All rights reserved.
//

import Foundation

public class VerloopConfig: NSObject {
    var subDomain:String
    var token:String
    var name:String?
    var email:String?
    var msisdn:String?
    let chatSubPath = "verloop.io/livechat"

    
    public init(subDomain:String, token:String) {
        self.subDomain = subDomain
        self.token = token
    }
    
    func verloopChatUrl() -> String {
        var chatUrl = "https://\(self.subDomain).\(self.chatSubPath)?token=\(self.token)"
        
        if self.name != nil {
            chatUrl += "&name=\(self.name!)"
        }
        
        if self.email != nil {
            chatUrl += "&email=\(self.email!)"
        }
        
        if self.msisdn != nil {
            chatUrl += "&mobile=\(self.msisdn!)"
        }
        
        
        
        if  let deviceToken = self.defaultDeviceToken() {
            chatUrl += "&device_token=\(deviceToken)"
        }
        
        chatUrl += "&sdk=ios"
        chatUrl += "&device_type=ios"
        chatUrl += "&mode=popout"
        return chatUrl
        
    }
    
    func updateDeviceToken(deviceToken:String?) {
        if let deviceTokenString = deviceToken {
            self.saveDeviceToken(deviceToken: deviceTokenString)
        }
    }
    
    func saveDeviceToken(deviceToken:String) {
        UserDefaults.standard.set(deviceToken, forKey: "device_token")
        UserDefaults.standard.synchronize()
    }
    
    func defaultDeviceToken() -> String? {
        return (UserDefaults.standard.value(forKey: "device_token") as? String)!
    }
    
}
