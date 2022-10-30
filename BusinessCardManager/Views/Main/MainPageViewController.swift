//
//  MainPageViewController.swift
//  BusinessCardManager
//
//  Created by 倪如霖 on 2022/9/28.
//

import UIKit

protocol PageViewControllerDelegate: AnyObject {
    
    /// 當 pageViewController 切換頁數時，設定 pageControl 的頁數
    func pageViewController(didUpdatePageIndex pageIndex: Int)
}


class MainPageViewController: UIPageViewController {


    weak var pageViewControllerDelegate: PageViewControllerDelegate?
    private var page = 0
    private let totalpage = 3
    var viewControllerArray = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self

        let allBusinessCardTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "BusinessCardTableViewController") as! BusinessCardTableViewController
        allBusinessCardTableViewController.view.backgroundColor = UIColor.blue

        let companyBusinessCardTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "BusinessCardTableViewController") as! BusinessCardTableViewController

        companyBusinessCardTableViewController.view.backgroundColor = UIColor.green
        let restaurantBusinessCardMessageTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "BusinessCardTableViewController") as! BusinessCardTableViewController
        restaurantBusinessCardMessageTableViewController.view.backgroundColor = UIColor.red
        
        let otherBusinessCardMessageTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "BusinessCardTableViewController") as! BusinessCardTableViewController
        otherBusinessCardMessageTableViewController.view.backgroundColor = UIColor.gray

        
        viewControllerArray.removeAll()
        viewControllerArray.append(allBusinessCardTableViewController)
        viewControllerArray.append(companyBusinessCardTableViewController)
        viewControllerArray.append(restaurantBusinessCardMessageTableViewController)
        viewControllerArray.append(otherBusinessCardMessageTableViewController)
        self.setViewControllers([viewControllerArray[0]], direction: .forward, animated: true, completion: nil)
        
    }

    
    func setViewController(page: Int){
        if page < 0 || page > totalpage{
            return
        }
        if page >= viewControllerArray.count{
            return
        }
        let vc = viewControllerArray[page]
        // 取得當前頁數的 viewController
        let currentViewController: UIViewController = (self.viewControllers?.first)!

        // 取得當前頁數的 index
        let currentIndex: Int =  self.viewControllerArray.firstIndex(of: currentViewController)!
        let direction : UIPageViewController.NavigationDirection = page > currentIndex ? .forward : .reverse

        self.setViewControllers([vc], direction: direction, animated: true, completion: nil)
    }
    

}
extension MainPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = self.viewControllerArray.firstIndex(of: viewController) {
                if viewController == self.viewControllerArray.first {
                    
                    return nil
                } else {
                    page -= 1
                    return self.viewControllerArray[index - 1]
                }
            } else {
                return nil
            }
            
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = self.viewControllerArray.firstIndex(of: viewController) {
                if viewController == self.viewControllerArray.last {
                    //回到第一個
                    //return self.timeTableViewControllers.first
                    return nil
                } else {
                    page += 1
                    return self.viewControllerArray[index + 1]
                }
            } else {
                return nil
            }
    }
}

extension MainPageViewController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
    
        // 取得當前頁數的 viewController
        let currentViewController: UIViewController = (self.viewControllers?.first)!
        // 取得當前頁數的 index
        let currentIndex: Int =  self.viewControllerArray.firstIndex(of: currentViewController)!
        // 設定 RootViewController 上 PageControl 的頁數
        self.pageViewControllerDelegate?.pageViewController(didUpdatePageIndex: currentIndex)
        
    }
}
