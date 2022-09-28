//
//  MainPageViewController.swift
//  BusinessCardManager
//
//  Created by 倪如霖 on 2022/9/28.
//

import UIKit

class MainPageViewController: UIPageViewController {

//    var customerViewData: CustomerListViewData?
//    weak var pageViewControllerDelegate: PageViewControllerDelegate?
    private var page = 0
    private let totalpage = 2
    var viewControllerArray = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
//        self.view.backgroundColor = UIColor.themeColor.lightGray
        let allMessageTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "BusinessCardTableViewController") as! BusinessCardTableViewController
        allMessageTableViewController.view.backgroundColor = UIColor.blue
//        allMessageTableViewController.messageTableViewModel.messageType = .all
        let unreadMessageTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "BusinessCardTableViewController") as! BusinessCardTableViewController
//        unreadMessageTableViewController.messageTableViewModel.messageType = .unread
        unreadMessageTableViewController.view.backgroundColor = UIColor.green
        let alreadySendMessageTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "BusinessCardTableViewController") as! BusinessCardTableViewController
//        alreadySendMessageTableViewController.messageTableViewModel.messageType = .alreadySend
        viewControllerArray.removeAll()
        viewControllerArray.append(allMessageTableViewController)
        viewControllerArray.append(unreadMessageTableViewController)
        viewControllerArray.append(alreadySendMessageTableViewController)
        self.setViewControllers([viewControllerArray[0]], direction: .forward, animated: true, completion: nil)
        
    }
    private func setupTextViewController(page: Int) -> UIViewController?{
        if page < 0 || page > totalpage{
            return nil
        }
        
        return viewControllerArray[page]
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MainPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = self.viewControllerArray.firstIndex(of: viewController) {
                if viewController == self.viewControllerArray.first {
                    //回到最後一個
                    //return self.timeTableViewControllers.last
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
//        self.pageViewControllerDelegate?.pageViewController(didUpdatePageIndex: currentIndex)
        
    }
}
