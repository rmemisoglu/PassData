//
//  ViewController.swift
//  PassData
//
//  Created by Ramazan Memişoğlu on 23.10.2019.
//  Copyright © 2019 Ramazan Memişoğlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,MyDataSendingDelegate {
    
    
    @IBOutlet weak var lbl : UILabel!
    @IBOutlet weak var txt : UITextField!
    var text : String = ""
    override func viewDidLoad() {
        let notificationCenter: NotificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(self.notificationBack(myData:)), name: .notifyA, object: nil)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @objc func notificationBack(myData:Notification){
        let data = myData.object as! String
        lbl.text = data
    }
    
    func sendDataToFirstViewController(myData: String) {
        lbl.text = myData
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if txt.text == "" || txt.text == nil{
            text = "Receive from A with Storyboard Segue"
        }
        else {
            text = txt.text!
        }
        
        if segue.destination is UnwindBackViewController
        {
            let vc = segue.destination as? UnwindBackViewController
            vc?.text = text
        }
        
        else if segue.destination is ProtocolBackViewController
        {
            let vc = segue.destination as? ProtocolBackViewController
            vc?.text = text
            vc?.delegate = self
        }
        else if segue.destination is ClosureBackViewController {
            let vc = segue.destination as? ClosureBackViewController
                vc?.text = text
                vc?.myClosureDataBack = { text in
                    self.lbl.text = text
                }
        }
        else if segue.destination is NotificationCenterBackViewController {
            let vc = segue.destination as? NotificationCenterBackViewController
                vc?.text = text
        }
    }
    @IBAction func cancel(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? UnwindBackViewController {
            lbl.text = vc.sendData
        }
    }
}

extension Notification.Name{
    static let notifyA = Notification.Name(rawValue: "NotifyA")
}

