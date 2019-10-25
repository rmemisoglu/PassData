//
//  ProtocolBackViewController.swift
//  PassData
//
//  Created by Ramazan Memişoğlu on 25.10.2019.
//  Copyright © 2019 Ramazan Memişoğlu. All rights reserved.
//

import UIKit

protocol MyDataSendingDelegate {
    func sendDataToFirstViewController(myData: String)
}

class ProtocolBackViewController: UIViewController {

    var text:String = ""
    @IBOutlet weak var lbl : UILabel!
    @IBOutlet weak var txt : UITextField!
    
    //protocol
    var delegate:MyDataSendingDelegate?

    
    @IBAction func backData()
    {
        if self.delegate != nil {
            var sendText = ""
            if txt.text == "" || txt.text == nil{
                sendText = "Back To Protocol"
            } else {
                sendText = txt.text!
            }
            
            self.delegate?.sendDataToFirstViewController(myData: sendText)
            dismiss(animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl?.text = text
        // Do any additional setup after loading the view.
    }
}
