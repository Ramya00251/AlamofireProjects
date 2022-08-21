//
//  LikesModel.swift
//  FaceBookApp_Using_Alamofire
//
//  Created by Ramya Oduri on 21/08/22.
//

import Foundation

struct UpdateLikesModel : Codable{
    let status : String?
    let message : String?
    let data : UpdateLikesStatus
    let errorCode : String?
}
struct UpdateLikesStatus : Codable{
    let likeStatus : String?
    let count: String?
}
