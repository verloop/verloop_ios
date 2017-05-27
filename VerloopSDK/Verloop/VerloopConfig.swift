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
    var notificationId:String
    var name:String?
    var email:String?
    var msisdn:String?
    let chatSubPath = "verloop.io/livechat"

    
    init(subDomain:String, token:String, notificationId:String) {
        self.subDomain = subDomain
        self.token = token
        self.notificationId = notificationId
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
        
        chatUrl += "&sdk=ios"
        return chatUrl
        
    }
    
}
