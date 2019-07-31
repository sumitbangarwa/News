//
//  splashScreenVC.swift
//  Newz Daily
//
//  Created by Sumit Bangarwa on 7/31/19.
//  Copyright © 2019 Sumit Bangarwa. All rights reserved.
//

import UIKit

class splashScreenVC: UIViewController {

    @IBOutlet var animation: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animation.backgroundColor = UIColor.clear
        self.animation.loadGif(name: "giphy")
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3)
        {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as! UIViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    


}
