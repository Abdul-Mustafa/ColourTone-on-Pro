//
//  Home.swift
//  ColourTone
//
//  Created by Bilal Apps Dev on 04/09/2025.
//

struct CellData {
    let image: UIImage
    let title: String
    let subtitle: String
}

import UIKit

class Home: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var homeCVC: UICollectionView!
    
    
    var data: [CellData] = [
        CellData(image: UIImage(named: "palette-icon")!, title: "Create Palette or Gradient", subtitle: "Build from scratch or blend"),
        CellData(image: UIImage(named: "image-icon")!, title: "Image to Pallete", subtitle: "Extract colors from photos"),
        CellData(image: UIImage(named: "contrast-icon")!, title: "Contrast Maker", subtitle: "check accesibilty contrast"),
        CellData(image: UIImage(named: "save-icon")!, title: "My Creations", subtitle: "All saved palettes & gradients")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCVC.delegate = self
        homeCVC.dataSource = self
        homeCVC.showsVerticalScrollIndicator = false
        homeCVC.showsHorizontalScrollIndicator = false
        
        
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count // Changed from 1 to see multiple cells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCVC", for: indexPath) as! HomeCVC
        cell.image.image = data[indexPath.row].image
        cell.biggerLabel.text = data[indexPath.row].title
        cell.smallerLabel.text = data[indexPath.row].subtitle
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Set fixed width and height for each cell
        let width = collectionView.bounds.width
        return CGSize(width: width, height: width/2.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        switch indexPath.row {
        case 0:
            let createPaletteVC = storyboard?.instantiateViewController(withIdentifier: "CreatePalletesVC") as! CreatePalletesVC
            createPaletteVC.modalPresentationStyle = .fullScreen
            present(createPaletteVC, animated: true, completion: nil)
        case 1:
            let createPaletteVC = storyboard?.instantiateViewController(withIdentifier: "UploadImageVC") as! UploadImageVC
            createPaletteVC.modalPresentationStyle = .fullScreen
            present(createPaletteVC, animated: true, completion: nil)
        case 2:
            let createPaletteVC = storyboard?.instantiateViewController(withIdentifier: "ContrastMakerVC") as! ContrastMakerVC
            createPaletteVC.modalPresentationStyle = .fullScreen
            present(createPaletteVC, animated: true, completion: nil)
        case 3:
            let createPaletteVC = storyboard?.instantiateViewController(withIdentifier: "LaunchScreen") as! LaunchScreen
            createPaletteVC.modalPresentationStyle = .fullScreen
            present(createPaletteVC, animated: true, completion: nil)
        default:
            print("Unknown selection")
        }
    }
}
