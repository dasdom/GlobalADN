//
//  MentionBuilderTests.swift
//  GlobalADN
//
//  Created by dasdom on 05.07.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

import XCTest
import GlobalADN

class MentionBuilderTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testThatMentionIsCreatedFromValidDictionary() {
        let validDictionary = ["id" : "1234", "is_leading" : "1", "len" : "7", "name" : "indigo", "pos" : "1"]
        
        let mentionBuilder = MentionBuilder()
        if let mention = mentionBuilder.mentionFromDictionary(validDictionary) {
            XCTAssertEqual(mention.id, 1234)
            XCTAssertTrue(mention.isLeading)
            XCTAssertEqual(mention.length, 7)
            XCTAssertEqualObjects(mention.name, "indigo")
            XCTAssertEqual(mention.position, 1)
            
        }
    }

}
