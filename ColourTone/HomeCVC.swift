//
//  HomeCVC.swift
//  ColourTone
//
//  Created by Bilal Apps Dev on 04/09/2025.
//

import UIKit

class HomeCVC: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var biggerLabel: UILabel!
    @IBOutlet weak var smallerLabel: UILabel!
    override func awakeFromNib() {
           super.awakeFromNib()
           
           // Round the cell’s contentView
           contentView.layer.cornerRadius = 12
           contentView.layer.masksToBounds = true
//
//            biggerLabel.numberOfLines = 2          // 0 means unlimited lines
//            biggerLabel.lineBreakMode = .byWordWrapping
//
//            smallerLabel.numberOfLines = 2
//            smallerLabel.lineBreakMode = .byWordWrapping

        
       }
}
