//
//  MenuViewController.swift
//  Future Invest
//
//  Created by Gerasim Israyelyan on 8/1/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate {
    func configureGoalsVC()
    func configureSavingUpVC()
    func configureResaultVC()
}

class MenuViewController: UIViewController {
    
    var delegate: MenuViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func myGoalsTapped(_ sender: Any) {
        delegate?.configureGoalsVC()
    }
    
    @IBAction func savingUpTapped(_ sender: Any) {
        delegate?.configureSavingUpVC()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
