//
//  ContrastMakerVC.swift
//  ColourTone
//
//  Created by Bilal Apps Dev on 04/09/2025.
//
import UIKit


class ContrastMakerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionViewInContrastMaker: UICollectionView!
    @IBOutlet weak var contrastColorsCollectionView: UICollectionView!
    
    let colors = ["#1E3A8A","#F59E0B","#10B981","#F43F5E"]
    let unselected = ["two-nodes", "three-nodes", "triangle","square" ]
    let selected = ["selected-two-nodes", "selected-three-nodes","selected-triangle","selected-square"]
    var numberOfColors = 2
    let radius: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 56 : 28
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        collectionViewInContrastMaker.delegate = self
        collectionViewInContrastMaker.dataSource = self
        contrastColorsCollectionView.delegate = self
        contrastColorsCollectionView.dataSource = self
        
        UIDevice.current.userInterfaceIdiom == .pad ? (collectionViewInContrastMaker.layer.cornerRadius = 46) : (collectionViewInContrastMaker.layer.cornerRadius = 28) // for example
      
        
        // Select first item by default
        let firstIndexPath = IndexPath(item: 0, section: 0)
        collectionViewInContrastMaker.selectItem(at: firstIndexPath, animated: false, scrollPosition: [])
        
        // Manually update the first cell's image to selected state
        DispatchQueue.main.async {
            if let cell = self.collectionViewInContrastMaker.cellForItem(at: firstIndexPath) as? ContrastMakerCVC {
                cell.image.image = UIImage(named: self.selected[0])
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewInContrastMaker {
            return unselected.count
        }
        else {
            return numberOfColors
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewInContrastMaker {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContrastMakerCVC", for: indexPath) as! ContrastMakerCVC
//            
//            // Check if this cell should be selected (first item by default)
//            let isSelectedCell = collectionView.indexPathsForSelectedItems?.contains(indexPath) ?? false
//            cell.image.image = UIImage(named: isSelectedCell ? selected[indexPath.item] : unselected[indexPath.row])
//            
//            return cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContrastMakerCVC", for: indexPath) as! ContrastMakerCVC
                    let isSelectedCell = collectionView.indexPathsForSelectedItems?.contains(indexPath) ?? false
                    let imageName = isSelectedCell ? selected[indexPath.item] : unselected[indexPath.item]
                    let image = UIImage(named: imageName)
            cell.image.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                cell.image.widthAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 114 : 57),
                cell.image.heightAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 114 : 57)
            ])
                    cell.image.image = image
                    return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContrastColorsCVC", for: indexPath) as! ContrastColorsCVC
            cell.colorView.backgroundColor =  UIColor(hex: colors[indexPath.item])
            // Reset corners before applying new logic
            cell.colorView.layer.cornerRadius = 0
            cell.colorView.layer.maskedCorners = []
            

            // Determine if the cell is the first or last
            let isFirstCell = indexPath.item == 0
            let isLastCell = indexPath.item == collectionView.numberOfItems(inSection: indexPath.section) - 1

            if isFirstCell || isLastCell {
                cell.colorView.layer.cornerRadius = radius
                if isFirstCell {
                    cell.colorView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
                } else if isLastCell {
                    cell.colorView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
                }
            }

            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewInContrastMaker {
            switch indexPath.item {
            case 0:
                numberOfColors = 2
            case 1:
                numberOfColors = 3
            case 2:
                numberOfColors = 3
            case 3:
                numberOfColors = 4
            default:
                numberOfColors = 0
            }
            
            if let cell = collectionView.cellForItem(at: indexPath) as? ContrastMakerCVC {
                cell.image.image = UIImage(named: selected[indexPath.row])
            }
            contrastColorsCollectionView.reloadData()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewInContrastMaker {
            if let cell = collectionView.cellForItem(at: indexPath) as? ContrastMakerCVC {
                cell.image.image = UIImage(named: unselected[indexPath.row])
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionViewInContrastMaker {
            let cellWidth = (collectionView.frame.width / 4)    // 4 cells per row
            return CGSize(width: cellWidth, height: UIDevice.current.userInterfaceIdiom == .pad ? 114 : 57)
        }
        else {
            let cellWidth = (collectionView.frame.width / CGFloat(numberOfColors) )  // Adjust spacing as needed
            return CGSize(width: cellWidth, height: UIDevice.current.userInterfaceIdiom == .pad ? 210 : 100)
        }
    }

    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
}


