//
//  CountViewModel.swift
//  CounterApp-RxSwift
//
//  Created by 近藤米功 on 2022/07/28.
//

import RxSwift
import RxCocoa
import UIKit

// MARK: Observable
struct CounterViewModelInput{
    let countUpButtonObservable: Observable<Void>
    let countDownButtonObservable: Observable<Void>
    let countResetButtonObservable: Observable<Void>
}

class CountViewModel{

    private let disposeBag = DisposeBag()

    // MARK: Subject
    let countSubject = PublishSubject<Int>()

    var counter = Counter()

    func setup(input: CounterViewModelInput){
        input.countUpButtonObservable.subscribe (onNext: { [weak self] in
            self?.counter.countUp()
            print(self?.counter.count as Any)
            self?.countSubject.onNext(self?.counter.count ?? 0)
        })
        .disposed(by: disposeBag)

        input.countDownButtonObservable.subscribe (onNext: { [weak self] in
            self?.counter.countDown()
            print(self?.counter.count as Any)
            self?.countSubject.onNext(self?.counter.count ?? 0)
        })
        .disposed(by: disposeBag)

        input.countResetButtonObservable.subscribe (onNext: { [weak self] in
            self?.counter.countReset()
            print(self?.counter.count as Any)
            self?.countSubject.onNext(self?.counter.count ?? 0)
        })
        .disposed(by: disposeBag)
    }
}
