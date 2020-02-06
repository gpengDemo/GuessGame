//
//  ChooselevelViewController.swift
//  GuessGame
//
//  Created by 辜鹏 on 2019/9/26.
//  Copyright © 2019 PengGu. All rights reserved.
//

import UIKit

class ChooselevelViewController: UIViewController {
    
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
    
    @IBAction func simpleAction(_ sender: Any) {
        
        let gameVc:GameViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        
        gameVc.passedLevel = 2.0
        navigationController?.pushViewController(gameVc, animated: true)
        
        
    }
    
    
    
    @IBAction func mediumAction(_ sender: Any) {
        
        let gameVc:GameViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        
        gameVc.passedLevel = 3.0
        navigationController?.pushViewController(gameVc, animated: true)
        
        
    }
    
    
    @IBAction func difficultAction(_ sender: Any) {
        
        let gameVc:GameViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        
        gameVc.passedLevel = 4.0
        navigationController?.pushViewController(gameVc, animated: true)
        
        
    }
    
    
}
