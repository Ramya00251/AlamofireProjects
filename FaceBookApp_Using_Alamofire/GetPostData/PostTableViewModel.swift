//
//  PostTableViewModel.swift
//  FaceBookApp_Using_Alamofire
//
//  Created by Ramya Oduri on 21/08/22.
//

import Foundation

class PostTableViewModel: RowViewModel{
    let userName : String
    let totalLikes : Int
    let likeStatus : Bool
    let postId : Int
    let userId : Int
    
    var likeBtnPressed : (()-> Void)?
    
    init(userName : String,totalLikes : Int,likeStatus : Bool,postId : Int,userId : Int,likeBtnPressed : (() -> Void)? = nil){
        self.userName = userName
        self.totalLikes = totalLikes
        self.likeStatus = likeStatus
        self.postId = postId
        self.userId = userId
        self.likeBtnPressed = likeBtnPressed
    }
    
}
