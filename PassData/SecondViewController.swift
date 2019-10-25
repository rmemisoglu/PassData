//
//  SecondViewController.swift
//  PassData
//
//  Created by Ramazan Memişoğlu on 23.10.2019.
//  Copyright © 2019 Ramazan Memişoğlu. All rights reserved.
//

import UIKit

protocol MyDataSendingDelegate {
    func sendDataToFirstViewController(myData: String)
}

class SecondViewController: UIViewController {

    var text:String = ""
    @IBOutlet weak var lbl : UILabel!
    @IBOutlet weak var txt : UITextField!
    
    //protocol
    var delegate:MyDataSendingDelegate?

    //closure
    var myClosureDataBack:((String) -> ())?
    
    @IBAction func backData()
    {
        NotificationCenter.default.post(name: .notifyA, object: "Data Back with Notification Center")
        //myClosureDataBack?("Back Data with Closure!")
        dismiss(animated: true, completion: nil)
//        if self.delegate != nil {
//            let sendText = txt.text!
//            self.delegate?.sendDataToFirstViewController(myData: sendText)
//            dismiss(animated: true, completion: nil)
//        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl?.text = text
        // Do any additional setup after loading the view.
    }
}
