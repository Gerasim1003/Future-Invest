//
//  ContainerViewController.swift
//  Future Invest
//
//  Created by Gerasim Israyelyan on 8/1/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, ResaultViewControllerDelegate {
    
    var controller: UIViewController!
    var menuviewController: UIViewController!
    var isMove: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureResaultVC()
    }
    

    func configureMenuVC() {
        if menuviewController == nil {
            menuviewController = MenuViewController()
            view.insertSubview(menuviewController.view, at: 0)
            addChild(menuviewController)
            print("menu vc config")
        }
    }
    
    func configureResaultVC() {
        let resultVC = ResaultViewController(nibName: "ResaultViewController", bundle: nil)
        controller = resultVC
        view.addSubview(controller.view)
        addChild(controller)
        resultVC.delegate = self
            
        
    }
    
    func showMenuViewController(shouldMove: Bool) {
        if shouldMove {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                            self.controller.view.frame.origin.x = self.controller.view.frame.width - 140
            }) { (finished) in
                
            }
        } else {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                            self.controller.view.frame.origin.x = 0
            }) { (finished) in
                
            }
        }
    }
    
    func toggleMenu() {
        configureMenuVC()
        isMove.toggle()
        showMenuViewController(shouldMove: isMove)
    }

}
