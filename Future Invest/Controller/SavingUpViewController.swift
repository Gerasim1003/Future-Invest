//
//  SavingUpViewController.swift
//  Future Invest
//
//  Created by Gerasim Israyelyan on 8/3/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit

class SavingUpViewController: UIViewController {
    @IBOutlet weak var transportLabel: UILabel!
    @IBOutlet weak var shoppingLabel: UILabel!
    
    var saving = Savings(meals: "-20%", Transportation: "-40%")
    
    var delegate: ResaultViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        transportLabel.text = saving.Transportation
        shoppingLabel.text = saving.meals
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func menuTapped(_ sender: Any) {
        delegate?.toggleMenu()
    }
    
}
