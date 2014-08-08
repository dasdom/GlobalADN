//
//  GlobalViewControllerTests.swift
//  GlobalADN
//
//  Created by dasdom on 22.06.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

import XCTest
import GlobalADN
import UIKit

class TimeLineViewControllerTests: XCTestCase {
    let globalDataSource = GlobalViewDataSourceForTesting()
    var globalViewController: TimeLineViewController!
    
    override func setUp() {
        super.setUp()
        
        globalViewController = TimeLineViewController(tableViewDataSource: globalDataSource)
    }
    
    func testViewHasTableViewAfterLoadView() {
        globalViewController.loadView()
        
        XCTAssertEqualObjects(globalViewController.view, globalViewController.tableView.superview)
    }

    func testTableViewDataSourceIsControllerDataSource() {
        globalViewController.loadView()
        
        XCTAssertTrue(globalViewController.tableView.dataSource === globalDataSource)
    }
    
    func testTableViewDelegateIsControllerDataSource() {
        globalViewController.loadView()
        
        XCTAssertTrue(globalViewController.tableView.delegate === globalDataSource)
    }

    func testRegisterCellsOfDataSourceGetsCalled() {
        globalViewController.loadView()
        
        XCTAssertTrue(globalDataSource.registerCellsWasCalled)
    }
    
    func testFetchDataOfDataSourceGetsCalled() {
        globalViewController.loadView()
        
        XCTAssertTrue(globalDataSource.fetchDataGotCalled)
    }
}

class GlobalViewDataSourceForTesting : TimeLineDataSource {
    var registerCellsWasCalled = false
    var fetchDataGotCalled = false
    
    override func registerCellsAndSetTableView(theTableView: UITableView) {
        registerCellsWasCalled = true
    }
    
    override func fetchData() {
        fetchDataGotCalled = true
    }
}
