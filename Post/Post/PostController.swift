//
//  PostController.swift
//  Post
//
//  Created by Justin Carver on 8/30/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import Foundation

class PostController {
    
    
    static let baseURL = NSURL(string: "https://devmtn-post.firebaseio.com/posts/")
    static let endpoint = baseURL?.URLByAppendingPathExtension("json")
    
    static func getPosts(completion: (post: [Post]?) -> Void) {
        
        guard let url = PostController.endpoint else { completion(post: nil); return }
        
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            guard let data = data,
            JSONSerialized = ( try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: [String: AnyObject]]
                else {
                    print("Unable to serialize JSON.")
                    completion(post: [])
                    return }
            
            let posts = JSONSerialized.flatMap({Post(dictionary: $0.1, identifier: $0.0)})
            let sortedPosts = posts.sort { $1.timestamp < $0.timestamp }
            completion(post: sortedPosts)
            
            
        }
    }
}