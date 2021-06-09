//
//  ViewController.swift
//  Snapchat
//
//  Created by tkmiz on 5/26/21.
//  Copyright © 2021 rodrigo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import GoogleSignIn

class iniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!){ (user, error) in
            print("Intentando Iniciar Sesion")
            if error != nil{
                print("Se presento el siguiente error: \(error)")
                let alerta = UIAlertController(title: "Iniciar Sesion", message: "El Usuario \(self.emailTextField.text!) no existe. Cree un nuevo usuario", preferredStyle: .alert)
                let btnOK = UIAlertAction(title: "Crear Usuario", style: .default, handler: {(UIAlertAction) in
                    self.performSegue(withIdentifier: "registrarUsuarioSegue", sender: nil)
                })
                let btnCANCEL = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
                alerta.addAction(btnOK)
                alerta.addAction(btnCANCEL)
                self.present(alerta, animated: true, completion: nil)
            }else{
                print("Inicio de sesion exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        }
    }
    
    @IBAction func registrarseTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "registrarUsuarioSegue", sender: nil)
    }
    
    @IBAction func iniciarSesionGoogleTapped(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Google Auth
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self as GIDSignInDelegate
    }

}

extension iniciarSesionViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil && user.authentication != nil {
            let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken,
                                                           accessToken: user.authentication.accessToken)
            Auth.auth().signIn(with: credential){(result, error) in
                print("Intentando Iniciar Sesion con Google")
                if error != nil{
                    print("Se presento el siguiente error: \(error)")
                }else{
                    print("Inicio de sesion de Google exitoso")
                }
            }
        }
    }
}
