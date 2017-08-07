//
//  MainViewController.swift
//  StarWars-NotificationCenter
//
//  Created by Luis Puentes on 8/6/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

let lightNotificationKey = "lightSide"
let darkNotificationKey = "darkSide"

class MainViewController: UIViewController {

    let light = Notification.Name(lightNotificationKey)
    let dark = Notification.Name(darkNotificationKey)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createObservers()
        
        chooseButton.layer.cornerRadius = chooseButton.frame.size.height/2
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func createObservers() {
        // Light
        NotificationCenter.default.addObserver(self, selector: #selector(updateCharacterImage(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateCharacterNameLabel(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBackground(notification:)), name: light, object: nil)
        
        // Dark
        NotificationCenter.default.addObserver(self, selector: #selector(updateCharacterImage(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateCharacterNameLabel(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBackground(notification:)), name: dark, object: nil)
    }
    
    func updateCharacterImage(notification: NSNotification) {
        
        let isLight = notification.name == light
        let image = isLight ? UIImage(named: "yoda") : UIImage(named: "darthMaul")
        mainImageView.image = image
        
        mainImageView.layer.borderWidth = 1
        mainImageView.layer.borderColor = UIColor.black.cgColor
        mainImageView.layer.cornerRadius = mainImageView.frame.size.height/2
        mainImageView.clipsToBounds = true
    }
    
    func updateCharacterNameLabel(notification: NSNotification) {
        
        let isLight = notification.name == light
        let name = isLight ? "Yoda" : "Darth Maul"
        nameLabel.text = name
    }
    
    func updateBackground(notification: NSNotification) {
        
        let isLight = notification.name == light
        let color = isLight ? UIColor.green : UIColor.red
        view.backgroundColor = color
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chooseButton: UIButton!
}
