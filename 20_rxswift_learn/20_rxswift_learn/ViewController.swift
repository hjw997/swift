//
//  ViewController.swift
//  20_rxswift_learn
//
//  Created by whj on 2023/9/10.
//

import UIKit
import RxSwift
import RxCocoa


class Person {
    var name = "123"
    var age = 10
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var person = Person()
        print(person)

        rx01()

    }


}

extension ViewController {
    private func rx01() {
        let observable = Observable<Int>.create { observer in
            observer.onNext(10)
            observer.onNext(11)

            return Disposables.create()
        }
        observable.subscribe { (event: Event<Int>) in
        }

        observable.subscribe(onNext: { i in
            print("subscribe == \(i)")
        }, onError: { error in
            print("onError == \(error)")
        }, onCompleted: {
            print("onCompleted ==")
        }, onDisposed: {
            print("onDisposed ==")
        })
    }

    private func rx02() {
        ///
        /// period:周期
        /// scheduler:调度。
       Observable<Int>.timer(.seconds(1), period: .seconds(1), scheduler: MainScheduler.instance)
                .takeUntil(rx.deallocated)
                .subscribe(onNext: { i in
                    print(i)
                }, onError: { error in
                    print(error)
                }, onCompleted: {

                }, onDisposed: {

                })

    }

    /// 创建Observe 方式
    private func rx03() {
        let lb = UILabel()
        /// Binder 绑定谁 Target ，以后过来的值 Binder<String> 这里泛型的String
        let binder = Binder<String>(lb) {
            (target: UILabel, s: String) in

        }
    }


}

