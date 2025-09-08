//
//  ContrastMakerCVC.swift
//  ColourTone
//
//  Created by Bilal Apps Dev on 04/09/2025.
//

import UIKit

class ContrastMakerCVC: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupImageView()
        
    }
    
    private func setupImageView() {
           image.contentMode = .scaleAspectFit
           image.clipsToBounds = true
           image.translatesAutoresizingMaskIntoConstraints = false
       }

    
}
