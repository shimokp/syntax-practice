//
//  SecondViewController.swift
//  modal-sample
//
//  Created by 下村一将 on 2018/04/15.
//  Copyright © 2018年 kazu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    static func make() -> SecondViewController {
        return UIStoryboard(name: "SecondViewController", bundle: nil).instantiateInitialViewController()! as! SecondViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showThirdButtonTapped(_ sender: Any) {
        let vc = ThirdViewController.make()
        present(vc, animated: true)
    }
}
