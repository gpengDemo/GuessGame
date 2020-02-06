//
//  CaseViewController.swift
//  GuessGame
//
//  Created by 辜鹏 on 2019/9/26.
//  Copyright © 2019 PengGu. All rights reserved.
//

import UIKit

class CaseViewController: UIViewController {

   @IBOutlet weak var backImgView: UIImageView!

    var fruits = ["cherries","strawberry","pear","avocado","watermelon","dragon_fruit","banana","mango","pineapple"]
    var  vets = ["tomato","corn","chili","cabbage","broccoli","cucumber","pod","pumpkin","onion","mushroom"]
    
    var dataSources:[String]?
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var vegetablesBtn: UIButton!
    @IBOutlet weak var fruitBtn: UIButton!
    var name:String?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
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
    
    
    @IBAction func vegetablesAction(_ sender: Any) {
        
        vegetablesBtn.setTitleColor(.white, for: .normal)
        fruitBtn.setTitleColor(.lightGray, for: .normal)
        dataSources = vets
        tableView.reloadData()
    }
    
    
    @IBAction func fruitAction(_ sender: Any) {
        
        vegetablesBtn.setTitleColor(.lightGray, for: .normal)
        fruitBtn.setTitleColor(.white, for: .normal)

        dataSources = fruits
        tableView.reloadData()

        
    }
    

    
    func setupUI() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        tableView.register(UINib.init(nibName: "CaseCell", bundle: nil), forCellReuseIdentifier: "CaseCell")
        
        tableView.separatorStyle = .none
        
        dataSources = vets
        
    }
    
    
    
    


    
    
}

extension CaseViewController :UITableViewDataSource,UITableViewDelegate {
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSources!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CaseCell = tableView.dequeueReusableCell(withIdentifier: "CaseCell", for: indexPath) as! CaseCell
        
        cell.picBtn.setImage(UIImage(named: dataSources![indexPath.row]), for: .normal)
        
        return cell
        
    }
    
    
    
}
