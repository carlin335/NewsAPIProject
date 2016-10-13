//
//  Article.swift
//  Sports News
//
//  Created by Carlin Soorenian on 10/4/16.
//  Copyright © 2016 Carlin Soorenian. All rights reserved.
//

import Foundation
import UIKit

struct Article {
    let title: String
    let description: String
    let urlToImage: String
    let url: String
    let publishedAt: String

    struct Source {
        let source: String
    }
    
    static func articleFromJson(jsonDictionary dictionary: NSDictionary) -> Article? {
        
        guard let title = dictionary["title"] as? String else { return nil }
        guard let description = dictionary["description"] as? String else { return nil }
        guard let urlToImage = dictionary["urlToImage"] as? String else { return nil }
        guard let url = dictionary["url"] as? String else { return nil }
        guard let publishedAt = dictionary["publishedAt"] as? String else { return nil }
      
    return Article(title: title, description: description, urlToImage: urlToImage, url: url, publishedAt: publishedAt)
    }

    static func sourceFromJson(jsonDictionary dictionary: NSDictionary) -> Source? {
        
        guard let source = dictionary["source"] as? String else { return nil }
        
        return Source(source: source)
    }
    
}
