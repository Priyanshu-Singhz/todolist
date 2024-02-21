//
//  ViewController.swift
//  UiCollectionViw
//
//  Created by Zignuts Technolab on 21/02/24.
//

import UIKit

class ViewController: UIViewController {
    let productTypeName: [String] = ["Random1","Random2","Random3","Random4","Random5"]
    let productImageName: [String] = ["image1","image1","image1","image1","image1"]

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
        return productTypeName.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "testcell", for: indexPath) as! MyCollectionViewCell
        let index = indexPath.section
            let imageName = productImageName[index]
            
            print("Image Name: \(imageName)")
            
            if let image = UIImage(named: imageName) {
                cell.myImage.image = image
            } else {
                print("Image not found!")
            }
            
            cell.myLabel.text = productTypeName[index]
            
            return cell
    }
 /*   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width-10)/2
        return CGSize(width: size, height: size)
    }  */
    
}

