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

        let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 4 * Int64(NSEC_PER_SEC))

        dispatch_after(time, dispatch_get_main_queue()){
            var juego:
            while juego {
                
            }
            let number = Int.random(in: 0..<4)
            
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
