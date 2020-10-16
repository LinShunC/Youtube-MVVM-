//
//  NavigationViewController.swift
//  Youtube
//
//  Created by linshun on 17/7/20.
//  Copyright © 2020 lin shun. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = UIColor.rgb(red: 194, green: 31, blue: 31)
        
        view.addSubview(statusBarBackgroundView)
        view.addConstraintsWithFormat("H:|[v0]|", views: statusBarBackgroundView)
        
        let height = UIApplication.shared.statusBarFrame.height
        view.addConstraintsWithFormat("V:|[v0(\(height))]", views: statusBarBackgroundView)
    }
}
