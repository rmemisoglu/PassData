//
//  ClosureBackViewController.swift
//  PassData
//
//  Created by Ramazan Memişoğlu on 25.10.2019.
//  Copyright © 2019 Ramazan Memişoğlu. All rights reserved.
//

import UIKit

class ClosureBackViewController: UIViewController {

    var text:String = ""
    @IBOutlet weak var lbl : UILabel!
    @IBOutlet weak var txt : UITextField!
    
    //closure
    var myClosureDataBack:((String) -> ())?
    
    @IBAction func backData()
    {
        var sendText = ""
        if txt.text == "" || txt.text == nil{
            sendText = "Back To Closure"
        } else {
            sendText = txt.text!
        }
        myClosureDataBack?(sendText)
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl?.text = text
        // Do any additional setup after loading the view.
    }
}
