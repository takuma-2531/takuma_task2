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

// 失敗可能イニシャライザはguardと組み合わせて使うのが吉
private extension ArithmeticOperation {
    init?(selectedSegmentIndex: Int) {
        switch selectedSegmentIndex {
        case 0:
            self = .add
        case 1:
            self = .subtract
        case 2:
            self = .multiply
        case 3:
            self = .divide
        default:
            return nil
        }
    }
}

final class ViewController: UIViewController {
    @IBOutlet weak private var firstNumberTextField: UITextField!
    @IBOutlet weak private var secondNumberTextField: UITextField!
    @IBOutlet weak private var answerLabel: UILabel!
    @IBOutlet weak private var methodSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        firstNumberTextField.keyboardType = .numberPad
        secondNumberTextField.keyboardType = .numberPad
    }

    @IBAction private func tapCalculateButton(_ sender: UIButton) {
        let index = methodSegmentedControl.selectedSegmentIndex
        guard let calculation = ArithmeticOperation(selectedSegmentIndex: index) else {
            // nilが返ってきたらボタンを押しても何も起こらない
            return
        }

        let answerText: String

        let num1 = Double(firstNumberTextField.text!) ?? 0.0
        let num2 = Double(secondNumberTextField.text!) ?? 0.0
        switch calculation {
        case .add:
            answerText = String(num1 + num2)
        case .subtract:
            answerText = String(num1 - num2)
        case .multiply:
            answerText = String(num1 * num2)
        case .divide:
            guard num2 != 0.0 else {
                answerText = "割る数には0以外を入力してください"
                break
            }
            answerText = String(num1 / num2)
        }

        answerLabel.text = answerText
    }
}
