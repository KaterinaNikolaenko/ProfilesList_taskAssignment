//
//  BaseTableViewController.swift
//  Profiles
//
//  Created by Katerina on 20.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import UIKit

class BaseTableViewController: BaseViewController {

    @IBOutlet private(set) weak var tableView: UITableView!
    
    var adjustContentInsetToSafeArea: Bool {
        return true
    }
    
    class var tableViewStyle: UITableView.Style {
        return .grouped
    }
    
    class var pinTableViewToLayoutGuides: Bool {
        return false
    }
    
    //MARK: - Life Cycle
    override func loadView() {
        
        super.loadView()
        
        self.loadTableViewIfNeeded()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.configure()
    }
    
    //MARK: - Private
    private func configure() {
        
        self.configureTableView()
    }
    
    private func configureTableView() {
        
        self.tableView.separatorStyle = .none
        self.tableView.tableFooterView = UIView()
        
        self.tableView.sectionFooterHeight = 0
        self.tableView.sectionHeaderHeight = 0
        
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = self.adjustContentInsetToSafeArea ? .automatic : .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = self.adjustContentInsetToSafeArea
        }
    }
}

extension BaseTableViewController {
    
    private func loadTableViewIfNeeded() {
        
        guard type(of: self).nibFile == nil, self.tableView == nil else {
            return
        }
        
        let tableView = UITableView(frame: self.view.bounds, style: type(of: self).tableViewStyle)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubviewWithConstraints(tableView, constants: (top: 0, bottom: 0, left: 0, right: 0))
        
        self.tableView = tableView
    }
}

