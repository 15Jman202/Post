//
//  PostsTableViewController.swift
//  Post
//
//  Created by Justin Carver on 8/30/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let post = posts[indexPath.row]
        if post.text.characters.count > 50 || post.username.characters.count > 50 {
            return 70.0
        } else if post.text.characters.count > 75 && post.username.characters.count > 75 {
            return 150.0
        } else {
            return 45.0
        }
    }
    
    @IBAction func refreshController(sender: AnyObject) {
    
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
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