//
//  Post.swift
//  GlobalADN
//
//  Created by dasdom on 18.06.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

import UIKit

class Post {
    var canonicalURL    = NSURL()
    var id              = 0
    var text            = ""
    var threadId        = 0
    var user            = User()
    var mentions        = [Mention]()
    
    var attributedText  = NSAttributedString()
}