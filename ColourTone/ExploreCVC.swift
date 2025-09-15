//
//  ExploreCVC.swift
//  ColourTone
//
//  Created by Bilal Apps Dev on 13/09/2025.
//

import UIKit

class ExploreCVC: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let colors = ["#1E3A8A", "#10B981", "#F59E0B", "#EF4444", "#9333EA"]
    
    
    @IBOutlet weak var colorPalletesColorsCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        colorPalletesColorsCollectionView.dataSource = self
        colorPalletesColorsCollectionView.delegate = self
        colorPalletesColorsCollectionView.layer.cornerRadius = 20
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorPalletesColorsCVC", for: indexPath) as! ColorPalletesColorsCVC
        cell.palletesColor.backgroundColor = UIColor(hex: colors[indexPath.row])
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = (collectionView.frame.width)/CGFloat(colors.count)// Adjust spacing as needed
        let cellHeight = collectionView.frame.height
            return CGSize(width: cellWidth, height: cellHeight)
        
    }
}
