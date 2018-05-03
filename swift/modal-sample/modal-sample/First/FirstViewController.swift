//
//  FirstViewController.swift
//  modal-sample
//
//  Created by 下村一将 on 2018/04/15.
//  Copyright © 2018年 kazu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    static func make() -> FirstViewController {
        return UIStoryboard(name: "FirstViewController", bundle: nil).instantiateInitialViewController()! as! FirstViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func showSecondButtonTapped(_ sender: Any) {
        let vc = SecondViewController.make()
        present(vc, animated: true)
    }
}

