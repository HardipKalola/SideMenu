//
//  SideMenuVC.swift
//  SideMenuDemo
//
//  Created by Hardip Kalola on 21/12/18.
//  Copyright © 2018 Hardip Kalola. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnMainViewTapped(_ sender: Any) {
        if let mainController = sideMenuController?.mainContainer, mainController.childViewControllers.count > 0, let navigation = mainController.childViewControllers[0] as? UINavigationController, navigation.viewControllers.count > 0, navigation.viewControllers[0] is ViewController {
            sideMenuController?.closeMenu()
            return
        }
        _ = sideMenuController?.setIntialMainViewController("Main", mainViewController: ViewController.self) //

    }
    @IBAction func btnSecondViewTapped(_ sender: Any) {
        sideMenuController?.closeMenu()
        _ = sideMenuController?.setIntialMainViewController("Main", mainViewController: SecondViewController.self) // Course Schedule
    }
    @IBAction func btnFirstVc(_ sender: UIButton) {
        
    }
    @IBAction func btnSecondVC(_ sender: UIButton) {
//        sideMenuController?.closeMenu()
//        _ = sideMenuController?.setIntialMainViewController("Main", mainViewController: SecondViewController.self) // Course Schedule
        if let mainController = sideMenuController?.mainContainer, mainController.childViewControllers.count > 0, let navigation = mainController.childViewControllers[0] as? UINavigationController, navigation.viewControllers.count > 0, navigation.viewControllers[0] is SecondViewController {
            sideMenuController?.closeMenu()
            return
        }
        _ = sideMenuController?.setIntialMainViewController("Main", mainViewController: SecondViewController.self)
    }
}
