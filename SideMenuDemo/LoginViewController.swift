//
//  LoginViewController.swift
//  SideMenuDemo
//
//  Created by Hardip Kalola on 21/12/18.
//  Copyright © 2018 Hardip Kalola. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnLoginTapped(_ sender: UIButton) {
        //Setting the SideMenu as a MainViewController
        if let sideMenuController = sideMenuController {
            sideMenuController.sideMenuSetup(appDel.window!!, storyBoardIdentifier: "Main", mainViewController: ViewController.self)
        } else {
            sideMenuController = SideMenuController()
            sideMenuController?.sideMenuSetup(appDel.window!!, storyBoardIdentifier: "Main", mainViewController: ViewController.self)
        }
        
    }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
