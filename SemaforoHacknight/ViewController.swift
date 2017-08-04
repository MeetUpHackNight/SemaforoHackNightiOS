//
//  ViewController.swift
//  SemaforoHacknight
//
//  Created by Henrique Valcanaia on 03/08/17.
//  Copyright © 2017 Henrique Valcanaia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ipTextField: UITextField!
    
    private var isOn: Bool = false {
        didSet {
            if let baseAddress = ipTextField.text {
                let address = baseAddress + (isOn ? "on" : "off")
                if let url = URL(string: address) {
                    let request = NSMutableURLRequest(url: url)
                    request.httpMethod = "GET"
                    URLSession.shared.dataTask(with: request as URLRequest).resume()
                } else  {
                    print("Erro montando a URL: '\(address)'")
                }
            }
        }
    }
    
    @IBAction func didChange(_ sender: Any) {
        if let onOffSwitch = sender as? UISwitch {
            isOn = onOffSwitch.isOn
        }
    }
    
    
    
}

