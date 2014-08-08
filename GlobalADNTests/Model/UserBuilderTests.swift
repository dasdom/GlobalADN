//
//  UserBuilderTests.swift
//  GlobalADN
//
//  Created by dasdom on 20.06.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

import XCTest
import GlobalADN

class UserBuilderTests: XCTestCase {

    func testThatUserIsCreatedFromValidDictionary() {
        let validDictionary = ["avatar_image" : ["url" : "https://d2rfichhc2fb9n.cloudfront.net/image/5/_dhmyzw1"], "id" : "1234", "name" : "test name", "username" : "test username"]
        
        let userBuilder = UserBuilder()
        if let user = userBuilder.userFromDictionary(validDictionary) {
            XCTAssertEqualObjects(user.avatarURL.absoluteString, "https://d2rfichhc2fb9n.cloudfront.net/image/5/_dhmyzw1")
            XCTAssertEqual(user.id, 1234)
            XCTAssertEqualObjects(user.name, "test name")
            XCTAssertEqualObjects(user.username, "test username")
        }
    }
    
}
