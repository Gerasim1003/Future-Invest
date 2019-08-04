//
//  GoalsViewController.swift
//  Future Invest
//
//  Created by Gerasim Israyelyan on 7/31/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit

class GoalsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let goals: [Goal] = [
        Goal(image: UIImage(named: "Asset 5-8")!, name: "Car", percent: nil),
        Goal(image: UIImage(named: "Asset 6-8")!, name: "Home", percent: nil),
        Goal(image: UIImage(named: "Asset 7-8")!, name: "Phone", percent: nil),
        Goal(image: UIImage(named: "Asset 8-8")!, name: "Bicycle", percent: nil),
        Goal(image: UIImage(named: "Asset 9-8")!, name: "Bike", percent: nil),
        Goal(image: UIImage(named: "+")!, name: "Add your", percent: nil),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self

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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return goals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "goalCell", for: indexPath) as? GoalsCollectionViewCell else { return UICollectionViewCell() }
        
        cell.goalImageview.image = goals[indexPath.row].image
        cell.goalNameLabel.text = goals[indexPath.row].name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "setGoal", sender: goals[indexPath.row])
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "setGoal" {
            let vc = segue.destination as! SetGoalViewController
            vc.goal = sender as? Goal
        }
    }
    
}
