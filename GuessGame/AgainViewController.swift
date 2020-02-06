//
//  AgainViewController.swift
//  GuessGame
//
//  Created by 辜鹏 on 2019/9/28.
//  Copyright © 2019 PengGu. All rights reserved.
//

import UIKit

class AgainViewController: UIViewController {
    
    @IBOutlet weak var backImgView: UIImageView!
    
    @IBOutlet weak var scoreLb: UIButton!
    var passedscore:String?
    var passedLevel:CGFloat?

    
    var name:String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLb.setTitle(passedscore, for: .normal)
        
        if passedLevel == 4.0 {
          
            UserDefaults.standard.set(Int(passedscore!), forKey: "score")

        }
      
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
    
    @IBAction func againAction(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "refreshGame")))
        
    }
    
    
    @IBAction func homeAction(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
    }
}
