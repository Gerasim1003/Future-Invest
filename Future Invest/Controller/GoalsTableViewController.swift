//
//  GoalsTableViewController.swift
//  Future Invest
//
//  Created by Gerasim Israyelyan on 8/2/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit


protocol GoalsVCDelegate {
    func configureGoalsVC()
}

class GoalsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var delegate: ResaultViewControllerDelegate?
    var Gdelegate: GoalsVCDelegate?
    
    var goals: [Goal] = [
        Goal(image: UIImage(named: "Asset 5-8")!, name: "Car", percent: 15),
        Goal(image: UIImage(named: "Asset 6-8")!, name: "Home", percent: 15),
        Goal(image: UIImage(named: "Asset 7-8")!, name: "Phone", percent: 15),
        Goal(image: UIImage(named: "Asset 8-8")!, name: "Bicycle", percent: 15),
        Goal(image: UIImage(named: "Asset 9-8")!, name: "Bike", percent: 15),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    // MARK: - Table view data sourc


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return goals.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GoalsCell", for: indexPath) as? GoalsTableViewCell else { return UITableViewCell() }
        
        cell.goalImageView.image = goals[indexPath.row].image
        cell.goalName.text = "% \(Int(goals[indexPath.row].percent!))"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.goals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resultVC = ResaultViewController(nibName: "ResaultViewController", bundle: nil)
        let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ContainerViewController") as! ContainerViewController
        VC.configureResaultVC()
        resultVC.goal = goals[indexPath.row]
        resultVC.delegate = self.parent.self as! ContainerViewController
        Gdelegate?.configureGoalsVC()
        present(resultVC, animated: true, completion: nil)
    }

    @IBAction func menuTapped(_ sender: Any) {
        delegate?.toggleMenu()
    }
    @IBAction func editButton(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    
}
