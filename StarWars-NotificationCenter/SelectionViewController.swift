//
//  SelectionViewController.swift
//  StarWars-NotificationCenter
//
//  Created by Luis Puentes on 8/6/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func imperialButtonTapped(_ sender: Any) {
        let dark = Notification.Name(darkNotificationKey)
        NotificationCenter.default.post(name: dark, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func rebelButtonTapped(_ sender: Any) {
        let light = Notification.Name(lightNotificationKey)
        NotificationCenter.default.post(name: light, object: nil)
        dismiss(animated: true, completion: nil)
    }
}
