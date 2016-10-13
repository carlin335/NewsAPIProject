//
//  ArticleTableView.swift
//  Sports News
//
//  Created by Carlin Soorenian on 10/4/16.
//  Copyright © 2016 Carlin Soorenian. All rights reserved.
//

import UIKit

class ArticleTableView: UITableViewController {
   
    
    var theSource: String? 
    var articles: [Article] = []
//    let sourceDetails: Source?
    
    override func viewDidLoad() {
    
    guard let unwrappedSource = theSource else {

            return
        }
        
        
        print(unwrappedSource)
        callAPI(source: unwrappedSource)

        
       
}
    
    func callAPI(source: String) {
        
        API.getArticles(source: theSource!) { (articlesData) in
            
            
            do {
                let object = try JSONSerialization.jsonObject(with: articlesData, options: JSONSerialization.ReadingOptions.mutableContainers)
                
                guard let dictionary = object as? NSDictionary else {
                    print("error 1")
                    
                    return
                }
                
                guard let newsArticles = dictionary["articles"] as? NSArray else {
                    print("error 2")
                    return
                }
                
                for article in newsArticles {
                    
                    guard let articleDictionary = article as? NSDictionary else {
                        return
                    }
                    
                    
                    guard let newsArticle = Article.articleFromJson(jsonDictionary: articleDictionary) else {
                        return
                    }
                    
                    self.articles.append(newsArticle)
                    
                }
                
                
            } catch {
                print("catch \(error)")
            }
            
            self.tableView.reloadData()
        }
    }
    
      
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        
        let articleItem = articles[row]
        
//        cell.articleImageView.image = UIImage(named: articleItem.urlToImage)
        cell.descriptionLabel.text = articleItem.description
        cell.titleLabel.text = articleItem.title
        
        let url = URL(string: articleItem.urlToImage)
        
        if let url = url {
            if let data = try? Data(contentsOf: url) {
                cell.articleImageView.image = UIImage(data: data)
            }
            
        
        }
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
    
        if segue.identifier == "articleSegue" {
        
        
        if let destination = segue.destination as? WebViewController {
            
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let articleIndex = articles[indexPath.row]
                print("articleIndex: \(articleIndex)")
                destination.urlDetails = articleIndex
            }
        }
    
        }
//    return UITableViewCell()
}

}
