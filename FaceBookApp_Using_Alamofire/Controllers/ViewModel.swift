//
//  ViewModel.swift
//  FaceBookApp_Using_Alamofire
//
//  Created by Ramya Oduri on 21/08/22.
//

import Foundation

class ViewModel{
    static let shared : ViewModel = ViewModel()
    let GetPostViewModels = Observable<[PostTableViewModel]>(value: [])
    
}
