//
//  MainViewController.swift
//  BusinessCardManager
//
//  Created by 倪如霖 on 2022/9/28.
//

import UIKit

class MainViewController: UIViewController {
    
    var mainPageViewController: MainPageViewController?
    
    @IBOutlet weak var businessCardTypeSegment: UISegmentedControl!
    @IBAction func changeContainerView(_ sender: UISegmentedControl) {
        mainPageViewController?.setViewController(page: sender.selectedSegmentIndex)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let mainPageViewController = segue.destination as? MainPageViewController {
            self.mainPageViewController = mainPageViewController
            // 代理 pageViewController
            self.mainPageViewController?.pageViewControllerDelegate = self
            
        }
         
    }
    
}
extension MainViewController: PageViewControllerDelegate{
    
    func pageViewController(didUpdatePageIndex pageIndex: Int) {
        businessCardTypeSegment.selectedSegmentIndex = pageIndex
       
        
    }
}
