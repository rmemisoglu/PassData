//
//  UnwindBackViewController.swift
//  PassData
//
//  Created by Ramazan Memişoğlu on 25.10.2019.
//  Copyright © 2019 Ramazan Memişoğlu. All rights reserved.
//

import UIKit

class UnwindBackViewController: UIViewController {

    var text:String = ""
    var sendData:String = ""
    @IBOutlet weak var lbl : UILabel!
    @IBOutlet weak var txt : UITextField!
    
    @IBAction func backData()
    {
        self.performSegue(withIdentifier: "BackToA", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BackToA" {
            if txt.text == "" || txt.text == nil{
                sendData = "Back To Unwind"
            } else {
                sendData = txt.text!
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl?.text = text
        // Do any additional setup after loading the view.
    }
}
