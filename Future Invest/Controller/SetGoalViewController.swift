//
//  SetGoalViewController.swift
//  Future Invest
//
//  Created by Gerasim Israyelyan on 8/1/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit

class SetGoalViewController: UIViewController {
    
    var goal: Goal?

    @IBOutlet weak var slider: UISlider!
    @IBOutlet var bancViews: [UIView]!
    @IBOutlet weak var dropDownMenuView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var handleImage: UIImageView!
    @IBOutlet weak var investInGoal: UILabel!
    @IBOutlet weak var banksView: UIButton!
    @IBOutlet weak var banksviewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        dropDownMenuView.roundCorners(corners: [.topLeft, .topRight], radius: 10)
//        dropDownMenuView.clipsToBounds = true
        dropDownMenuView.layer.cornerRadius = 10
//        dropDownMenuView.clipsToBounds = false
        dropDownMenuView.layer.shadowOffset = CGSize(width: 0, height: 0)
        dropDownMenuView.layer.shadowColor = UIColor.black.cgColor
        dropDownMenuView.layer.shadowRadius = 1
        dropDownMenuView.layer.shadowOpacity = 0.3
        dropDownMenuView.layer.masksToBounds = true
        dropDownMenuView.clipsToBounds = false
        
                
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func hendleTapped(_ sender: UIButton) {
        bancViews.forEach { (view) in
            UIView.animate(withDuration: 0.3, animations: {
                view.isHidden.toggle()
                view.layer.opacity = view.isHidden ? 0 : 1
                self.handleImage.image = view.isHidden ? UIImage(named: "Layer 154-2") : UIImage(named: "Layer 154")
            })
        
        }
    }
    
    @IBAction func bankSelected(_ sender: UIButton) {
        
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        let val = round(sender.value / 5) * 5
        investInGoal.text = "$ \(Int(val))"
    }
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        banksviewButton.isEnabled = sender.isOn
        
        bancViews.forEach { (view) in
            UIView.animate(withDuration: 0.3, animations: {
                view.isHidden = !sender.isOn
                view.layer.opacity = view.isHidden ? 0 : 1
                self.handleImage.image = view.isHidden ? UIImage(named: "Layer 154-2") : UIImage(named: "Layer 154")
            })
            
        }
    }
    
}
