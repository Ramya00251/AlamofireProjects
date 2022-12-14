//
//  Observable.swift
//  FaceBookApp_Using_Alamofire
//
//  Created by Ramya Oduri on 21/08/22.
//

import Foundation
class Observable<T> {
    var value : T {
        didSet {
            DispatchQueue.main.async {
                self.valueChanged?(self.value)
            }
        }
    }
    private var valueChanged :((T) -> Void)?
    init(value : T) {
        self.value = value
    }
    func addObserver(fireNow : Bool = true , _ onChange: ((T)->Void)?) {
        valueChanged = onChange
        if fireNow {
            onChange?(value)
        }
    }
    func removeObserver() {
        valueChanged = nil
    }
}
