//
//  SettingNavigationController.swift
//  BusinessCardManager
//
//  Created by 倪如霖 on 2023/6/7.
//

import UIKit

class SettingNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = SettingViewController()
        self.viewControllers = [vc]
        // Do any additional setup after loading the view.
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
