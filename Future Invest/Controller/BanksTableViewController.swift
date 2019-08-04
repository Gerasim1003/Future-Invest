//
//  BanksTableViewController.swift
//  Future Invest
//
//  Created by Gerasim Israyelyan on 8/2/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit

protocol BanksTableViewControllerDelegate {
    func addBankVCToChild(bank: Bank)
}

class BanksTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: ResaultViewControllerDelegate?
    var BDelegate: BanksTableViewControllerDelegate?
    
    let banks: [Bank] = [Bank(image: UIImage(named: "bank_extrabig")!, name: "AmeriaBank"),
                         Bank(image: UIImage(named: "Ineco")!, name: "InecoBank"),
                         Bank(image: UIImage(named: "Evoca")!, name: "Evoca Bank")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func menuTapped(_ sender: Any) {
        self.delegate?.toggleMenu()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return banks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bankCell", for: indexPath) as? BankTableViewCell else { return UITableViewCell() }
        
        cell.bankImageView.image = banks[indexPath.row].image
        cell.bankNameLabel.text = banks[indexPath.row].name
        cell.setShadow()
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "bankSegue", sender: banks[indexPath.row])
        BDelegate?.addBankVCToChild(bank: banks[indexPath.row])
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "bankSegue" {
//            let vc = segue.destination as! BankViewController
//            vc.bank = sender as? Bank
//        }
//    }
}
