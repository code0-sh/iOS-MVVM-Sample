//
//  GreetingViewModelProtocol.swift
//  MVVM
//
//  Created by omura.522 on 2016/12/09.
//  Copyright © 2016年 fssoftware. All rights reserved.
//

protocol GreetingViewModelProtocol: class {
    var greeting: String? { get }
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())? { get set }
    init(person: Person)
    func updateGreeting()
}
