//
//  TextField.swift
//  Future Invest
//
//  Created by Gerasim Israyelyan on 7/31/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit

class TextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        let height = self.frame.height
        self.clipsToBounds = true
        self.layer.cornerRadius = height / 2
        self.layer.borderWidth = 1.5
        self.layer.borderColor = #colorLiteral(red: 0.4037267566, green: 0.8625342846, blue: 0.2921340466, alpha: 1)
        
    }

}
