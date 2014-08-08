//
//  PostsParserTests.swift
//  GlobalADN
//
//  Created by dasdom on 20.06.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

import XCTest
import GlobalADN

class PostsParserTests: XCTestCase {
    let postBuilder = PostBuilder()
//    let userBuilder = BuilderForTesting()
//    let mentionBuilder = BuilderForTesting()
    var postsParser = PostsParser()
    
//    override func setUp() {
//        super.setUp()
//        postsParser = PostsParser(postBuilder: postBuilder, userBuilder: userBuilder, mentionBuilder: mentionBuilder)
//    }
    
    func testThatPostsParsingCallsBuilder() {
        let validUserDictionary = ["avatar_image" : ["url" : "test"], "id" : "1", "name" : "test", "username" : "test"]

        let validMentionDictionary = ["id" : "1", "is_leading" : "1", "len" : "1", "name" : "test", "pos" : "1"]
        
        let validPostDictionary = ["canonical_url" : "test", "id" : "1", "text" : "test", "thread_id" : "1", "user" : validUserDictionary, "entities" : ["mentions" : [validMentionDictionary, validMentionDictionary]]]
        
        let dataArray : NSArray = NSArray(object: validPostDictionary)
        
        let validDataDictionary = ["data" : dataArray]
        
        let array = postsParser.postsArrayFromDataDictionary(validDataDictionary)
        
        XCTAssertEqual(array.count, 1)
//        XCTAssertEqual(userBuilder.numberOfUserBuilderCalls, 1)
//        XCTAssertEqual(postBuilder.numberOfPostBuilderCalls, 1)
//        XCTAssertEqual(mentionBuilder.numberOfMentionBuilderCalls, 2)
    }
}

//class BuilderForTesting : CanBuildPost, CanBuildUser, CanBuildMention {
//    var numberOfPostBuilderCalls = 0
//    var numberOfUserBuilderCalls = 0
//    var numberOfMentionBuilderCalls = 0
//
//    func postFromDictionary(dictionary: NSDictionary) -> Post? {
//        numberOfPostBuilderCalls++
//        return PostBuilder().postFromDictionary(dictionary)
//    }
//    
//    func userFromDictionary(dictionary: NSDictionary) -> User? {
//        numberOfUserBuilderCalls++
//        return UserBuilder().userFromDictionary(dictionary)
//    }
//    
//    func mentionFromDictionary(dictionary: NSDictionary) -> Mention? {
//        numberOfMentionBuilderCalls++
//        return MentionBuilder().mentionFromDictionary(dictionary)
//    }
//
//}

