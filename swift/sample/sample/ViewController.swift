//
//  ViewController.swift
//  sample
//
//  Created by 下村一将 on 2018/01/27.
//  Copyright © 2018年 kazu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = "0"
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        let str = countLabel.text!
        
        let num = Int(str)! + 1
        
        if num % 2 == 0 {
            self.view.backgroundColor = UIColor.green
        } else {
            self.view.backgroundColor = UIColor.white
        }
        
        countLabel.text = "\(num)" // String(num)
    }
    
}

