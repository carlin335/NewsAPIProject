//
//  API.swift
//  Sports News
//
//  Created by Carlin Soorenian on 9/30/16.
//  Copyright © 2016 Carlin Soorenian. All rights reserved.
//

import Foundation

class API {
    class func getArticles(source: String, completion: @escaping (Data) -> ()) {

    let baseURL = "https://newsapi.org/v1/articles?source=" + source + "&sortBy=top&apiKey=152baa9e7d1947aba3eab66050fc1352"

        
        guard let articlesURL = URL(string: baseURL) else { return }
        
        var request = URLRequest.init(url: articlesURL)
        
        request.httpMethod = "GET"
        
        let session = URLSession.shared
    
    func onComplete(data: Data?, response: URLResponse?, error: Error?) -> Void {
            defer {
        }
        
            if let error = error {
                print("Error retrieving: \(error)")
            }
            guard let data = data, let string = String(data: data, encoding: String.Encoding.utf8)
                else {
                    return
            }
            
            print(string)
            
            OperationQueue.main.addOperation {
                completion(data)
            }
        }
        
        let task = session.dataTask(with: request, completionHandler: onComplete)
        task.resume()
    
    }
}
