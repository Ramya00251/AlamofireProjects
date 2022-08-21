//
//  Network.swift
//  FaceBookApp_Using_Alamofire
//
//  Created by Ramya Oduri on 21/08/22.
//

import Foundation
import Alamofire

class Network{
    
    let baseUrl = "http://stagetao.gcf.education:3000/"
    
    func getPostData(userId : Int,completion: @escaping (GetPostsModel?) -> Void){
        AF.request("\(self.baseUrl)\(urls.postUrl.rawValue)\(userId)", method: .get).responseDecodable(of: GetPostsModel.self){ response in
            completion(response.value)
        }
    }
    
    func updateLikesData(postId : Int,userId : Int,LikeStatus: Bool ,completion: @escaping(Bool) -> (Void)){
        print("update")
        print("\(self.baseUrl)\(urls.updateLikes.rawValue)/\(postId)/\(userId)/\(!LikeStatus)")
        print("likestatus",LikeStatus)
        AF.request("\(self.baseUrl)\(urls.updateLikes.rawValue)/\(postId)/\(userId)/\(!LikeStatus)", method: .put).responseDecodable(of: UpdateLikesModel.self){ response in
            completion(true)
        }
    }
    
}
