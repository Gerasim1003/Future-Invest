//
//  BankTableViewCell.swift
//  Future Invest
//
//  Created by Gerasim Israyelyan on 8/2/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit

class BankTableViewCell: UITableViewCell {

    @IBOutlet weak var bankImageView: UIImageView!
    @IBOutlet weak var bankNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setShadow() {
        bankImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        bankImageView.layer.shadowColor = UIColor.black.cgColor
        bankImageView.layer.shadowRadius = 1
        bankImageView.layer.shadowOpacity = 0.3
        bankImageView.layer.masksToBounds = true
        bankImageView.clipsToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
