//
//  BackdropCell.swift
//  GuessGame
//
//  Created by 辜鹏 on 2019/9/26.
//  Copyright © 2019 PengGu. All rights reserved.
//

import UIKit

class BackdropCell: UICollectionViewCell {

    @IBOutlet weak var picView: UIImageView!
    @IBOutlet weak var isUsingBtn: UIButton!
    
    
    var pauseFlag = false {
        
        willSet {
            
            if newValue {
                
                isUsingBtn.setTitle("Using", for: .normal)

            } else {
                
                isUsingBtn.setTitle("Use", for: .normal)

            }
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
