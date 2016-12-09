//
//  ViewController.swift
//  MVVM
//
//  Created by omura.522 on 2016/12/09.
//  Copyright © 2016年 fssoftware. All rights reserved.
//

import UIKit

class GreetingViewController : UIViewController {
    let showGreetingButton = UIButton()
    let greetingLabel = UILabel()
    var viewModel: GreetingViewModelProtocol! {
        didSet {
            self.viewModel.greetingDidChange = { [unowned self] viewModel in
                self.greetingLabel.text = viewModel.greeting
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showGreetingButton.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        self.greetingLabel.frame = CGRect(x: 0, y: 50, width: 200, height: 40)
        
        self.showGreetingButton.setTitle("ボタン(通常)", for: UIControlState.normal)
        self.greetingLabel.text = "Start"
        
        self.showGreetingButton.backgroundColor = .red
        
        // Assembling of MVVM
        let model = Person(firstName: "David", lastName: "Blaine")
        let viewModel = GreetingViewModel(person: model)

        self.viewModel = viewModel
        self.showGreetingButton.addTarget(viewModel,
                                          action: #selector(viewModel.showGreeting),
                                          for: .touchUpInside)
        
        self.view.addSubview(showGreetingButton)
        self.view.addSubview(greetingLabel)
    }
}
