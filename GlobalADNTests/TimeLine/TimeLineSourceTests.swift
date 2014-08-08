//
//  GlobalDataSourceTests.swift
//  GlobalADN
//
//  Created by dasdom on 22.06.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

import XCTest
import GlobalADN
import UIKit

class TimeLineSourceTests: XCTestCase {
    let timeLineDataSource = TimeLineDataSource()
    
    override func setUp() {
        super.setUp()
        
        let post1 = Post()
        post1.text = "Text of post 1"
        post1.user.username = "Karl der Käfer"
        let postsArray = [post1, Post()]
        timeLineDataSource.postsArray = postsArray
        
        let tableView = UITableView()
        timeLineDataSource.registerCellsAndSetTableView(tableView)
        
        timeLineDataSource.tableView!.dataSource = timeLineDataSource
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testTableViewHasCorrectNumberOfCells() {
        let numberOfCells = timeLineDataSource.tableView!.numberOfRowsInSection(0)
        println("numberOfCells: \(numberOfCells)")
        XCTAssertEqual(numberOfCells, 2)
    }
    
    func testDataSourceReturnsPostCell() {
        let postCell = timeLineDataSource.tableView(timeLineDataSource.tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
    
        if postCell is PostCell {
            XCTAssertTrue(true)
        } else {
            XCTAssertTrue(false)
        }
    }
    
    func testPostCellHasUsername() {
        let postCell = timeLineDataSource.tableView(timeLineDataSource.tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0)) as PostCell
        
        XCTAssertEqualObjects(postCell.usernameLabel.text, "Karl der Käfer")
    }

    func testPostCellHasText() {
        let postCell = timeLineDataSource.tableView(timeLineDataSource.tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0)) as PostCell

        XCTAssertEqualObjects(postCell.postTextView.text, "Text of post 1")
    }
}
