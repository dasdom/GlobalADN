//
//  URLRequestTests.swift
//  GlobalADN
//
//  Created by dasdom on 19.06.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

import XCTest
import GlobalADN

class URLRequestTests: XCTestCase {

    func testGlobalRequestIsCreated() {
        var globalRequest = ADNRequestFactory.globalRequest
        
        XCTAssert(globalRequest.URL.absoluteString == "https://api.app.net/posts/stream/global")
        XCTAssert(globalRequest.HTTPMethod == "GET")
    }
}
