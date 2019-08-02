//
//  ResaultViewController.swift
//  Future Invest
//
//  Created by Gerasim Israyelyan on 8/1/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit

protocol ResaultViewControllerDelegate {
    func toggleMenu()
}

class ResaultViewController: UIViewController {

    var delegate: ResaultViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //        stackView.subviews.forEach { (view) in
        //            view.roundCorners(corners: [.topLeft, .topRight], radius: 10)
        //            view.layer.shadowOffset = CGSize(width: 40, height: -1)
        //            view.layer.shadowColor = UIColor.black.cgColor
        //            view.layer.masksToBounds = false
        //            view.layer.shadowRadius = 10
        //            view.layer.shadowOpacity = 0.5
        //
        //        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func menuButtonTapped(_ sender: UIButton) {
        delegate?.toggleMenu()
    }

}
