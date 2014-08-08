//
//  DataFetcherTests.swift
//  GlobalADN
//
//  Created by dasdom on 18.06.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

import XCTest
import GlobalADN

class DataFetcherTests: XCTestCase {
    var dataFetcher = DataFetcher()
    
    func testGlobalCanBeFetched() {
        var expectation = expectationWithDescription("fetch data")
        
        dataFetcher.fetchGlobalStream { (array, error) in
            if error {
                println(error!)
                return
            }
            
            if array?.count > 0 {
                XCTAssert(true)
                expectation.fulfill()
            }
        }
        
        waitForExpectationsWithTimeout(5.0, handler: nil)
    }
    
    func testPersonalTimeLineCanBeFetched() {
        var expectation = expectationWithDescription("fetch data")
        
        dataFetcher.fetchPersonalTimeLine { (array, error) in
            if error {
                println(error!)
                return
            }
            
            if array?.count > 0 {
                XCTAssert(true)
                expectation.fulfill()
            }
        }
        
        waitForExpectationsWithTimeout(5.0, handler: nil)
    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock() {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
