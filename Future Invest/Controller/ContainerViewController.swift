//
//  ContainerViewController.swift
//  Future Invest
//
//  Created by Gerasim Israyelyan on 8/1/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit
import Alamofire

class ContainerViewController: UIViewController, ResaultViewControllerDelegate, BanksTableViewControllerDelegate, MenuViewControllerDelegate, GoalsVCDelegate {
    
    let queryService = QueryService()
    
    var controller: UIViewController!
    var menuviewController: MenuViewController!
    var isMove: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureBanksVC()
    
    }
    
    func configureMenuVC() {
        if menuviewController == nil {
            menuviewController = MenuViewController() as MenuViewController
            menuviewController.delegate = self
            view.insertSubview(menuviewController.view, at: 0)
            addChild(menuviewController)
        }
    }
    
    func configureResaultVC() {
        removeFromParentVC()

        let resultVC = ResaultViewController(nibName: "ResaultViewController", bundle: nil)
        controller = resultVC
        view.addSubview(controller.view)
        addChild(controller)
        resultVC.delegate = self
    }
    
    func configureBanksVC() {
        removeFromParentVC()
        
        let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BanksTableViewController") as! BanksTableViewController
        controller = VC
        self.addChild(self.controller)
        
        UIView.transition(with: self.view, duration: 1, options: .transitionFlipFromLeft, animations: {
            self.view.addSubview(self.controller.view)

        }, completion: nil)
        
        VC.delegate = self
        VC.BDelegate = self
        
    }
    
    func configureBankVC(bank: Bank) {
        removeFromParentVC()

        let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BankViewController") as! BankViewController
        VC.bank = bank
        controller = VC
        view.addSubview(controller.view)
        addChild(controller)
        VC.delegate = self

    }
    
    func configureGoalsVC() {
        removeFromParentVC()
        
        let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GoalsTableViewController") as! GoalsTableViewController
        controller = VC
        view.addSubview(controller.view)
        addChild(controller)
        VC.delegate = self
    }
    
    func configureSavingUpVC() {
        removeFromParentVC()
        
        let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SavingUpViewController") as! SavingUpViewController
        queryService.getRequest(token: "", query: "savings") { (response) in
            if let value = response as? [String: String] {
                let meals = value["Meals"]
                let transportation = value["Transportation"]
                let saving = Savings(meals: meals!, Transportation: transportation!)
                VC.saving = saving
                self.controller = VC
                self.view.addSubview(self.controller.view)
                self.addChild(self.controller)
                VC.delegate = self
            }
        }
    }
    
    func addBankVCToChild(bank: Bank) {
        configureBankVC(bank: bank)

    }
    
    func removeFromParentVC() {
        if let controller = self.controller {
            controller.willMove(toParent: nil)
            controller.view.removeFromSuperview()
            controller.removeFromParent()
        }
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
