//
//  TimeLineDataSource.swift
//  GlobalADN
//
//  Created by dasdom on 21.06.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

import UIKit

let PostCellIdentifier = "PostCellIdentifier"

class TimeLineDataSource : NSObject, TableViewProtocol {
    var tableView: UITableView?
    var postsArray = Array<Post>()
    var sinceId: Int?
    var beforeId: Int?
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return postsArray.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier(PostCellIdentifier, forIndexPath: indexPath) as PostCell
        
        let post = postsArray[indexPath.row]
        
        cell.usernameLabel.text = post.user.username
                
        cell.postTextView.scrollEnabled = true
        cell.postTextView.attributedText = post.attributedText
        cell.postTextView.invalidateIntrinsicContentSize()
        cell.postTextView.scrollEnabled = false
        
        cell.avatarURL = post.user.avatarURL
        
        return cell
    }
    
    func registerCellsAndSetTableView(theTableView: UITableView) {
        theTableView.registerClass(PostCell.self, forCellReuseIdentifier: PostCellIdentifier)
        tableView = theTableView
    }

    func fetchData(sender: AnyObject?) {
//        assert(tableView, "At this point a tableView has to be assigned")
        
        var indexPath:NSIndexPath?
        var oldYOffsetOfCell: CGFloat = 0
        var contentOffsetY: CGFloat = 0
        if tableView!.numberOfRowsInSection(0) > 0 {
            let cell = tableView!.visibleCells()[0] as PostCell
            oldYOffsetOfCell = cell.frame.origin.y
            indexPath = tableView!.indexPathsForVisibleRows()[0] as? NSIndexPath
            contentOffsetY = tableView!.contentOffset.y
            println("contentOffsetY: \(contentOffsetY)")
        }
        DataFetcher().fetchPersonalTimeLineBefore(nil, sinceId: sinceId) { (array, meta, error) in
            if error != nil {
                println("Error: \(error)")
            } else {
                if self.postsArray.count < 1 {
                    self.postsArray = array!
                } else {
                    self.postsArray.replaceRange(Range(start: 0, end: 0), with: array!)
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView!.reloadData()
                    
                    if let theIndexPath = indexPath {
                        var newIndexPath = NSIndexPath(forRow: theIndexPath.row + array!.count, inSection: 0)
                        let theCell = self.tableView!.cellForRowAtIndexPath(newIndexPath)
                        println("theCell \(theCell)")
                        let newYOffsetOfCell = theCell.frame.origin.y
                        println("old: \(oldYOffsetOfCell) new: \(newYOffsetOfCell)")
                        
                        let yDiff = newYOffsetOfCell-oldYOffsetOfCell
                        println("yDiff: \(yDiff)")
                        self.tableView!.setContentOffset(CGPointMake(0.0, yDiff+contentOffsetY), animated: false)
                    }
                    
                    if let more = meta?.more {
                        self.sinceId = meta?.maxId
                    }
                    println("sinceId: \(self.sinceId)")
                    if let refreshControl = sender as? UIRefreshControl {
                        refreshControl.endRefreshing()
                    }
                    })
            }
        }
    }
}
