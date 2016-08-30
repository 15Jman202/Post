//
//  PostsTableViewController.swift
//  Post
//
//  Created by Justin Carver on 8/30/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {
    
    var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PostController.getPosts { (post) in
            if let post = post {
                self.posts = post
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
               self.tableView.reloadData()
            })
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("postCell", forIndexPath: indexPath)

        let post = posts[indexPath.row]
        cell.textLabel?.text = post.username
        cell.detailTextLabel?.text = post.text
        
        return cell
    }
}