////
////  MyCreationsVC.swift
////  ColourTone
////
////  Created by Bilal Apps Dev on 04/09/2025.
////
//
//import UIKit
//
//class MyCreationsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//   
//    
//    @IBOutlet weak var filterBtnOutlet: UIButton!
//    @IBOutlet weak var filterCollectionView: UICollectionView!
//    @IBOutlet weak var myCreationsCollectionView: UICollectionView!
//    var selectedCreationIndex: IndexPath?
//    var selectedFilterIndex: IndexPath?
//        
//    let colors = ["#FF5733", "#33FF57", "#3357FF", "#F1C40F", "#8E44AD"]
//    let category = ["Favorites", "Gradients", "Palettes", "Patterns", "Textures"]
//
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        filterBtnOutlet.layer.cornerRadius = 20
//        myCreationsCollectionView.dataSource = self
//        myCreationsCollectionView.delegate = self
//        myCreationsCollectionView.allowsMultipleSelection = false
//        
//        
//        filterCollectionView.dataSource = self
//        filterCollectionView.delegate = self
//        filterCollectionView.allowsMultipleSelection = false
//        // Do any additional setup after loading the view.
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == myCreationsCollectionView {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCreationsCVC", for: indexPath) as! MyCreationsCVC
//            cell.gradientOrPalleteView.backgroundColor = UIColor(hex: colors[indexPath.row])
//            
//            // reset selection state
//            if collectionView.indexPathsForSelectedItems?.contains(indexPath) == true {
//                cell.gradientOrPalleteView.layer.backgroundColor = UIColor.lightGray.cgColor
//            } else {
//                cell.gradientOrPalleteView.layer.backgroundColor = UIColor(hex: colors[indexPath.item])?.cgColor
//            }
//            return cell
//        } else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCVC", for: indexPath) as! FilterCVC
//            cell.category.text = category[indexPath.row]
//            
//            // reset selection state
//            if collectionView.indexPathsForSelectedItems?.contains(indexPath) == true {
//                cell.category.textColor = UIColor(named: "app-items-color")
//            } else {
//                cell.category.textColor = UIColor.black
//            }
//            return cell
//        }
//    }
//
//    
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == self.myCreationsCollectionView {
//            let cellWidth = (collectionView.frame.width / 2 - 10)    // 4 cells per row
//            return CGSize(width: cellWidth, height: UIDevice.current.userInterfaceIdiom == .pad ? 400 : 200)
//        }
//        else {
//            //let cellWidth = (collectionView.frame.width )
//            let cellHeight = collectionView.frame.height // Adjust spacing as needed
//            return CGSize(width: 100, height: UIDevice.current.userInterfaceIdiom == .pad ? 210 : cellHeight)
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.reloadItems(at: [indexPath])
//        if collectionView == self.myCreationsCollectionView {
//             // Use cellForItem to GET the existing visible cell
//             guard let cell = collectionView.cellForItem(at: indexPath) as? MyCreationsCVC else {
//                 print("Cell not visible or not of correct type")
//                 return
//             }
//             cell.gradientOrPalleteView.layer.backgroundColor = UIColor.lightGray.cgColor
//            // selectedCreationIndex = indexPath
//         }
//        else {
//            
//            guard let cell = collectionView.cellForItem(at: indexPath) as? FilterCVC else {
//                print("Cell not visible or not of correct type")
//                return
//            }
//            
//            cell.category.textColor = UIColor(named: "app-items-color")
//            
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//     
//        if collectionView == self.myCreationsCollectionView {
//             // Use cellForItem to GET the existing visible cell
//             guard let cell = collectionView.cellForItem(at: indexPath) as? MyCreationsCVC else {
//                
//                 return
//             }
//        
//         }
//        else {
//            
//            guard let cell = collectionView.cellForItem(at: indexPath) as? FilterCVC else {
//                collectionView.reloadItems(at: [indexPath])
//                return
//            }
//         
//            cell.category.textColor = UIColor.black
//            
//        }
//    }
//    
//    @IBAction func backBtnAction(_ sender: Any) {
//        self.dismiss(animated: true)
//    }
//
//}


//
//  MyCreationsVC.swift
//  ColourTone
//
//  Created by Bilal Apps Dev on 04/09/2025.
//

import UIKit

class MyCreationsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    
    @IBOutlet weak var heartBtnOutlet: UIButton!
    @IBOutlet weak var filterBtnOutlet: UIButton!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var myCreationsCollectionView: UICollectionView!
    var selectedCreationIndex: IndexPath?
    var selectedFilterIndex: IndexPath?
        
    let colors = ["#FF5733", "#33FF57", "#3357FF", "#F1C40F", "#8E44AD"]
    let category = ["Favorites", "Gradients", "Palettes", "Patterns", "Textures"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterBtnOutlet.layer.cornerRadius = 20
        myCreationsCollectionView.dataSource = self
        myCreationsCollectionView.delegate = self
        myCreationsCollectionView.allowsMultipleSelection = false
        
        
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        filterCollectionView.allowsMultipleSelection = false
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == myCreationsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCreationsCVC", for: indexPath) as! MyCreationsCVC
            
            // Set appearance based on selection state
            let isSelected = collectionView.indexPathsForSelectedItems?.contains(indexPath) == true
            if isSelected {
                cell.gradientOrPalleteView.layer.backgroundColor = UIColor.lightGray.cgColor
            } else {
                cell.gradientOrPalleteView.layer.backgroundColor = UIColor(hex: colors[indexPath.item])?.cgColor
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCVC", for: indexPath) as! FilterCVC
            cell.category.text = category[indexPath.row]
            
            // Set appearance based on selection state
            let isSelected = collectionView.indexPathsForSelectedItems?.contains(indexPath) == true
            if isSelected {
                cell.category.textColor = UIColor(named: "app-items-color")
            } else {
                cell.category.textColor = UIColor.black
            }
            return cell
        }
    }

    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.myCreationsCollectionView {
            let cellWidth = (collectionView.frame.width / 2 - 10)    // 2 cells per row
            return CGSize(width: cellWidth, height: UIDevice.current.userInterfaceIdiom == .pad ? 400 : 200)
        }
        else {
            let cellHeight = collectionView.frame.height
            return CGSize(width: 100, height: UIDevice.current.userInterfaceIdiom == .pad ? 210 : cellHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.myCreationsCollectionView {
            selectedCreationIndex = indexPath
            // Update cell appearance
            guard let cell = collectionView.cellForItem(at: indexPath) as? MyCreationsCVC else {
                return
            }
            cell.gradientOrPalleteView.layer.backgroundColor = UIColor.lightGray.cgColor
        }
        else {
            selectedFilterIndex = indexPath
            // Update cell appearance
            guard let cell = collectionView.cellForItem(at: indexPath) as? FilterCVC else {
                return
            }
            cell.category.textColor = UIColor(named: "app-items-color")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == self.myCreationsCollectionView {
            // Reset to original color
            guard let cell = collectionView.cellForItem(at: indexPath) as? MyCreationsCVC else {
                return
            }
            cell.gradientOrPalleteView.layer.backgroundColor = UIColor(hex: colors[indexPath.item])?.cgColor
        }
        else {
            // Reset to original color
            guard let cell = collectionView.cellForItem(at: indexPath) as? FilterCVC else {
                return
            }
            cell.category.textColor = UIColor.black
        }
    }
    
    @IBAction func heartBtnAction(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        if button.currentImage == UIImage(systemName: "heart") {
            button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            button.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }

    @IBAction func backBtnAction(_ sender: Any) {
        self.dismiss(animated: true)
    }

}
