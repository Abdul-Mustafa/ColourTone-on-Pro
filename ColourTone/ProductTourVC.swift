//
//  ProductTourVC.swift
//  ColourTone
//
//  Created by Bilal Apps Dev on 10/09/2025.
//

import UIKit

class ProductTourVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
 
    
    
    
    
    
    
    
    @IBOutlet weak var dotsCollectionView: UICollectionView!
    
    let images = ["One", "Two", "Three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        dotsCollectionView.dataSource = self
        dotsCollectionView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
            
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DotsCVC", for: indexPath) as! DotsCVC
            
            cell.image.image = UIImage(named: "dot")
            
                return cell
            
        
        
        
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
            let cellWidth = (collectionView.frame.width / 3 )  // Adjust spacing as needed
            return CGSize(width: cellWidth - 10, height: cellWidth)
        
    }
    
    
    
}



class RoundedView: UIView {
    
    // Default radius
    var cornerRadius: CGFloat = 10 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = cornerRadius
    }
}
