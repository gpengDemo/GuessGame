//
//  GameViewController.swift
//  GuessGame
//
//  Created by 辜鹏 on 2019/9/26.
//  Copyright © 2019 PengGu. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backImgView: UIImageView!
    
    
    @IBOutlet weak var contentView: UIImageView!
    
    var dataSources = ["cherries","strawberry","pear","avocado","watermelon","dragon_fruit","banana","mango","pineapple","tomato","corn","chili","cabbage","broccoli","cucumber","pod","pumpkin","onion","mushroom"]
    
    
    var correntdataSources:[String] = [String]()
    var answer:String?
    
    var correctIndex = 0
    
    
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var coverImgView: UIImageView!
    
    var coverPicDataSources = ["pentagram","heart","diamond"]
    
    
    var passedLevel:CGFloat?
    
    var name:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
         let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
         self.navigationItem.backBarButtonItem = item

        
        dataSources.shuffle()
        correntdataSources.append(dataSources[0])
        correntdataSources.append(dataSources[1])
        correntdataSources.append(dataSources[2])
        correntdataSources.append(dataSources[3])
        
        let answerIndex = Int.random(in: 0...3)
        answer = correntdataSources[answerIndex]
        
        setupUI()
        
        contentView.image = UIImage(named: answer!)?.withRenderingMode(.alwaysTemplate)
        
        self.title = "NO.\(correctIndex)"
        
        setupCover()
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshGame), name: Notification.Name.init(rawValue: "refreshGame"), object: nil)
        
        
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
    
    @objc func refreshGame(){
        
        dataSources.shuffle()
        correntdataSources.removeAll()
        correntdataSources.append(dataSources[0])
        correntdataSources.append(dataSources[1])
        correntdataSources.append(dataSources[2])
        correntdataSources.append(dataSources[3])
        
        let answerIndex = Int.random(in: 0...3)
        answer = correntdataSources[answerIndex]
        contentView.image = UIImage(named: answer!)?.withRenderingMode(.alwaysTemplate)
        
        correctIndex = 0
        
        self.title = "NO.\(correctIndex)"
        
        initConstraint()

        setupCover()
        
        
        collectionView.reloadData()
        
    }
    
    func initConstraint()  {
        
        topConstraint.constant = 0
        bottomConstraint.constant = 0
        leadingConstraint.constant = 0
        trailingConstraint.constant = 0
        coverImgView.backgroundColor = .clear
        
    }
    
    func setupCover()  {
        
        let totalCoverWidth = (screenWidth - 47) / passedLevel!
        
        let totalCoverHeight = 230 / passedLevel!
        
        let randomIndex = Int.random(in: 0...6)
        
        switch randomIndex {
            
        case 0:
            // top
            coverImgView.image = UIImage()
            topConstraint.constant = CGFloat(-totalCoverHeight)
            coverImgView.backgroundColor = UIColor(displayP3Red: 213/255.0, green: 213/255.0, blue: 213/255.0, alpha: 1)
        case 1:
            // left
            coverImgView.image = UIImage()
            leadingConstraint.constant = -totalCoverWidth
            coverImgView.backgroundColor = UIColor(displayP3Red: 213/255.0, green: 213/255.0, blue: 213/255.0, alpha: 1)
        case 2:
            // bottom
            coverImgView.image = UIImage()
            bottomConstraint.constant = CGFloat(totalCoverHeight)
            coverImgView.backgroundColor = UIColor(displayP3Red: 213/255.0, green: 213/255.0, blue: 213/255.0, alpha: 1)
        case 3:
            // right
            coverImgView.image = UIImage()
            trailingConstraint.constant = totalCoverWidth
            coverImgView.backgroundColor = UIColor(displayP3Red: 213/255.0, green: 213/255.0, blue: 213/255.0, alpha: 1)
            
        case 4:
            initConstraint()
            coverImgView.image = UIImage(named: coverPicDataSources[0])
        case 5:
            initConstraint()

            coverImgView.image = UIImage(named: coverPicDataSources[1])
        case 6:
            initConstraint()
            coverImgView.image = UIImage(named: coverPicDataSources[2])
        default:
            print("error")
        }
        
        
    }
    
    func setupUI() {
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName:"GameCell", bundle: nil), forCellWithReuseIdentifier: "GameCell")
        
        let layout = UICollectionViewFlowLayout()
        
        
        
        let contentW = (screenWidth / 2) - 40
        
        layout.itemSize = CGSize(width: contentW, height: 127 )
        
        
        
        // 上下间隔
        layout.minimumLineSpacing = 10.0
        
        //左右间隔
        layout.minimumInteritemSpacing = 10.0
        
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        
        layout.scrollDirection = .vertical
        
        collectionView.collectionViewLayout = layout
        
        
    }
    
    
    
}

@available(iOS 11.0, *)
extension GameViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return correntdataSources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:GameCell  = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
        
        cell.picBtn.imageView?.contentMode = .scaleAspectFit
        cell.picBtn.setImage( UIImage(named: correntdataSources[indexPath.row]), for: .normal)
        
        return cell
        
    }
    
    
    @available(iOS 11.0, *)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if correntdataSources[indexPath.row] != answer {
            
            let failureVc:AgainViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AgainViewController") as! AgainViewController
            failureVc.passedscore = String(correctIndex)
            failureVc.passedLevel = passedLevel
            
            navigationController?.pushViewController(failureVc, animated: true)
            
            
            
            
        }else {
            
            // correct answer  continue ...
            
            correctIndex = correctIndex + 1
            dataSources.shuffle()
            
            correntdataSources.removeAll()
            correntdataSources.append(dataSources[0])
            correntdataSources.append(dataSources[1])
            correntdataSources.append(dataSources[2])
            correntdataSources.append(dataSources[3])
            
            let answerIndex = Int.random(in: 0...3)
            answer = correntdataSources[answerIndex]
            
            collectionView.reloadData()
            contentView.image = UIImage(named: answer!)?.withRenderingMode(.alwaysTemplate)
            self.title = "NO.\(correctIndex)"
            
            initConstraint()
            setupCover()
            
            collectionView.reloadData()
            
        }
        
        
        
    }
    
    
    
}
