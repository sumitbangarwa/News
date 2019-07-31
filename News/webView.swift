//
//  webView.swift
//  News
//
//  Created by Sumit Bangarwa on 7/31/19.
//  Copyright © 2019 Sumit Bangarwa. All rights reserved.
//

import UIKit

class webView: UIViewController {

    @IBOutlet var webView: UIWebView!
   
    var url:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.loadRequest(URLRequest(url: URL(string: url!)!))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
