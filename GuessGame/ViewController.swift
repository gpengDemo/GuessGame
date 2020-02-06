//
//  ViewController.swift
//  GuessGame
//
//  Created by 辜鹏 on 2019/9/26.
//  Copyright © 2019 PengGu. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer?
    @IBOutlet weak var backImgView: UIImageView!
    
    var name:String?
    

    @IBOutlet weak var playbtn: UIButton!
    
    
    
        var pauseFlag = false {
            
            willSet {
                
                if newValue {
                    
                    playbtn.setImage(UIImage(named:"music_open copy"), for: .normal)
                    audioPlayer?.play()


                    
                } else {
                    
                   playbtn.setImage(UIImage(named:"music_open"), for: .normal)
                    audioPlayer?.pause()


                }
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        
        
        
        
        name = UserDefaults.standard.string(forKey: "back")
        
        if name == nil {
            
            name = "back"
            
        }
        backImgView.image = UIImage(named: name!)
        
        
        let path = Bundle.main.path(forResource: "bgmusic", ofType: "mp3")
        let pathURL = NSURL(fileURLWithPath: path!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: pathURL as URL)
        } catch {
            audioPlayer = nil
        }
        audioPlayer?.prepareToPlay()
        audioPlayer?.numberOfLoops = -1
        
        


        NotificationCenter.default.addObserver(self, selector: #selector(refreshback), name: Notification.Name.init(rawValue: "refreshback"), object: nil)
        
    }
    
    
    @objc func refreshback(){
        name = UserDefaults.standard.string(forKey: "back")
        backImgView.image = UIImage(named: name!)
    }
    
    
    
    @IBAction func playMusic(_ sender: Any) {
        
        pauseFlag = !pauseFlag
        
    }
    
    
}

