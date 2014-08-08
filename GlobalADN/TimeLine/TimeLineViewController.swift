//
//  TimeLineViewController.swift
//  GlobalADN
//
//  Created by dasdom on 17.06.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

import UIKit

class TimeLineViewController: UITableViewController {
    var dataSource: TableViewProtocol
    
    init(tableViewDataSource aDataSource: TableViewProtocol) {
        
        dataSource = aDataSource
        
        super.init(nibName: nil, bundle: nil)
        
        let theRefreshControl = UIRefreshControl()
        theRefreshControl.addTarget(dataSource, action: "fetchData:", forControlEvents: .ValueChanged)
        refreshControl = theRefreshControl
        
        self.title = "Global"
    }
   
    convenience required init(coder aDecoder: NSCoder!) {
        self.init(tableViewDataSource: TimeLineDataSource())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = dataSource as UITableViewDelegate
        tableView.dataSource = dataSource as UITableViewDataSource
        dataSource.registerCellsAndSetTableView(tableView)
        dataSource.fetchData(nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
