//
//  ViewController.swift
//  MVVM
//
//  Created by omura.522 on 2016/12/09.
//  Copyright © 2016年 fssoftware. All rights reserved.
//

import UIKit

class GreetingViewController : UIViewController, UITextFieldDelegate {
    @IBOutlet weak var showGreetingButton: UIButton!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var greetingTextField: UITextField!
    var viewModel: GreetingViewModelProtocol! {
        didSet {
            self.viewModel.greetingDidChange = { [unowned self] viewModel in
                self.greetingLabel.text = viewModel.greeting
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let model = Person(firstName: "David", lastName: "Blaine")
        let viewModel = GreetingViewModel(person: model)
        self.viewModel = viewModel
        self.showGreetingButton.addTarget(viewModel,
                                          action: #selector(viewModel.updateGreeting),
                                          for: .touchUpInside)
        self.greetingTextField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let firstName = textField.text else {
            return false
        }
        let model = Person(firstName: firstName, lastName: "Blaine")
        self.viewModel = GreetingViewModel(person: model)
        viewModel.updateGreeting()
        textField.resignFirstResponder()
        return true
    }
}
