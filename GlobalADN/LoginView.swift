//
//  LoginView.swift
//  GlobalADN
//
//  Created by dasdom on 04.07.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

import UIKit

class LoginView: UIView {

    let titleLabel: UILabel
    let textFieldsHostView: UIView
    let userNameTextField: UITextField
    let passwordTextField: UITextField
    let loginButton: UIButton
    
    override init(frame: CGRect) {
        
        titleLabel = UILabel(frame: CGRectZero)
        titleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        titleLabel.textAlignment = .Center
        titleLabel.text = "Welcome to Jupp"
        titleLabel.textColor = UIColor.whiteColor()
        
        textFieldsHostView = UIView(frame: CGRectZero)
        textFieldsHostView.setTranslatesAutoresizingMaskIntoConstraints(false)
        textFieldsHostView.backgroundColor = UIColor.whiteColor()
        
        let textFieldMaker = { () -> UITextField in
            let textField = UITextField(frame: CGRectZero)
            textField.setTranslatesAutoresizingMaskIntoConstraints(false)
//            textField.backgroundColor = UIColor.yellowColor()
//            textField.borderStyle = .Line
//            textField.textColor = UIColor.yellowColor()
//            textField.textAlignment = .Center
            return textField
        }
        
//        let placeholderColor = ADNStyleKit.theTextColor.colorWithAlphaComponent(0.6)
        userNameTextField = textFieldMaker()
//        let attributedNamePlaceHolder = NSAttributedString(string: "Username", attributes: [NSForegroundColorAttributeName : placeholderColor])
//        userNameTextField.attributedPlaceholder = attributedNamePlaceHolder
        userNameTextField.placeholder = "Username"
        
        passwordTextField = textFieldMaker()
//        let attributedPasswordPlaceHolder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName : placeholderColor])
//        passwordTextField.attributedPlaceholder = attributedPasswordPlaceHolder
        passwordTextField.placeholder = "Password"
        
        loginButton = UIButton.buttonWithType(.System) as UIButton
        loginButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        loginButton.setTitle("Login", forState: .Normal)
        
        super.init(frame: frame)

        backgroundColor = ADNStyleKit.backgroundColor
        
        addSubview(titleLabel)
        addSubview(textFieldsHostView)
        textFieldsHostView.addSubview(userNameTextField)
        textFieldsHostView.addSubview(passwordTextField)
        addSubview(loginButton)
        
        let viewsDictionary = ["titleLabel" : titleLabel, "textFieldsHostView" : textFieldsHostView, "userNameTextField" : userNameTextField, "passwordTextField" : passwordTextField, "loginButton" : loginButton]
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-[titleLabel(==textFieldsHostView,==loginButton)]-|", options: nil, metrics: nil, views: viewsDictionary))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-50-[titleLabel]-30-[textFieldsHostView]-30-[loginButton]", options: .AlignAllLeft, metrics: nil, views: viewsDictionary))
        
        textFieldsHostView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-20-[userNameTextField(==passwordTextField)]-20-|", options: nil, metrics: nil, views: viewsDictionary))
        textFieldsHostView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[userNameTextField(==40,==passwordTextField)]-[passwordTextField]-10-|", options: .AlignAllLeft, metrics: nil, views: viewsDictionary))


    }
    
    convenience required init(coder aDecoder: NSCoder!) {
        self.init(frame: CGRectZero)
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */

}
