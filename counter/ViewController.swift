//
//  ViewController.swift
//  counter
//
//  Created by Илья Лощилов on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countValueLabel: UILabel!
    
    @IBOutlet weak var incrementButton: UIButton!
    
    var count = 0
    
    @IBAction func increaseValue(_ sender: Any) {
        count = count + 1
        countValueLabel.text = "Значение счетчика: \(count)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

