//
//  FilterCVC.swift
//  ColourTone
//
//  Created by Bilal Apps Dev on 16/09/2025.
//

import UIKit

class FilterCVC: UICollectionViewCell {
    @IBOutlet weak var category: UILabel!
    
    override func awakeFromNib() {
      super.awakeFromNib()
        self.contentView.layer.cornerRadius = 20
        
    }
}
