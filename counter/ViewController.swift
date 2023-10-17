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
    func simpleScrollToBottom() {
        let textCount: Int = text.count
        guard textCount >= 1 else { return }
        scrollRangeToVisible(NSRange(location: textCount - 1, length: 1))
    }
}

class ViewController: UIViewController {
    
    private var count = 0
    
    @IBOutlet weak private var countValueLabel: UILabel!
    
    @IBOutlet weak private var incrementButton: UIButton!
    
    @IBOutlet weak private var decreaseButton: UIButton!
    
    @IBOutlet weak private var eraseButton: UIButton!
    
    @IBOutlet weak private var textViewWithStrory: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func updateCounterLabel(){
        countValueLabel.text = "Значение счетчика: \(count)"
    }
    
    private func updateStory(operationType: String){
        textViewWithStrory.text = textViewWithStrory.text + "\n[\(Date().timeOfOperation)]: \(operationType)"
        textViewWithStrory.isEditable = false
        textViewWithStrory.simpleScrollToBottom()
    }
    
    @IBAction private func increaseValue(_ sender: Any) {
        count = count + 1
        updateCounterLabel()
        updateStory(operationType: "значение изменено на +1")
        
    }
    
    @IBAction private func decreaseValue(_ sender: Any) {
        if count > 0 {
            count = count - 1
            updateCounterLabel()
            updateStory(operationType: "значение изменено на -1")
        } else {
            updateStory(operationType: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction private func eraseCounter(_ sender: Any) {
        count = 0
        updateCounterLabel()
        updateStory(operationType: "значение сброшено")
    }
}

