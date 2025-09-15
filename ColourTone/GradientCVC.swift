//
//  GradientCollectionViewCell.swift
//  ColourTone
//
//  Created by Bilal Apps Dev on 15/09/2025.
//

import UIKit

class GradientCVC: UICollectionViewCell {
    
    @IBOutlet weak var gradientView: UIView!
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        gradientView.layer.cornerRadius = 10
        self.contentView.layer.cornerRadius = 10
    }
}
