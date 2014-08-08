//
//  PostCell.swift
//  GlobalADN
//
//  Created by dasdom on 21.06.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    private var imageLoadingQueue = NSOperationQueue()
    
    var usernameLabel: UILabel
    var postTextView: UITextView
    private var avatarImageView: UIImageView
    
    var avatarURL: NSURL? {
    didSet {
        avatarImageView.image = nil
        if avatarURL != nil {
            imageLoadingQueue.cancelAllOperations()
            avatarImageView.image = nil
            weak var weakSelf = self
            var imageLoadinOperation = NSBlockOperation(block: {
                var strongSelf = weakSelf
                let imageData = NSData(contentsOfURL: strongSelf!.avatarURL!)
                let image = UIImage(data: imageData)
                dispatch_async(dispatch_get_main_queue(), {
                    strongSelf!.avatarImageView.image = image
                    })
                })
            
            imageLoadingQueue.addOperation(imageLoadinOperation)
        }
    }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String) {
        usernameLabel = {
            let label = UILabel()
            label.setTranslatesAutoresizingMaskIntoConstraints(false)
            label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
            return label
            }()
        
        postTextView = {
            let textView = UITextView()
            textView.setTranslatesAutoresizingMaskIntoConstraints(false)
//            textView.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
            textView.textContainerInset = UIEdgeInsetsMake(5, -5, 0, 0)
            //        textView.backgroundColor = UIColor.yellowColor()
//            let exclusioinPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 60, height: 60))
//            textView.textContainer.exclusionPaths = [exclusioinPath]
//            textView.backgroundColor = UIColor.clearColor()
            return textView
            }()
        
        avatarImageView = {
            let imageView = UIImageView()
            imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
            return imageView
            }()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        backgroundColor = UIColor.yellowColor()
        
        contentView.addSubview(usernameLabel)
        contentView.addSubview(postTextView)
        contentView.addSubview(avatarImageView)
        
        var viewsDictionary = ["usernameLabel" : usernameLabel, "avatarImageView" : avatarImageView, "postTextView" : postTextView]
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-5-[avatarImageView(50)]-5-[postTextView]-5-|", options: nil, metrics: nil, views: viewsDictionary))
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-5-[avatarImageView(50)]-(>=5)-|", options: nil, metrics: nil, views: viewsDictionary))
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-5-[usernameLabel][postTextView]-(>=5)-|", options: .AlignAllLeft, metrics: nil, views: viewsDictionary))
    }
    
    required convenience init(coder aDecoder: NSCoder!) {
        self.init(style: .Default, reuseIdentifier: "PostCell")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        avatarImageView.image = nil
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
