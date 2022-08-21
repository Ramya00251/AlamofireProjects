//
//  PostListController.swift
//  FaceBookApp_Using_Alamofire
//
//  Created by Ramya Oduri on 21/08/22.
//

import Foundation

class PostListController{
    
    var getUserId = 89
    lazy var networkObj: Network = { return
        Network()
    }()
    lazy var viewModelObj: ViewModel = { return
        ViewModel()
    }()
    
    func start(){
        
        networkObj.getPostData(userId: getUserId ){ posts in
            self.buildingViewModel(posts: posts?.data ?? [])
        }
    }
    
    func buildingViewModel(posts : [GetPostData]){
        var rowArray = [PostTableViewModel]()
        for post in posts {
            let profile: PostTableViewModel = PostTableViewModel(userName: post.userName ?? "", totalLikes: post.totalLikes ?? 0, likeStatus: post.likeStatus!, postId: post.postId ?? 0, userId: post.userId ?? 0)
            profile.likeBtnPressed = handleAddContact(userId: getUserId , postId: post.postId ?? 0, status: post.likeStatus!, viewModel: profile)
            rowArray.append(profile)
        }
        self.viewModelObj.GetPostViewModels.value = rowArray
    }
    
    func handleAddContact(userId : Int,postId : Int,status: Bool,viewModel : PostTableViewModel) -> (() -> Void) {
        return{
            self.networkObj.updateLikesData(postId: postId, userId: userId, LikeStatus: status) { success in
                if success == true{
                    self.start()
                }
            }
            
        }
    }
}
