//
//  SDViewController.swift
//  SimonDiceQueVamosARemedial
//
//  Created by mac03 on 04/03/21.
//  Copyright © 2021 UTT. All rights reserved.
//

import UIKit

class SDViewController: UIViewController {

    
    @IBOutlet weak var btn_amarillo: UIButton!
    @IBOutlet weak var btn_rojo: UIButton!
    @IBOutlet weak var btn_verde: UIButton!
    @IBOutlet weak var btn_azul: UIButton!
    @IBOutlet weak var txt_username: UITextView!
    @IBOutlet weak var txt_score: UITextView!
    
    let defaults = UserDefaults.standard
    var buttons: [UIButton] = [UIButton]()
    var numeros = [Int]()
    var numeroscheck = [Int]()
    var ronda: Int = 0
    var numrondas: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Segunda pantalla")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.jugar()
        }
    }
    
    
    func jugar(){
        self.buttons = [btn_amarillo,btn_rojo,btn_verde,btn_azul]
        
        do{
            if let data = self.defaults.object(forKey: "users") as?Data{
                
                let decoder = JSONDecoder()
                let usersd = try decoder.decode([User].self, from: data)
                print("Users encontrados")
                
                let usernow = usersd.last
                let username = String(usernow?.username ?? "nada")
                print(username)
                self.txt_username.text = username
            }
        } catch {
            print("Error al recuperar los users")
        }
        
        self.siguienteRonda()
        
    }
    
    @IBAction func accionAmarillo(_ sender: Any) {
        self.numeroscheck.append(0)
        
        for i in 0..<numeros.count{
            if (self.numeroscheck[i] == numeros[i]){
                print("muy bien")
                numeros.removeAll()
                numeroscheck.removeAll()
                
            }else{
                self.alertDefault(for: "Lo siento", and: "Haz perdido")
            }
        }
    }
    
    @IBAction func accionRojo(_ sender: Any) {
        self.numeroscheck.append(1)
        
        for i in 0..<numeros.count{
            if (self.numeroscheck[i] == numeros[i]){
                print("muy bien")
                numeros.removeAll()
                numeroscheck.removeAll()
                
            }else{
                self.alertDefault(for: "Lo siento", and: "Haz perdido")
            }
        }
    }
    
    @IBAction func accionVerde(_ sender: Any) {
        self.numeroscheck.append(2)
        
        for i in 0..<numeros.count{
            
            if (self.numeroscheck[i] == numeros[i]){
                print("muy bien")
                numeros.removeAll()
                numeroscheck.removeAll()
            }
            self.alertDefault(for: "Lo siento", and: "Haz perdido")
            
        }
    }
    
    @IBAction func accionAzul(_ sender: Any) {
        self.numeroscheck.append(3)
        
        for num in 0..<numeros.count{
            if self.numeroscheck[num] == numeros[num]{
                print("muy bien")
                numeros.removeAll()
                numeroscheck.removeAll()
            }else{
                self.alertDefault(for: "Lo siento", and: "Haz perdido")
            }
        }
    }
    
    func siguienteRonda(){
        let random = Int.random(in: 0...3)
        self.numeros.append(random)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            switch random {
            case 0:
                self.btn_amarillo.shine()
                break
            case 1:
                self.btn_rojo.shine()
                break
            case 2:
                self.btn_verde.shine()
                break
            case 3:
                self.btn_azul.shine()
                break
            default:
                print("random fuera de rango")
            }
            
        }
        
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

extension UIViewController {
    func alertDefault (for title: String, and description: String){
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
}

