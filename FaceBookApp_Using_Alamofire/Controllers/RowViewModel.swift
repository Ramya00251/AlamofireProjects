//
//  RowViewModel.swift
//  FaceBookApp_Using_Alamofire
//
//  Created by Ramya Oduri on 21/08/22.
//

import Foundation

protocol RowViewModel {}

protocol ViewModelPressible {
    var cellPressed: (()->Void)? { get set }
}
