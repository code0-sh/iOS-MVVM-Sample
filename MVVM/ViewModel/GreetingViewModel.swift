//
//  GreetingViewModel.swift
//  MVVM
//
//  Created by omura.522 on 2016/12/09.
//  Copyright © 2016年 fssoftware. All rights reserved.
//

import Foundation

class GreetingViewModel : GreetingViewModelProtocol {
    let person: Person
    var greeting: String? {
        didSet {
            self.greetingDidChange?(self)
        }
    }
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
    required init(person: Person) {
        self.person = person
    }
    @objc func updateGreeting() {
        self.greeting = "Hello" + " " + self.person.firstName + " " + self.person.lastName
    }
}
