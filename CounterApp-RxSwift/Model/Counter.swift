//
//  counter.swift
//  CounterApp-RxSwift
//
//  Created by 近藤米功 on 2022/07/28.
//

import UIKit
import RxSwift
import RxCocoa

class Counter{
    var count: Int = 0

    func countUp(){
        count += 1
    }

    func countDown(){
        count -= 1
    }

    func countReset(){
        count = 0
    }
}
