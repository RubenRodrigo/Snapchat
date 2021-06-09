//
//  RegistrarUsuarioViewController.swift
//  Snapchat
//
//  Created by tkmiz on 6/8/21.
//  Copyright © 2021 rodrigo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class RegistrarUsuarioViewController: UIViewController {

    @IBAction func volverTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func registrarUsuarioTapped(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: {(user, error) in
            print("Intentando crear un usuario")
            if error != nil {
                print("Se presento el siguiente error al crear el usuario: \(error)")
                self.mostrarAlerta(titulo: "Error", mensaje: "Se produjo un error al registrar el Usuario. Verifique su conexion a internet y vuelva a intentarlo.", accion: "Aceptar")
            }else{
                print("El usuario fue creado exitosamente")
                Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                self.mostrarAlerta(titulo: "Nuevo Usuario", mensaje: "El usuario:\(self.emailTextField.text!) se creo correctamente..", accion: "Aceptar")
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func mostrarAlerta(titulo: String, mensaje: String, accion: String){
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let btnCANCELOK = UIAlertAction(title: accion, style: .default, handler: nil)
        alerta.addAction(btnCANCELOK)
        present(alerta, animated: true, completion: nil)
    }

}
