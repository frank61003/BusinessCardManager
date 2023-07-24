//
//  LoginViewController.swift
//  BusinessCardManager
//
//  Created by 倪如霖 on 2022/10/30.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

//    @IBOutlet weak var emailTextField: UITextField!
//    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    private var emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.textInsets=UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10)
        return textField
      }()
    
    private var passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.textInsets=UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10)
        return textField
      }()
    
    
//
    private var loginButton: UIButton = {
        let loginButton = UIButton(type: .system )
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("登入", for: .normal)
        loginButton.backgroundColor = .red
        return loginButton
      }()
    
    
    private var stackView: UIStackView  = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing   = 12
        
       
        return stackView
    }()
   

   

   
    
    
    
    
    
    
//
    @objc func loginBtn(_ sender: UIButton) {
        print("login")
        guard let email = emailTextField.text, let password = passwordTextField.text else{return}
        print("login",email,password)
//        Auth.auth().signIn(withEmail: email, password: password) { result, error in
//             guard error == nil else {
//                print(error?.localizedDescription)
//                return
//             }
//            print("success")
//            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let mainView = mainStoryboard.instantiateViewController(withIdentifier: "MainTabBarViewController")
        
            let mainVC = MainTabBarViewController()
            UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController = mainVC
            self.view.removeFromSuperview()
//        }
    }
//
//
//    @IBAction func signUpBtn(_ sender: UIButton) {
//        let storyboard = UIStoryboard(name: "Login", bundle: nil)
//        guard let vc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else { return }
//        self.navigationController?.pushViewController(vc, animated: true)
//
//
//    }
    private var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: UIScreen.main.bounds.height/2, width: UIScreen.main.bounds.width, height: 50))
        label.textAlignment = .center
        label.text = "文字在這邊!"
        return label
      }()
    
   
    func setUI(){
//        emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -40).isActive = true
//        emailTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//
//
//        passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -40).isActive = true
//        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
    
        loginButton.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -40).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -60).isActive = true
        
        
        loginButton.addTarget(self, action: #selector(loginBtn), for: .touchUpInside)
        
        
        //Constraints
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -20).isActive = true
//        stackView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 200).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(label)
    
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        view.addSubview(stackView)
        view.addSubview(loginButton)
        setUI()
        
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
