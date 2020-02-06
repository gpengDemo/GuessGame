//
//  DescViewController.swift
//  GuessGame
//
//  Created by 辜鹏 on 2019/9/28.
//  Copyright © 2019 PengGu. All rights reserved.
//

import UIKit

class DescViewController: UIViewController {
    
    @IBOutlet weak var backImgView: UIImageView!
    
    var name:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        name = UserDefaults.standard.string(forKey: "back")
        
        if name == nil {
            
            name = "back"
            
        }
        backImgView.image = UIImage(named: name!)

        NotificationCenter.default.addObserver(self, selector: #selector(refreshback), name: Notification.Name.init(rawValue: "refreshback"), object: nil)
        
    }
    
    
    @objc func refreshback(){
        
        backImgView.image = UIImage(named: name!)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
