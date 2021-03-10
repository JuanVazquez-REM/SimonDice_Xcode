//
//  UIButtonExtension.swift
//  SimonDiceQueVamosARemedial
//
//  Created by mac03 on 04/03/21.
//  Copyright © 2021 UTT. All rights reserved.
//

import UIKit

extension UIButton{
    func shine(){
        UIView.animate(withDuration: 0.1){
            self.transform = CGAffineTransform(translationX: 0, y: -10)
        } completion: { (completion) in
            UIView.animate(withDuration: 0.1){
                self.alpha = 1
            }
        }
    }
}
