//
//  ThirdViewController.swift
//  modal-sample
//
//  Created by 下村一将 on 2018/04/15.
//  Copyright © 2018年 kazu. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    static func make() -> ThirdViewController {
        return UIStoryboard(name: "ThirdViewController", bundle: nil).instantiateInitialViewController()! as! ThirdViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func dismissAllButtonTapped(_ sender: Any) {
        let parent = self.presentingViewController
        self.dismiss(animated: true) {
            parent?.dismiss(animated: true)
        }
    }
}
