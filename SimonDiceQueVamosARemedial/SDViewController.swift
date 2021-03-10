//
//  SDViewController.swift
//  SimonDiceQueVamosARemedial
//
//  Created by mac03 on 04/03/21.
//  Copyright © 2021 UTT. All rights reserved.
//

import UIKit

class SDViewController: UIViewController {

    @IBOutlet var btn_amarillo: UIView!
    @IBOutlet weak var btn_rojo: UIButton!
    @IBOutlet weak var btn_verde: UIButton!
    @IBOutlet weak var btn_azul: UIButton!
    @IBOutlet weak var label_player: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let number = Int.random(in: 1..<4)
            
        switch number {
            case 1:
            print("1")
            case 2:
            print("2")
            case 3:
            print("3")
            case 4:
            print("4")
        default:
            print("que paso xd")
        }

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
