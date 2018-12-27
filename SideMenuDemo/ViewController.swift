//
//  ViewController.swift
//  SideMenuDemo
//
//  Created by Hardip Kalola on 21/12/18.
//  Copyright © 2018 Hardip Kalola. All rights reserved.
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
    @IBAction func btnMenuTapped(_ sender: UIButton) {
        sideMenuController?.toggleMenu()
    }

}

