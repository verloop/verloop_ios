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
        
        let closeButton = UIBarButtonItem.init(title: "Close", style: UIBarButtonItemStyle.done, target: self, action: #selector(VerloopChatViewController.cancelButtonTapped(button:)))
        self.navigationItem.leftBarButtonItem = closeButton;
        
    }
    
    func cancelButtonTapped(button:UIBarButtonItem) {
       self.dismiss(animated: true, completion: nil)
    }
    
}
