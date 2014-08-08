//
//  PostBuilderTests.swift
//  GlobalADN
//
//  Created by dasdom on 20.06.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

import XCTest
import GlobalADN

class PostBuilderTests: XCTestCase {

    func testThatPostIsCreatedFromValidDictionary() {
        let validDictionary = ["canonical_url" : "https://alpha.app.net/bazbt3/post/32927508", "id" : "1234", "text" : "Test text", "thread_id" : "32914128"]
        
        let postBuilder = PostBuilder()
        if let post = postBuilder.postFromDictionary(validDictionary) {
            XCTAssertEqualObjects(post.canonicalURL.absoluteString, "https://alpha.app.net/bazbt3/post/32927508")
            XCTAssertEqual(post.id, 1234)
            XCTAssertEqualObjects(post.text, "Test text")
            XCTAssertEqual(post.threadId, 32914128)
        } else {
            XCTAssert(false, "Should be possible to create a post")
        }
    }
}
