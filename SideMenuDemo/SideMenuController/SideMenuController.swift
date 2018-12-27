//
//  SideMenuController.swift
//  Sohil Memon
//

import Foundation
import UIKit

class SideMenuController: UIViewController, UIGestureRecognizerDelegate {
    
    var mainContainer : UIViewController?
    var menuContainer : UIViewController?
    var bgImageContainer : UIImageView?
    var distanceOpenMenu : CGFloat = 0
    var sideMenuControllerIdentifier: String = "sideMenuID"
    
    var tapGestureRecognizer = UITapGestureRecognizer()
    var tempView: UIView?
    
    var menuViewController : UIViewController?{
        willSet{
            if (self.menuViewController != nil) {
                self.menuViewController?.willMove(toParentViewController: nil)
                self.menuViewController?.removeFromParentViewController()
                self.menuViewController?.view.removeFromSuperview()
            }
        }
        
        didSet{
            self.menuViewController!.view.frame = self.view.bounds;
            self.menuContainer?.addChildViewController(self.menuViewController!)
            self.menuContainer?.view.addSubview(self.menuViewController!.view)
            self.menuContainer?.didMove(toParentViewController: self.menuViewController)
        }
    }
    
    var mainViewController : UIViewController?{
        willSet{
            if (self.mainViewController != nil) {
                self.mainViewController?.willMove(toParentViewController: nil)
                self.mainViewController?.removeFromParentViewController()
                self.mainViewController?.view.removeFromSuperview()
            }
        }
        
        didSet{
            closeMenu()
            self.mainViewController!.view.frame = self.view.bounds;
            self.mainContainer?.addChildViewController(self.mainViewController!)
            self.mainContainer?.view.addSubview(self.mainViewController!.view)
            self.mainViewController?.didMove(toParentViewController: self.mainContainer)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Intitial Setup for loading SideMenu
        setUp()
    }
    
    //MARK: Initital Setup of View Controllers
    
    func setUp(){
        
        self.distanceOpenMenu = self.view.frame.size.width * 0.8
        self.view.backgroundColor = UIColor.white;
        self.menuContainer = UIViewController()
        self.menuContainer!.view.frame = self.view.bounds;
        self.menuContainer!.view.backgroundColor = UIColor.clear;
        self.addChildViewController(self.menuContainer!)
        self.view.addSubview(self.menuContainer!.view)
        self.menuContainer?.didMove(toParentViewController: self)
        
        self.mainContainer = UIViewController()
        self.mainContainer!.view.frame = self.view.bounds;
        self.mainContainer!.view.backgroundColor = UIColor.clear;
        self.addChildViewController(self.mainContainer!)
        self.view.addSubview(self.mainContainer!.view)
        self.mainContainer?.didMove(toParentViewController: self)
    }
    
    //MARK: Open Side Menu with Animations
    
    func openMenu(){
        
        var fMain : CGRect = self.mainContainer!.view.frame
        fMain.origin.x = self.distanceOpenMenu;
        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
                self.mainContainer!.view.frame = fMain
                self.tempView = UIView(frame: CGRect(x: 0, y: 0, width: self.mainContainer!.view.frame.size.width, height: self.mainContainer!.view.frame.size.height))
                self.mainContainer?.view.addSubview(self.tempView!)
                self.addTapGestures()
            }) { (finished: Bool) -> Void in
                
        }
    }
    
    //MARK: Close Side Menu
    
    func closeMenu(){
        
        tempView?.removeGestureRecognizer(tapGestureRecognizer)
        var fMain : CGRect = self.mainContainer!.view.frame
        fMain.origin.x = 0
        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
                self.mainContainer!.view.frame = fMain
                if self.tempView != nil {
                    self.tempView?.removeFromSuperview()
                    self.tempView = nil
                }
            }) { (finished: Bool) -> Void in
                
        }
    }
    
    //MARK: Add Gesture to close the menu with UITapGestureRecognizer
    
    func addTapGestures(){
        
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SideMenuController.tapMainAction))
        tempView?.addGestureRecognizer(tapGestureRecognizer)
    }
    
    //MARK: UITapGestureRecognizer Action Recognizer
    
    @objc func tapMainAction(){
        
        closeMenu()
    }
    
    //MARK: Close or open Menu using Action
    
    func toggleMenu(){
        if (self.mainContainer!.view.frame.minX == self.distanceOpenMenu) {
           closeMenu()
        }else{
           openMenu()
        }
    }
    
    //MARK: Get UINavigation Controller
    func getNavigationController() -> UINavigationController? {
        if let navigation = mainViewController as? UINavigationController {
            return navigation
        }
        return nil
    }
    
    //MARK: Set Intial View Controller from any of the Class
    
    func setIntialMainViewController(_ storyBoardIdentifier: String, mainViewController: UIViewController.Type) -> Self {
        
        let mainStoryboard = UIStoryboard(name: storyBoardIdentifier, bundle: nil)
        let sideMenuControllerVC = mainStoryboard.instantiateViewController(withIdentifier: sideMenuControllerIdentifier)
        let mainControllerVC = mainStoryboard.instantiateViewController(withIdentifier: String(describing: mainViewController))
        let navigationController : UINavigationController = UINavigationController(rootViewController: mainControllerVC)
        navigationController.isNavigationBarHidden = true
        self.view.frame = UIScreen.main.bounds
        self.mainViewController = navigationController
        self.menuViewController = sideMenuControllerVC
        return self
    }
    
    func sideMenuSetup(_ window: UIWindow, storyBoardIdentifier: String, mainViewController: UIViewController.Type) {
        window.rootViewController = setIntialMainViewController(storyBoardIdentifier, mainViewController: mainViewController)
    }
}
