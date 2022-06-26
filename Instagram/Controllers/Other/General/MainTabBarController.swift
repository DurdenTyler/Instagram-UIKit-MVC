//
//  MainTabBarController.swift
//  Instagram
//
//  Created by Ivan White on 23.06.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupViews()
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .darkGray
    }
    
    private func setupViews() {
        let homeVC = HomeViewController()
        let exploreVS = ExploreViewController()
        let cameraVS = CameraViewController()
        let notificationsVS = NotificationsViewController()
        let profileVS = ProfileViewController()
        
        setViewControllers([homeVC, exploreVS, cameraVS, notificationsVS, profileVS], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "house.circle.fill")
        
        items[1].image = UIImage(systemName: "magnifyingglass.circle.fill")
        
        items[2].image = UIImage(systemName: "camera.circle.fill")
        
        items[3].image = UIImage(systemName: "bell.circle.fill")
        
        items[4].image = UIImage(systemName: "person.crop.circle.fill")
        
    }

}
