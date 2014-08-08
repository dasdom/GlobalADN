//
//  LoginViewController.swift
//  GlobalADN
//
//  Created by dasdom on 04.07.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    required convenience init(coder aDecoder: NSCoder!) {
        self.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = LoginView(frame: CGRectZero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
