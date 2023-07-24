//
//  MainViewController.swift
//  BusinessCardManager
//
//  Created by 倪如霖 on 2022/9/28.
//

import UIKit

class MainViewController: UIViewController {
    
    
    private lazy var mainPageViewController = MainPageViewController()
   
    
    
    
    private lazy var businessCardTypeSegment: UISegmentedControl = {
        
        
        let items = ["全部", "公司", "餐廳", "其他"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.backgroundColor = .red
//                segmentedControl.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
                
        return segmentedControl
      }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .brown
        self.navigationItem.title="名片"
       
       
        setUI()
        addChild(mainPageViewController)
       
       
        
        self.mainPageViewController.pageViewControllerDelegate = self
        
    }
    
    func setUI(){
        self.view.addSubview(businessCardTypeSegment)
        businessCardTypeSegment.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        businessCardTypeSegment.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        businessCardTypeSegment.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        self.view.addSubview(mainPageViewController.view)
        mainPageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        mainPageViewController.view.topAnchor.constraint(equalTo: businessCardTypeSegment.bottomAnchor).isActive = true
        mainPageViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainPageViewController.view.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        mainPageViewController.view.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBusinessCard))
        self.navigationItem.rightBarButtonItems = [addButtonItem]
        
        
    }
    @objc func addBusinessCard(){
        let addCardViewController = AddCardViewController()
      
        self.navigationController?.pushViewController(addCardViewController, animated: true)
         
    }
    
}
extension MainViewController: PageViewControllerDelegate{
    
    func pageViewController(didUpdatePageIndex pageIndex: Int) {
        businessCardTypeSegment.selectedSegmentIndex = pageIndex
       
        
    }
}
