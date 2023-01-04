//
//  LoginViewController.swift
//  BusinessCardManager
//
//  Created by 倪如霖 on 2022/10/30.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func loginBtn(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else{return}
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
             guard error == nil else {
                print(error?.localizedDescription)
                return
             }
            print("success")
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let mainView = mainStoryboard.instantiateViewController(withIdentifier: "MainTabBarViewController")
            UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController = mainView
            self.view.removeFromSuperview()
        }
    }
    
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
