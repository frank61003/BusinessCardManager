//
//  SignUpViewController.swift
//  BusinessCardManager
//
//  Created by 倪如霖 on 2022/10/30.
//

import UIKit
import FirebaseAuth
class SignUpViewController: UIViewController {

    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func signUpBtn(_ sender: Any) {
        
        guard let email = accountTextField.text, let password = passwordTextField.text else{
            return
        }
        
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    
             guard let user = result?.user,
                   error == nil else {
                 print(error?.localizedDescription)
                 return
             }
             print(user.email, user.uid)
        }
    
    
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
