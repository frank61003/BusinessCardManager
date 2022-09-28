//
//  MainViewController.swift
//  BusinessCardManager
//
//  Created by 倪如霖 on 2022/9/28.
//

import UIKit

class MainViewController: UIViewController {
    var mainPageViewController: MainPageViewController?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let mainPageViewController = segue.destination as? MainPageViewController {
            self.mainPageViewController = mainPageViewController
            // 代理 pageViewController
            
//            guard let companyCollectionViewController = self.storyboard?.instantiateViewController(withIdentifier: "CompanyCollectionViewController") as? CompanyCollectionViewController, let searchProductViewController = self.storyboard?.instantiateViewController(withIdentifier: "SearchProductViewController") as? SearchProductViewController else { return }
//            
//            self.productPageViewController?.viewControllerArray = [searchProductViewController, companyCollectionViewController]
//            
//            self.productPageViewController?.pageViewControllerDelegate = self
            
        }
         
    }
    

}
