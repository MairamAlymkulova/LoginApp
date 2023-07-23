
import UIKit

class ViewController: UIViewController {

    private var userName = ""
    private var password = ""
    
    private var usersArray = ["Mairam" : "123456", "Snowman" : "122222222222", "Star" : "34fffsds"]
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var throwExeptionForUserName: UILabel!
    @IBOutlet weak var trowExeptionForPassword: UILabel!
    @IBOutlet weak var authorizationResult: UILabel!
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        userName = userNameTextField.text ?? ""
        password = passwordTextField.text ?? ""
        
        
        let userNameValidation = checkUserNameValidation(userName: userName)
        
        let passwordValidation = checkPasswordValidation(password: password)
         
        if userNameValidation && passwordValidation{
            checkUserExistsInArray(userName: userName, password: password)
        }else{
            authorizationResult.text = ""
        }
        
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        userName = userNameTextField.text!
        password = passwordTextField.text!
    }
    @IBAction func signUpButtonTapped(_ sender: Any) {
        userName = userNameTextField.text!
        password = passwordTextField.text!
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    private func checkUserNameValidation(userName: String)->Bool{
        if userName.count < 3 {
            throwExeptionForUserName.text = "* Use 6 characters or more for your password"
            return false
        }else{
            throwExeptionForUserName.text = ""
            return true
        }
    }
    
    private func checkPasswordValidation(password: String)->Bool{
        if password.count < 6{
            trowExeptionForPassword.text = "* Use 3 characters or more for your user name"
            return false
        }
        else{
            trowExeptionForPassword.text = ""
            return true
        }
    }
    private func checkUserExistsInArray(userName: String, password: String){
        if(usersArray[userName]==password){
            userNameTextField.layer.borderColor = UIColor.green.cgColor
            userNameTextField.layer.borderWidth = 2
            
            passwordTextField.layer.borderColor = UIColor.green.cgColor
            passwordTextField.layer.borderWidth = 2
            
            authorizationResult.textColor = UIColor.green
            authorizationResult.text = "Welcome back!"
        }else{
            userNameTextField.layer.borderColor = UIColor.red.cgColor
            userNameTextField.layer.borderWidth = 2
            
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            passwordTextField.layer.borderWidth = 2
            authorizationResult.textColor = UIColor.red
            authorizationResult.text = "Invalid user name or password"
        }
    }
}

