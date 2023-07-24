//
//  MainTabBarViewController.swift
//  BusinessCardManager
//
//  Created by 倪如霖 on 2023/6/7.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    var messageNavigationController: UINavigationController?

    private let businessCardNavigationController = BusinessCardNavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        businessCardNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
//        self.viewControllers?.append(vc)
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .red
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.tabBarItem.title = "列表"

        let vc2 = SettingNavigationController()
        vc2.tabBarItem.image = UIImage(systemName: "pencil")
        vc2.tabBarItem.title = "更多"
        viewControllers = [businessCardNavigationController,vc1,vc2]
//        self.viewControllers?.append(vc2)
        self.tabBar.backgroundColor = .gray
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
