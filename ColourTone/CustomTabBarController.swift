//
//  CustomTabBarController.swift
//  ColourTone
//
//  Created by Bilal Apps Dev on 04/09/2025.
//

import UIKit

class CustomTabBarController: UIViewController {
    
    // MARK: - Properties
    private var viewControllers: [UIViewController] = []
    private var selectedIndex: Int = 0
    private var tabBarView: CustomTabBarView!
    private var containerView: UIView!
    private var viewUndertheTabbarView: UIView!
    private var viewBehindTheTabbar: UIView!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupUI()
        
    }
   
    // Add this method to setup your specific view controllers
        func setupDefaultViewControllers() {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                guard let home = storyboard.instantiateViewController(withIdentifier: "Home") as? Home,
                      let explore = storyboard.instantiateViewController(withIdentifier: "Explore") as? Explore,
                      let settings = storyboard.instantiateViewController(withIdentifier: "Settings") as? Settings else {
                    return
                }
            // Example with different images for selected/unselected states
           
            home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home-filled"))
    
          
            explore.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(named: "explore"), selectedImage: UIImage(named: "explore-filled"))
    
        
            settings.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings"), selectedImage: UIImage(named: "settings-filled"))
    
            setViewControllers([home, explore, settings])
        }
    
    // MARK: - Setup Methods
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        // Container for child view controllers
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        viewUndertheTabbarView = UIView()
        view.addSubview(viewUndertheTabbarView)
        viewUndertheTabbarView.translatesAutoresizingMaskIntoConstraints = false
        viewUndertheTabbarView.backgroundColor = UIColor(named: "tabbar-color")
        
        viewBehindTheTabbar = UIView()
        viewBehindTheTabbar.backgroundColor = UIColor(named: "app-bacground-color")
        viewBehindTheTabbar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewBehindTheTabbar)
        
        
        
        // Custom tab bar
        tabBarView = CustomTabBarView()
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.delegate = self
        view.addSubview(tabBarView)
        
        
        
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Container view constraints
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: tabBarView.topAnchor),
            
            // Tab bar constraints
            tabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tabBarView.heightAnchor.constraint(equalToConstant: 80),
            
            viewBehindTheTabbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewBehindTheTabbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewBehindTheTabbar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            viewBehindTheTabbar.heightAnchor.constraint(equalToConstant: 80),
            
            
            
            viewUndertheTabbarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewUndertheTabbarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewUndertheTabbarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewUndertheTabbarView.topAnchor.constraint(equalTo: tabBarView.bottomAnchor)
        ])
    }
    
    // MARK: - Public Methods
    func setViewControllers(_ controllers: [UIViewController], animated: Bool = false) {
        // Ensure UI is setup first
        if tabBarView == nil {
            setupUI()
        }
        
        // Remove existing child view controllers
        for child in children {
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
        
        self.viewControllers = controllers
        
        // Setup tab bar items
        let tabItems = controllers.enumerated().map { index, vc in
            let title = vc.tabBarItem?.title ?? "Tab \(index + 1)"
            let unselectedImage = vc.tabBarItem?.image ?? UIImage(systemName: "circle")!
            let selectedImage = vc.tabBarItem?.selectedImage ?? unselectedImage
            return CustomTabItem(title: title, unselectedImage: unselectedImage, selectedImage: selectedImage)
        }
        
        tabBarView.setupTabs(tabItems)
        
        // Show first view controller
        if !controllers.isEmpty {
            selectViewController(at: 0, animated: animated)
        }
    }
    
    private func selectViewController(at index: Int, animated: Bool) {
        guard index >= 0 && index < viewControllers.count else { return }
        
      //  let previousIndex = selectedIndex
        selectedIndex = index
        
        // Remove previous child
        if !children.isEmpty {
            let previousChild = children[0]
            previousChild.willMove(toParent: nil)
            
            if animated {
                UIView.transition(with: containerView, duration: 0.3, options: .transitionCrossDissolve) {
                    previousChild.view.removeFromSuperview()
                } completion: { _ in
                    previousChild.removeFromParent()
                }
            } else {
                previousChild.view.removeFromSuperview()
                previousChild.removeFromParent()
            }
        }
        
        // Add new child
        let newChild = viewControllers[index]
        addChild(newChild)
        newChild.view.translatesAutoresizingMaskIntoConstraints = false
        
        if animated {
            newChild.view.alpha = 0
            containerView.addSubview(newChild.view)
            
            NSLayoutConstraint.activate([
                newChild.view.topAnchor.constraint(equalTo: containerView.topAnchor),
                newChild.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                newChild.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                newChild.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
            
            UIView.animate(withDuration: 0.3) {
                newChild.view.alpha = 1
            } completion: { _ in
                newChild.didMove(toParent: self)
            }
        } else {
            containerView.addSubview(newChild.view)
            
            NSLayoutConstraint.activate([
                newChild.view.topAnchor.constraint(equalTo: containerView.topAnchor),
                newChild.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                newChild.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                newChild.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
            
            newChild.didMove(toParent: self)
        }
        
        // Update tab bar selection
        tabBarView.selectTab(at: index)
    }
}

// MARK: - CustomTabBarViewDelegate
extension CustomTabBarController: CustomTabBarViewDelegate {
    func didSelectTab(at index: Int) {
        selectViewController(at: index, animated: true)
    }
}

// MARK: - CustomTabBarView
protocol CustomTabBarViewDelegate: AnyObject {
    func didSelectTab(at index: Int)
}

class CustomTabBarView: UIView {
    
    weak var delegate: CustomTabBarViewDelegate?
    private var tabButtons: [CustomTabButton] = []
    private var stackView: UIStackView!
    private var selectedIndex: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = UIColor(named: "tabbar-color")
        
        // Add shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: -2)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.1
        layer.cornerRadius = 20
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
 
      //  clipsToBounds = true
        
        stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    override func layoutSubviews() {
           super.layoutSubviews()
           
           let shadowHeight: CGFloat = 5
           let shadowRect = CGRect(
               x: 0,
               y: -shadowHeight,   // position above the tabbar
               width: bounds.width,
               height: shadowHeight
           )
           let shadowPath = UIBezierPath(rect: shadowRect)
           layer.shadowPath = shadowPath.cgPath
       }
    
    func setupTabs(_ items: [CustomTabItem]) {
        // Clear existing buttons
        tabButtons.forEach { $0.removeFromSuperview() }
        tabButtons.removeAll()
        
        // Create new buttons
        for (index, item) in items.enumerated() {
            let button = CustomTabButton(item: item)
            button.tag = index
            button.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
            
            tabButtons.append(button)
            stackView.addArrangedSubview(button)
        }
        
        // Select first tab by default
        if !tabButtons.isEmpty {
            selectTab(at: 0)
        }
    }
    
    @objc private func tabButtonTapped(_ sender: CustomTabButton) {
        let index = sender.tag
        delegate?.didSelectTab(at: index)
    }
    
    func selectTab(at index: Int) {
        guard index >= 0 && index < tabButtons.count else { return }
        
        selectedIndex = index
        
        for (i, button) in tabButtons.enumerated() {
            button.setSelected(i == index, animated: true)
        }
    }
}

// MARK: - CustomTabItem
struct CustomTabItem {
    let title: String
    let unselectedImage: UIImage
    let selectedImage: UIImage
    
    // Convenience initializer for single image (will use same image for both states)
    init(title: String, image: UIImage) {
        self.title = title
        self.unselectedImage = image
        self.selectedImage = image
    }
    
    // Full initializer for different images
    init(title: String, unselectedImage: UIImage, selectedImage: UIImage) {
        self.title = title
        self.unselectedImage = unselectedImage
        self.selectedImage = selectedImage
    }
}


// MARK: - CustomTabButton
class CustomTabButton: UIButton {
    
    private var item: CustomTabItem
    private var iconImageView: UIImageView!
    private var customTitleLabel: UILabel!
    private var indicatorView: UIView!
    private var isTabSelected: Bool = false
    
    // Constraints to manage
    private var titleConstraints: [NSLayoutConstraint] = []
    private var iconTopConstraintWithTitle: NSLayoutConstraint!
    private var iconTopConstraintWithoutTitle: NSLayoutConstraint!
    
    init(item: CustomTabItem) {
        self.item = item
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        // Icon
        iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.image = item.unselectedImage
        iconImageView.tintColor = .systemGray
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconImageView)
        
        // Title
        customTitleLabel = UILabel()
        customTitleLabel.text = item.title
        customTitleLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        customTitleLabel.textColor = #colorLiteral(red: 0.5568627451, green: 0.2666666667, blue: 0.6784313725, alpha: 1)
        customTitleLabel.textAlignment = .center
        customTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        // Don't add to view initially
        
        // Indicator (half circle)
        indicatorView = UIView()
        indicatorView.backgroundColor = #colorLiteral(red: 0.5568627451, green: 0.2666666667, blue: 0.6784313725, alpha: 1)
        indicatorView.layer.cornerRadius = 4
        indicatorView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        indicatorView.alpha = 0
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(indicatorView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        // Create both possible top constraints for icon
        iconTopConstraintWithTitle = iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        iconTopConstraintWithoutTitle = iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        // Activate initial constraints (without title)
        NSLayoutConstraint.activate([
            // Icon constraints (centered when no title)
            iconTopConstraintWithoutTitle,
            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            // Indicator constraints
            indicatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            indicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicatorView.widthAnchor.constraint(equalToConstant: 8),
            indicatorView.heightAnchor.constraint(equalToConstant: 4)
        ])
        
        // Store title constraints for later use
        titleConstraints = [
            customTitleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 4),
            customTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            customTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
        ]
    }
    
    func setSelected(_ selected: Bool, animated: Bool) {
        isTabSelected = selected
        
        let color = selected ? UIColor.systemBlue : UIColor.systemGray
        let scale: CGFloat = selected ? 1.1 : 1.0
        let indicatorAlpha: CGFloat = selected ? 1.0 : 0.0
        let image = selected ? item.selectedImage : item.unselectedImage
        
        if animated {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3) {
                self.updateTitleVisibility(selected)
                self.iconImageView.tintColor = color
                self.iconImageView.image = image
                self.iconImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
                self.indicatorView.alpha = indicatorAlpha
                self.layoutIfNeeded() // Animate constraint changes
            }
        } else {
            updateTitleVisibility(selected)
            iconImageView.tintColor = color
            iconImageView.image = image
            iconImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
            indicatorView.alpha = indicatorAlpha
            
        }
    }
    
    private func updateTitleVisibility(_ showTitle: Bool) {
        if showTitle {
            // Show title: add label to view and activate title constraints
            if customTitleLabel.superview == nil {
                addSubview(customTitleLabel)
                NSLayoutConstraint.activate(titleConstraints)
            }
            
            // Switch to title-friendly icon positioning
            iconTopConstraintWithoutTitle.isActive = false
            iconTopConstraintWithTitle.isActive = true
            
            //customTitleLabel.textColor = .systemBlue
            
        } else {
            // Hide title: deactivate title constraints and remove from view
            NSLayoutConstraint.deactivate(titleConstraints)
            customTitleLabel.removeFromSuperview()
            
            // Switch to centered icon positioning
            iconTopConstraintWithTitle.isActive = false
            iconTopConstraintWithoutTitle.isActive = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        UIView.animate(withDuration: 0.1) {
            self.alpha = 0.7
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        UIView.animate(withDuration: 0.1) {
            self.alpha = 1.0
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        UIView.animate(withDuration: 0.1) {
            self.alpha = 1.0
        }
    }
}
