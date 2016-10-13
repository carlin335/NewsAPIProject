//
//  WebViewController.swift
//  Sports News
//
//  Created by Carlin Soorenian on 10/10/16.
//  Copyright © 2016 Carlin Soorenian. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    @IBAction func shareButton(_ sender: AnyObject) {
        sharingApp()
    }
    
    
    var urlDetails: Article?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWebPage()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadWebPage(){
        guard let theURL = urlDetails?.url else {return}
        let theRequestURL = NSURL(string: theURL)
        let theRequest = NSURLRequest (url: theRequestURL! as URL)
        webView.loadRequest(theRequest as URLRequest)
}
    func sharingApp() {
        print("anything")
        guard let url = urlDetails?.url else { return }
        let message = "check out this article \(url)"
        let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [message], applicationActivities: nil)
        //        activityViewController.popoverPresentationController.
        self.present(activityViewController, animated: true, completion: nil)
        
    }

    
    
}
