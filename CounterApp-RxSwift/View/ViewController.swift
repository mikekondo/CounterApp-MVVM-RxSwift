//
//  ViewController.swift
//  CounterApp-RxSwift
//
//  Created by 近藤米功 on 2022/07/28.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    // MARK: - UI Parts
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var countUpButton: UIButton!
    @IBOutlet private weak var countDownButton: UIButton!
    @IBOutlet private weak var countResetButton: UIButton!

    let disposeBag = DisposeBag()

    let countViewModel = CountViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    func setupBindings(){
        let input = CounterViewModelInput(countUpButtonObservable: countUpButton.rx.tap.asObservable(), countDownButtonObservable: countDownButton.rx.tap.asObservable(), countResetButtonObservable: countResetButton.rx.tap.asObservable())

        countViewModel.setup(input: input)
        countViewModel.countSubject.subscribe (onNext: { count in
            self.countLabel.text = String(count)
        })
        .disposed(by: disposeBag)
    }
}

