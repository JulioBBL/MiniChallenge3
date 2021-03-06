//
//  InfoViewController.swift
//  MiniChallenge03
//
//  Created by Julio Brazil on 06/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit

class InfoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier?.contains("toDonatesTo"))! {
            (segue.destination as! WhoDonatesToViewController).donor = BloodType(rawValue: ((sender as! UIButton).titleLabel?.text)!)!
            segue.destination.hidesBottomBarWhenPushed = true
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
    // MARK: - Collection View Delegate
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell
        
        switch indexPath.row {
        case 0:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "doaRecebe", for: indexPath)
        //            cell.frame.size.height = 100
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "processoDoacao", for: indexPath)
        case 2:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teste", for: indexPath)
        default:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "outros", for: indexPath)
        }
        cell.layer.cornerRadius = 10
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let largura = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        
        switch indexPath.row {
        case 0:
            return CGSize(width: largura - 16, height: 200)
        case 1:
            return CGSize(width: largura - 16, height: 250)
        case 2:
            return CGSize(width: largura - 16, height: 108)
        default:
            return CGSize(width: largura - 16, height: 668)
        }
    }
}
