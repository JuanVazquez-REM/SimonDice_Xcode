//
//  ViewController.swift
//  SimonDiceQueVamosARemedial
//
//  Created by mac03 on 04/03/21.
//  Copyright © 2021 UTT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tf_jugador: UITextField!
    @IBOutlet weak var btn_jugar: UIButton!
    
    var users = [User]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn_jugar.layer.cornerRadius = btn_jugar.bounds.size.width/2;
     
        // Do any additional setup after loading the view.
    }

    @IBAction func AccionJugar(_ sender: Any) {
        print("Accion botton")
        let jugadortxt = tf_jugador.text!
        
        if(jugadortxt.count > 0){
            
            var logg = false
            
            do{
                if let data = defaults.object(forKey: "users") as?Data{
                
                    let decoder = JSONDecoder()
                    let usersd = try decoder.decode([User].self, from: data)
                    
                    print("Verificando user")
                    usersd.forEach {(user) in
                        if user.username == jugadortxt{
                            logg = true
                        }
                    }
                }
                
                if logg {
                    print("user registrado")
                    self.alertDefault(for: "Lo siento", and: "Usuario ya registrado")
                    //Animacion
                    let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
                    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
                    animation.duration = 0.6
                    animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
                    btn_jugar.layer.add(animation, forKey: "shake")
                    
                    
                }else{
                    print("user")
                    
                    let user = User(jugadortxt)
                    users.append(user)
                    print(user)
                    
                    let json = JSONEncoder()
                    let data = try json.encode(users)
                    defaults.set(data,forKey: "users")
                    
                    defaults.synchronize()
                    
                    
                    print("Registrado")
                }
                print("No se encontro users en defaults")
                
            }catch{
                print("Error al hacer el encode")
            }
        }else{
            self.alertDefault(for: "Lo siento", and: "Ingrese un usuario")
        }
       
    }
}
extension UIViewController {
    func alertDefault (for title: String, and description: String){
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
}
