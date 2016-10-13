//
//  DifferentNewsPlaces.swift
//  Sports News
//
//  Created by Carlin Soorenian on 10/4/16.
//  Copyright © 2016 Carlin Soorenian. All rights reserved.
//

import UIKit

struct News {
    let name: String
    let image: String
}

class NewsCatagoryTableViewController: UITableViewController {
    
    
    var mySource: String?
    
    let news: [News] =  [
        News(name: "", image: "fox_sports"),
        News(name: "", image: "bloomberg_business"),
        News(name: "", image: "mtv-news"),
        News(name: "", image: "time_logo"),
        News(name: "", image: "CNBC"),
        News(name: "", image: "business-insider"),
        News(name: "", image: "Engadget"),
        News(name: "", image: "polygon"),
        News(name: "", image: "National Geographic")
    ]
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCatagoryCell", for: indexPath) as! NewsCatagoryCell
        let newsItem = news[row]
        
        cell.newsCatagoryLabel.text = newsItem.name
        cell.newsCatagoryImageView.image = UIImage(named: newsItem.image)
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            mySource = "fox-sports"
        } else if indexPath.row == 1 {
            mySource = "bloomberg"
        } else if indexPath.row == 2 {
            mySource = "mtv-news"
        } else if indexPath.row == 3 {
            mySource = "time"
        } else if indexPath.row == 4 {
            mySource = "cnbc"
        } else if indexPath.row == 5 {
            mySource = "business-insider"
        } else if indexPath.row == 6 {
            mySource = "engadget"
        } else if indexPath.row == 7 {
            mySource = "polygon"
        } else if indexPath.row == 8 {
            mySource = "national-geographic"
        }



    }
//        let bloombergIndexPath = IndexPath(row: 1, section: 1)
//
//        if let indexPath = NSIndexPath(forRow: 1, inSection: 0) {
//            
//        }
//        mySource = sourceArray1.IndexPath(row: 1, section: 1)
//        mySource = sourceArray
//        
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? ArticleTableView {
            
            if tableView.indexPathForSelectedRow?.row == 0 {
                mySource = "fox-sports"
            } else if tableView.indexPathForSelectedRow?.row == 1 {
                mySource = "bloomberg"
            } else if tableView.indexPathForSelectedRow?.row == 2 {
                mySource = "mtv-news"
            } else if tableView.indexPathForSelectedRow?.row == 3 {
                mySource = "time"
            } else if tableView.indexPathForSelectedRow?.row == 4 {
                mySource = "cnbc"
            } else if tableView.indexPathForSelectedRow?.row == 5 {
                mySource = "business-insider"
            } else if tableView.indexPathForSelectedRow?.row == 6 {
                mySource = "engadget"
            } else if tableView.indexPathForSelectedRow?.row == 7 {
                mySource = "polygon"
            } else if tableView.indexPathForSelectedRow?.row == 8 {
                mySource = "national-geographic"
            }
            
            destination.theSource = mySource
        }
    }
}
