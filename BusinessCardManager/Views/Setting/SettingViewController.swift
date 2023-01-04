//
//  SettingViewController.swift
//  BusinessCardManager
//
//  Created by 倪如霖 on 2023/1/4.
//

import UIKit

class SettingViewController: UIViewController {

    @IBAction func LogutBtn(_ sender: UIButton) {
        logout()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    private func logout(){
//        UserDefaults.standard[.isAutoLogin] = false
               
        //清空資料
//        MemberProfileModel.shared.setName("")
//        MemberProfileModel.shared.setMobile("")
//        MemberProfileModel.shared.setIdentityNumber("")
//        MemberProfileModel.shared.setBirthday("")
//      考慮要不要清空
//        MemberProfileModel.shared.setMemberToken("")
//        MemberProfileModel.shared.setIsNowName("")
//        MemberProfileModel.shared.setCompanyName("")
//        MemberProfileModel.shared.setCompanyAddress("")
//        MemberProfileModel.shared.setRelationList([])
               
        let loginStoryboard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        let loginView = loginStoryboard.instantiateViewController(withIdentifier: "LoginNavigationViewController")
               
        UIApplication.shared.keyWindow?.rootViewController = loginView
        self.view.removeFromSuperview()
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
