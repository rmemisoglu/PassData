//
//  NotificationCenterBackViewController.swift
//  PassData
//
//  Created by Ramazan Memişoğlu on 25.10.2019.
//  Copyright © 2019 Ramazan Memişoğlu. All rights reserved.
//

import UIKit

class NotificationCenterBackViewController: UIViewController {

    var text:String = ""
    @IBOutlet weak var lbl : UILabel!
    @IBOutlet weak var txt : UITextField!
    
    
    @IBAction func backData()
    {
        var sendText = ""
        if txt.text == "" || txt.text == nil{
            sendText = "Back To Notification Center"
        } else {
            sendText = txt.text!
        }
        NotificationCenter.default.post(name: .notifyA, object: sendText)
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl?.text = text
        // Do any additional setup after loading the view.
    }
}
