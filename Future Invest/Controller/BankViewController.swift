//
//  BankViewController.swift
//  Future Invest
//
//  Created by Gerasim Israyelyan on 8/2/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit

class BankViewController: UIViewController {
    
    @IBOutlet weak var bankNameLAbel: UILabel!
    @IBOutlet weak var bankkImageView: UIImageView!
    var bank: Bank!
    var delegate: ResaultViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        bankkImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        bankkImageView.layer.shadowColor = UIColor.black.cgColor
        bankkImageView.layer.shadowRadius = 1
        bankkImageView.layer.shadowOpacity = 0.3
        bankkImageView.layer.masksToBounds = true
        bankkImageView.clipsToBounds = false
        
        bankNameLAbel.text = bank.name
        bankkImageView.image = bank.image
        // Do any additional setup after loading the view.
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
