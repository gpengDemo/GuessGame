//
//  BackdropViewController.swift
//  GuessGame
//
//  Created by 辜鹏 on 2019/9/26.
//  Copyright © 2019 PengGu. All rights reserved.
//

import UIKit

class BackdropViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var backImgView: UIImageView!
    
    var bgdataSources = ["back","b1","b2","b3","b4","b5"]
    
    var useState = [true,false,false,false,false,false]
    
    var score:Int?
    
    
    
    @IBOutlet weak var oneBtn: UIButton!
    @IBOutlet weak var twoBtn: UIButton!
    @IBOutlet weak var threeBtn: UIButton!
    @IBOutlet weak var fourBtn: UIButton!
    @IBOutlet weak var fiveBtn: UIButton!
    @IBOutlet weak var sixBtn: UIButton!
    
    
    var name:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        score = UserDefaults.standard.integer(forKey: "score")
        if score == nil {
            score = 5
        }
        
        setupUI()
        
        
        name = UserDefaults.standard.string(forKey: "back")
        
        if name == nil {
            
            name = "back"
            
        }
        backImgView.image = UIImage(named: name!)
        
        
        
    }
    
    
    @IBAction func oneAction(_ sender: Any) {
        
        
        collectionView.reloadData()

        collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .centeredHorizontally, animated: false)
        
        oneBtn.setImage(UIImage(named: "sel"), for: .normal)
        twoBtn.setImage(UIImage(named: "nor"), for: .normal)
        
        threeBtn.setImage(UIImage(named: "nor"), for: .normal)
        fourBtn.setImage(UIImage(named: "nor"), for: .normal)
        fiveBtn.setImage(UIImage(named: "nor"), for: .normal)
        sixBtn.setImage(UIImage(named: "nor"), for: .normal)
        
    }
    
    @IBAction func twoAction(_ sender: Any) {
        
        collectionView.reloadData()

        collectionView.scrollToItem(at: IndexPath(row: 1, section: 0), at: .centeredHorizontally, animated: false)
        oneBtn.setImage(UIImage(named: "nor"), for: .normal)
        twoBtn.setImage(UIImage(named: "sel"), for: .normal)
        
        threeBtn.setImage(UIImage(named: "nor"), for: .normal)
        fourBtn.setImage(UIImage(named: "nor"), for: .normal)
        fiveBtn.setImage(UIImage(named: "nor"), for: .normal)
        sixBtn.setImage(UIImage(named: "nor"), for: .normal)
        
        
        
    }
    
    @IBAction func threeAction(_ sender: Any) {
        
        collectionView.reloadData()

        collectionView.scrollToItem(at: IndexPath(row: 2, section: 0), at: .centeredHorizontally, animated: false)
        
        twoBtn.setImage(UIImage(named: "nor"), for: .normal)
        threeBtn.setImage(UIImage(named: "sel"), for: .normal)
        
        oneBtn.setImage(UIImage(named: "nor"), for: .normal)
        fourBtn.setImage(UIImage(named: "nor"), for: .normal)
        fiveBtn.setImage(UIImage(named: "nor"), for: .normal)
        sixBtn.setImage(UIImage(named: "nor"), for: .normal)
        
        
    }
    
    @IBAction func fourAction(_ sender: Any) {
        
        collectionView.reloadData()

        collectionView.scrollToItem(at: IndexPath(row: 3, section: 0), at: .centeredHorizontally, animated: false)
        threeBtn.setImage(UIImage(named: "nor"), for: .normal)
        fourBtn.setImage(UIImage(named: "sel"), for: .normal)
        
        oneBtn.setImage(UIImage(named: "nor"), for: .normal)
        twoBtn.setImage(UIImage(named: "nor"), for: .normal)
        fiveBtn.setImage(UIImage(named: "nor"), for: .normal)
        sixBtn.setImage(UIImage(named: "nor"), for: .normal)
        
        
        
    }
    
    @IBAction func fiveAction(_ sender: Any) {
        
        collectionView.reloadData()

        collectionView.scrollToItem(at: IndexPath(row: 4, section: 0), at: .centeredHorizontally, animated: false)
        
        fourBtn.setImage(UIImage(named: "nor"), for: .normal)
        fiveBtn.setImage(UIImage(named: "sel"), for: .normal)
        
        threeBtn.setImage(UIImage(named: "nor"), for: .normal)
        sixBtn.setImage(UIImage(named: "nor"), for: .normal)
        
        oneBtn.setImage(UIImage(named: "nor"), for: .normal)
        twoBtn.setImage(UIImage(named: "nor"), for: .normal)
        
        
    }
    
    
    @IBAction func sixAction(_ sender: Any) {
        
        collectionView.reloadData()

        collectionView.scrollToItem(at: IndexPath(row: 5, section: 0), at: .centeredHorizontally, animated: false)
        
        
        fiveBtn.setImage(UIImage(named: "nor"), for: .normal)
        sixBtn.setImage(UIImage(named: "sel"), for: .normal)
        
        oneBtn.setImage(UIImage(named: "nor"), for: .normal)
        twoBtn.setImage(UIImage(named: "nor"), for: .normal)
        
        threeBtn.setImage(UIImage(named: "nor"), for: .normal)
        fourBtn.setImage(UIImage(named: "nor"), for: .normal)
        
    }
    
    
    
    
    func setupUI() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let contentViewWidth = screenWidth - 60
        
        
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        layout.itemSize = CGSize(width:contentViewWidth , height: 509)
        
        layout.scrollDirection = .horizontal
        
        collectionView.collectionViewLayout = layout
        
        
        collectionView.register(UINib(nibName: "BackdropCell", bundle: nil), forCellWithReuseIdentifier: "BackdropCell")
        
    }
    
    
    
}

extension BackdropViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return bgdataSources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:BackdropCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BackdropCell", for: indexPath) as! BackdropCell
        
        cell.picView.image = UIImage(named: bgdataSources[indexPath.row])
        
        
        switch indexPath.row {
            
        case 0:
            cell.isUsingBtn.setTitle("Using", for: .normal)
            cell.pauseFlag = useState[indexPath.row]

            
        case 1:
            
            if score! > 5 {
                
                cell.isUsingBtn.setTitle("Use", for: .normal)
                cell.pauseFlag = useState[indexPath.row]
                
            }else{
                
                cell.isUsingBtn.setTitle("Difficult to do the (0/5) problem to unlock", for: .normal)
            }
            
        case 2:
            
            
            if score! > 10 {
                
                cell.isUsingBtn.setTitle("Use", for: .normal)
                cell.pauseFlag = useState[indexPath.row]
                
            }else{
                cell.isUsingBtn.setTitle("Difficult to do the (0/10) problem to unlock", for: .normal)
            }
            
        case 3:
            
            if score! > 15 {
                cell.isUsingBtn.setTitle("Use", for: .normal)
                cell.pauseFlag = useState[indexPath.row]
                
                
                
            }else{
                
                cell.isUsingBtn.setTitle("Difficult to do the (0/15) problem to unlock", for: .normal)
                
            }
        case 4:
            if score! > 20 {
                cell.isUsingBtn.setTitle("Use", for: .normal)
                cell.pauseFlag = useState[indexPath.row]
                
                
                
            }else{
                
                cell.isUsingBtn.setTitle("Difficult to do the (0/20) problem to unlock", for: .normal)
                
            }
        case 5:
            
            if score! > 25 {
                cell.isUsingBtn.setTitle("Use", for: .normal)
                cell.pauseFlag = useState[indexPath.row]
                
                
            }else{
                
                cell.isUsingBtn.setTitle("Difficult to do the (0/25) problem to unlock", for: .normal)
                
            }
            
        default:
            print("error")
        }
        
        let title = cell.isUsingBtn.titleLabel?.text
        
        
        if  (title?.contains("Difficult"))! {
            
            cell.isUsingBtn.isUserInteractionEnabled = false
            
        }else{
            cell.isUsingBtn.isUserInteractionEnabled = true
            cell.isUsingBtn.addTarget(self, action: #selector(useAction(_:)), for: .touchUpInside)

        }
        
        
        return cell
        
    }
    
    
    @objc func useAction(_ sender:UIButton)  {
        
        let hitPoint = sender.convert(CGPoint.zero, to: collectionView )
        var hitIndex: IndexPath? = collectionView.indexPathForItem(at: hitPoint)
        
        
        
        
        backImgView.image = UIImage(named:bgdataSources[hitIndex!.row] )
        
        UserDefaults.standard.set(bgdataSources[hitIndex!.row], forKey: "back")
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "refreshback")))
        
        let cell =  collectionView.cellForItem(at: hitIndex!) as!BackdropCell
        
        
        if cell.pauseFlag == true {
            return
        }
        cell.pauseFlag = !useState[hitIndex!.row]
        
        useState[hitIndex!.row] = cell.pauseFlag
        
        
        let left = [0,1,2,3,4,5]
        
        let exceptdata = left.filter { $0 != hitIndex!.row }
        
        for item in exceptdata {
            
            useState[item] = false
            
        }
        collectionView.reloadData()
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetX = scrollView.contentOffset.x
        
        switch offsetX {
            
        case 0.0:
            
            oneBtn.setImage(UIImage(named: "sel"), for: .normal)
            twoBtn.setImage(UIImage(named: "nor"), for: .normal)
            
            threeBtn.setImage(UIImage(named: "nor"), for: .normal)
            fourBtn.setImage(UIImage(named: "nor"), for: .normal)
            fiveBtn.setImage(UIImage(named: "nor"), for: .normal)
            sixBtn.setImage(UIImage(named: "nor"), for: .normal)
            
            
            
        case 335...374:
            oneBtn.setImage(UIImage(named: "nor"), for: .normal)
            twoBtn.setImage(UIImage(named: "sel"), for: .normal)
            
            threeBtn.setImage(UIImage(named: "nor"), for: .normal)
            fourBtn.setImage(UIImage(named: "nor"), for: .normal)
            fiveBtn.setImage(UIImage(named: "nor"), for: .normal)
            sixBtn.setImage(UIImage(named: "nor"), for: .normal)
            
            
        case 670...748:
            twoBtn.setImage(UIImage(named: "nor"), for: .normal)
            threeBtn.setImage(UIImage(named: "sel"), for: .normal)
            
            oneBtn.setImage(UIImage(named: "nor"), for: .normal)
            fourBtn.setImage(UIImage(named: "nor"), for: .normal)
            fiveBtn.setImage(UIImage(named: "nor"), for: .normal)
            sixBtn.setImage(UIImage(named: "nor"), for: .normal)
            
            
        case 1005...1122:
            threeBtn.setImage(UIImage(named: "nor"), for: .normal)
            fourBtn.setImage(UIImage(named: "sel"), for: .normal)
            
            oneBtn.setImage(UIImage(named: "nor"), for: .normal)
            twoBtn.setImage(UIImage(named: "nor"), for: .normal)
            fiveBtn.setImage(UIImage(named: "nor"), for: .normal)
            sixBtn.setImage(UIImage(named: "nor"), for: .normal)
            
            
            
        case 1340...1496:
            fourBtn.setImage(UIImage(named: "nor"), for: .normal)
            fiveBtn.setImage(UIImage(named: "sel"), for: .normal)
            
            threeBtn.setImage(UIImage(named: "nor"), for: .normal)
            sixBtn.setImage(UIImage(named: "nor"), for: .normal)
            
            oneBtn.setImage(UIImage(named: "nor"), for: .normal)
            twoBtn.setImage(UIImage(named: "nor"), for: .normal)
            
            
        case 1675...1870:
            fiveBtn.setImage(UIImage(named: "nor"), for: .normal)
            sixBtn.setImage(UIImage(named: "sel"), for: .normal)
            
            oneBtn.setImage(UIImage(named: "nor"), for: .normal)
            twoBtn.setImage(UIImage(named: "nor"), for: .normal)
            
            threeBtn.setImage(UIImage(named: "nor"), for: .normal)
            fourBtn.setImage(UIImage(named: "nor"), for: .normal)
            
            
            
        default:
            print("error")
        }
        
    }
    
}
