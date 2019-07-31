//
//  ViewController.swift
//  NewzDaily
//
//  Created by Sumit Bangarwa on 7/31/19.
//  Copyright © 2019 Sumit Bangarwa. All rights reserved.
//5aa497bf4089499bab671693aba8957c- api

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet var newsTable: UITableView!
    
    var newsData : [[String:Any]] = []
    var newsStoryUrlArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNewsData()
        
        
        
    }
    
    
    
    
    
    func getNewsData()
    {
        
        Alamofire.request("https://newsapi.org/v2/top-headlines?country=us&apiKey=5aa497bf4089499bab671693aba8957c", method: .get).responseJSON
            { (response) in
                
                if response.result.isSuccess
                {
                    let json: JSON = JSON(response.result.value!)
                    print(json)
                    if let jsonD = response.result.value as? [String:Any]
                    {
                        
                        if let newsR = jsonD["articles"] as? [[String:Any]] {
                            print(newsR)
                            
                            self.newsData = newsR
                            self.newsTable.reloadData()
                            
                            
                        }
                        
                    }
                    
                }
                else {
                    print("To News Found")
                }
        }
        
    }
    
    
    
    
    
    
    
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newscell", for: indexPath) as! newscell
        
        if let title =  self.newsData[indexPath.row]["title"] as? String,
            let descrip =  self.newsData[indexPath.row]["description"] as? String,
            let author =  self.newsData[indexPath.row]["author"] as? String,
            let imageurl =  self.newsData[indexPath.row]["urlToImage"] as? String,
            let date =  self.newsData[indexPath.row]["publishedAt"] as? String
        {
            
            cell.title.text = title
            cell.descrip.text = descrip
            cell.author.text = author
            let fullNameArr = date.components(separatedBy: "T")
            
            var firstName: String = fullNameArr[0]
            var lastName: String = fullNameArr[1]
            cell.date.text = firstName
            cell.time.text = lastName
            
            
            
            if let url = URL(string: imageurl ){
                
                do {
                    let data = try Data(contentsOf: url)
                    cell.img.image = UIImage(data: data)
                    
                }catch let err {
                    print(" Error : \(err.localizedDescription)")
                }
            }
            
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow
        if let url =  self.newsData[indexPath!.row]["url"] as? String
        {
            //        let urls = newsStoryUrlArray[(indexPath?.row)!]
            
            UIApplication.shared.open( URL(string: url)!, options: [:] ) { (success) in
                if success {
                    print("open link")
                }
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
