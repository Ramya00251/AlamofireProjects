//
//  PostTableViewCell.swift
//  FaceBookApp_Using_Alamofire
//
//  Created by Ramya Oduri on 21/08/22.
//

import UIKit

class PostTableViewCell: UITableViewCell,CellConfigurable {
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var likeImageButton: UIButton!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @objc func likeButtonPressed(sender : UIButton){
        tableViewCellViewModelObject?.likeBtnPressed?()
    }
    
    var tableViewCellViewModelObject : PostTableViewModel?
    
    func setup(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? PostTableViewModel else {
            return
        }
        self.tableViewCellViewModelObject = viewModel
        userNameLabel.text = viewModel.userName
        likeCount.text = String(viewModel.totalLikes)
        likeImageButton.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        if viewModel.likeStatus == true {
            likeImageButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
        }
        else {
            likeImageButton.setImage(UIImage(systemName:  "hand.thumbsup"), for: .normal)
        }
        setNeedsLayout()
    }
}



