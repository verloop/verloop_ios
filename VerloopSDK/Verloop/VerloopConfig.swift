//
//  VerloopConfig.swift
//  VerloopSDK
//
//  Created by Prashanta Kumar Nayak on 24/05/17.
//  Copyright © 2017 Verloop. All rights reserved.
//

import Foundation

class VerloopConfig: NSObject {
    var subDomain:String
    var token:String
    var name:String?
    var email:String?
    var msisdn:String?
    let chatSubPath = "verloop.io/livechat"
    var deviceToken:String?

    
    init(subDomain:String, token:String) {
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
        
        if self.deviceToken != nil {
            chatUrl += "&device_token=\(self.deviceToken!)"
        }
        
        chatUrl += "&sdk=ios"
        chatUrl += "&device_type=ios"
        chatUrl += "&mode=popout"
        return chatUrl
        
    }
    
}
