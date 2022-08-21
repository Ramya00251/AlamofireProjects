//
//  ViewController.swift
//  FaceBookApp_Using_Alamofire
//
//  Created by Ramya Oduri on 21/08/22.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    var controller : PostListController = {return
        PostListController()
    }()
    var viewModelObject : ViewModel { return
        controller.viewModelObj
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let postNib = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(postNib, forCellReuseIdentifier: "mainCell")
        initBinding()
        controller.start()
    }
    
    func initBinding(){
        viewModelObject.GetPostViewModels.addObserver(fireNow: false){
            getpost in
            self.tableView.reloadData()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelObject.GetPostViewModels.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! PostTableViewCell
        let rowViewModel = viewModelObject.GetPostViewModels.value[indexPath.row]
        if let cell = cell as CellConfigurable? {
            cell.setup(viewModel: rowViewModel)
        }
        return cell
    }
}

