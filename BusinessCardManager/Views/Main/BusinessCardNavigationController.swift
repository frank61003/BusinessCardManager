//
//  BusinessCardNavigationController.swift
//  BusinessCardManager
//
//  Created by 倪如霖 on 2023/6/7.
//

import UIKit

class BusinessCardNavigationController: UINavigationController {
    private let mainViewController = MainViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        self.viewControllers=[mainViewController]
    }
    
    
    
    func setStyle(){
        
        let barAppearance =  UINavigationBarAppearance()
        barAppearance.configureWithDefaultBackground()
        barAppearance.backgroundColor = UIColor.systemRed
        barAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
       
       
      
    }
    
    
}
