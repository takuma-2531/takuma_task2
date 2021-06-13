//
//  ViewController.swift
//  takuma_task2
//
//  Created by 小川卓馬 on 2021/06/06.
//

import UIKit

enum ArithmeticOperation {
    case add
    case subtract
    case multiply
    case divide
}

final class ViewController: UIViewController {
    @IBOutlet weak private var firstNumberTextField: UITextField!
    @IBOutlet weak private var secondNumberTextField: UITextField!
    @IBOutlet weak private var answerLabel: UILabel!
    private var calculation: ArithmeticOperation = .add

    override func viewDidLoad() {
        super.viewDidLoad()
        firstNumberTextField.keyboardType = .numberPad
        secondNumberTextField.keyboardType = .numberPad
    }

    @IBAction private func changeCalculationMethod(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            calculation = .add
        case 1:
            calculation = .subtract
        case 2:
            calculation = .multiply
        case 3:
            calculation = .divide
        default:
            calculation = .add
        }
    }

    @IBAction private func tapCalculateButton(_ sender: UIButton) {
        let num1 = Double(firstNumberTextField.text!) ?? 0.0
        let num2 = Double(secondNumberTextField.text!) ?? 0.0
        switch calculation {
        case .add:
            answerLabel.text = String(num1 + num2)
        case .subtract:
            answerLabel.text = String(num1 - num2)
        case .multiply:
            answerLabel.text = String(num1 * num2)
        case .divide:
            guard num2 != 0.0 else {
                answerLabel.text = "割る数には0以外を入力してください"
                return
            }
            answerLabel.text = String(num1 / num2)
        }
    }
}
