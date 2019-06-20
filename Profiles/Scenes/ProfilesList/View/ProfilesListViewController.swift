//
//  ProfilesListViewController.swift
//  Profiles
//
//  Created by Katerina on 20.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import UIKit

protocol ProfilesListViewProtocol: class {
    
    func show(profiles: [Profile])
}

class ProfilesListViewController: BaseTableViewController {

    private var interactor: ProfilesListInteractorProtocol!
    
    private lazy var dataSource: ProfilesListDataSource = {
        let dataSource = ProfilesListDataSource()
        return dataSource
    }()
    
    private var profiles: [Profile] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.configure()
        
        self.interactor.getData()
    }
    
    //MARK: Configuration
    private func configure() {
        
        self.configureTableView()
        
        self.configureNavigationBar()
    }
    
    private func configureTableView() {
        
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 110
        
        self.dataSource.registerRequiredCells(for: self.tableView)
        self.dataSource.set(items: profiles)
    }
    
    private func configureNavigationBar() {
        
    }
}

//MARK: - Public
extension ProfilesListViewController {
    
    func set(interactor: ProfilesListInteractorProtocol) {
        
        self.interactor = interactor
    }
}

//MARK: - Table View Delegate
extension ProfilesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - View Protocol
extension ProfilesListViewController: ProfilesListViewProtocol {
    
    func show(profiles: [Profile]) {
        
        self.profiles = profiles
        
        self.tableView.reloadData()
    }
}
