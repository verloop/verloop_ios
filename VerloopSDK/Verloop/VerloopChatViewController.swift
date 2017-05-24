//
//  VerloopChatViewController.swift
//  VerloopSDK
//
//  Created by Prashanta Kumar Nayak on 24/05/17.
//  Copyright © 2017 Verloop. All rights reserved.
//

import Foundation
import UIKit

class VerloopChatViewController: UIViewController {
    var urlString:String?
    var webView:UIWebView?
    var cancelButton:UIButton?
    init(chatUrl url:String) {
      super.init(nibName: nil, bundle: nil)
        self.urlString = url
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout();
        let url:URL = URL.init(string: self.urlString!)!
        let urlRequest:URLRequest = URLRequest.init(url:url)
        self.webView!.loadRequest(urlRequest);
    }
    
    
    func setupLayout() {
        self.webView = UIWebView.init()
        self.webView?.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.webView!)
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[webView]|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["webView" : self.webView!]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[webView]|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["webView" : self.webView!]))
        
        self.cancelButton = UIButton.init(type: UIButtonType.system)
        self.cancelButton?.setTitle("Cancel", for: UIControlState.normal)
        self.cancelButton?.backgroundColor = UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 1.0);
        self.cancelButton?.addTarget(self, action: #selector(VerloopChatViewController.cancelButtonTapped(button:)), for: UIControlEvents.touchUpInside)
        self.view?.addSubview(self.cancelButton!)
        self.view.bringSubview(toFront: self.cancelButton!)
        self.cancelButton?.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[button(==60)]", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["button" : self.cancelButton!]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[button(==20)]", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["button" : self.cancelButton!]))
        
    }
    
    func cancelButtonTapped(button:UIButton) {
       self.dismiss(animated: true, completion: nil)
    }
    
}
