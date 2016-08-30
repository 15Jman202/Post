//
//  Post.swift
//  Post
//
//  Created by Justin Carver on 8/30/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import Foundation

class Post {
    
    private let kUsername = "username"
    private let kText = "text"
    private let kTimeStamp = "timestamp"
    private let kIdentifier = "uuid"
    
    let username: String
    let text: String
    let timestamp: NSTimeInterval
    let identifier: NSUUID
    
    init(username: String, text: String, identifier: NSUUID = NSUUID()) {
        self.username = username
        self.text = text
        self.timestamp = NSDate().timeIntervalSince1970
        self.identifier = identifier
    }
    
    init?(dictionary: [String: AnyObject], identifier: String) {
        
        guard let username = dictionary[kUsername] as? String,
            let text = dictionary[kText] as? String,
            let timestamp = dictionary[kTimeStamp] as? Double,
            let identifier = NSUUID(UUIDString: identifier)

            else { return nil }
        
        self.username = username
        self.text = text
        self.timestamp = timestamp
        self.identifier = identifier
    }
}