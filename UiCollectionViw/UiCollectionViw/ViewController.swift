//
//  ViewController.swift
//  UiCollectionViw
//
//  Created by Zignuts Technolab on 21/02/24.
//

import UIKit

class ViewController: UIViewController {
    let productTypeName: [String] = ["Random1","Linkedin","Skype","Twitter","YouTube"]
    let productImageName: [String] = ["image1","link","skype","twitter","yt"]

    @IBOutlet weak var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productTypeName.count
    }
    
   
    
   
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return productImageName.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "testcell", for: indexPath) as! MyCollectionViewCell
      
          
            
           
            
           
        cell.myImage.image = UIImage(named: productImageName[indexPath.row])
            
            
            cell.myLabel.text = productTypeName[indexPath.row]
        cell.layer.backgroundColor = UIColor.blue.cgColor
        
            
            return cell
    }
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width)
        return CGSize(width: size, height: size)
    }
    
}

