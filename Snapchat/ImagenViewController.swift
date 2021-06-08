//
//  ImagenViewController.swift
//  Snapchat
//
//  Created by tkmiz on 6/2/21.
//  Copyright © 2021 rodrigo. All rights reserved.
//

import UIKit

class ImagenViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descripcionTextField: UITextField!
    @IBOutlet weak var elegirContactoBoton: UIButton!
    
    @IBAction func camaraTapped(_ sender: Any) {
    }
    
    @IBAction func elegirContactoTapped(_ sender: Any) {
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
