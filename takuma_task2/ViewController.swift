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

class ViewController: UIViewController {

    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var secondNumberTextField: UITextField!
    @IBOutlet weak var selectCalculationMethod: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        firstNumberTextField.keyboardType = .numberPad
        secondNumberTextField.keyboardType = .numberPad
    }


    @IBAction func tapCalculateButton(_ sender: UIButton) {

    }

}

