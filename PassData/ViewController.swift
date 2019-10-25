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
        if segue.destination is SecondViewController
        {
            let vc = segue.destination as? SecondViewController
            vc?.text = txt.text!
            vc?.delegate = self
            vc?.myClosureDataBack = { text in
                self.lbl.text = text
            }
        }
    }
}

extension Notification.Name{
    static let notifyA = Notification.Name(rawValue: "NotifyA")
}

