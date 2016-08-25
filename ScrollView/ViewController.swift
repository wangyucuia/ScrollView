//
//  ViewController.swift
//  ScrollView
//
//  Created by 王玉翠 on 16/8/24.
//  Copyright © 2016年 WYC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIApplication.sharedApplication().statusBarHidden = true
        
        let leftView:LeftView = LeftView(nibName: "LeftView",bundle: nil)
        let centerView:CameraView = CameraView(nibName:"CameraView",bundle: nil)
        let right:RigthView = RigthView(nibName: "RigthView",bundle: nil)
        
        self.addChildViewController(leftView)
        self.scrollView.addSubview(leftView.view)
        leftView.didMoveToParentViewController(self)
        
        self.addChildViewController(centerView)
        self.scrollView.addSubview(centerView.view)
        centerView.didMoveToParentViewController(self)
        
        self.addChildViewController(right)
        self.scrollView.addSubview(right.view)
        right.didMoveToParentViewController(self)
        
        var centerFrame:CGRect = centerView.view.frame
        centerFrame.origin.x = self.view.frame.size.width
        centerView.view.frame = centerFrame
        
        var rightViewFrame:CGRect = right.view.frame
        rightViewFrame.origin.x = self.view.frame.size.width * 2
        right.view.frame = rightViewFrame
        
        
        
        self.scrollView.contentSize = CGSize.init(width: self.view.frame.size.width * 3, height: self.view.frame.size.height)
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

