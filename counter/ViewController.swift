//
//  ViewController.swift
//  counter
//
//  Created by Илья Лощилов on 16.10.2023.
//

import UIKit

extension Date {
    var timeOfOperation: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY HH:mm:ss"
        return dateFormatter.string(from: self)
    }
    
}

extension UITextView {
    func simple_scrollToBottom() {
        let textCount: Int = text.count
        guard textCount >= 1 else { return }
        scrollRangeToVisible(NSRange(location: textCount - 1, length: 1))
    }
}

class ViewController: UIViewController {
    
    func counterValue(){
        countValueLabel.text = "Значение счетчика: \(count)"
    }
    
    func updateStory(operationType: String){
        textViewWithStrory.text = textViewWithStrory.text + "\n[\(Date().timeOfOperation)]: \(operationType)"
        textViewWithStrory.isEditable = false
        textViewWithStrory.simple_scrollToBottom()
    }
    
    @IBOutlet weak var countValueLabel: UILabel!
    
    @IBOutlet weak var incrementButton: UIButton!
    
    var count = 0
    
    
    @IBAction func increaseValue(_ sender: Any) {
        count = count + 1
        counterValue()
        updateStory(operationType: "значение изменено на +1")
        
    }
    
    @IBOutlet weak var decreaseButton: UIButton!
    
    
    @IBAction func decreaseValue(_ sender: Any) {
        if count > 0 {
            count = count - 1
            counterValue()
            updateStory(operationType: "значение изменено на -1")
        } else {
            updateStory(operationType: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBOutlet weak var eraseButton: UIButton!
    
    
    @IBAction func eraseCounter(_ sender: Any) {
        count = 0
        counterValue()
        updateStory(operationType: "значение сброшено")
    }
    
    @IBOutlet weak var textViewWithStrory: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

