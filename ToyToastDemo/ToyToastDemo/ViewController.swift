//
//  ViewController.swift
//  ToyToastDemo
//
//  Created by Tachibana Kaoru on 4/19/15.
//  Copyright (c) 2015 Toyship.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showDarkGrayToast(sender: AnyObject) {
        
        var mytoast : ToyToastViewController = ToyToastViewController(
            title:"Lorem ipsum",
            message:"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style:ColorStyle.DarkGray)
        
        self.present(mytoast,
            animated: true,
            completion: nil)

    }

    @IBAction func showLightGrayToast(sender: AnyObject) {
        
        var mytoast : ToyToastViewController = ToyToastViewController(
            title:"Lorem ipsum",
            message:"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style:ColorStyle.LightGray)
        
        self.present(mytoast,
            animated: true,
            completion: nil)

    }
    
    @IBAction func showWhiteToast(sender: AnyObject) {
        
        var mytoast : ToyToastViewController = ToyToastViewController(
            title:"Lorem ipsum",
            message:"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style:ColorStyle.White)
        
        self.present(mytoast,
            animated: true,
            completion: nil)

    }

    @IBAction func showToastLonger(sender: AnyObject) {
        
        var mytoast : ToyToastViewController = ToyToastViewController(
            title:"Lorem ipsum",
            message:"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style:ColorStyle.DarkGray)
        mytoast.showtime = 5.0
        
        self.present(mytoast,
            animated: true,
            completion: nil)

    }
    
    @IBAction func showToastWithoutTitle(sender: AnyObject) {
        
        var mytoast : ToyToastViewController = ToyToastViewController(
            title:"",
            message:"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style:ColorStyle.White)
        
        self.present(mytoast,
            animated: true,
            completion: nil)

    }
}

