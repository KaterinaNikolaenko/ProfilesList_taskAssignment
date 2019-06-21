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
    func showErrorMessage()
}

class ProfilesListViewController: BaseCollectionViewController {
    
    private var interactor: ProfilesListInteractorProtocol!
    
    private lazy var dataSource: ProfilesListDataSource = {
        let dataSource = ProfilesListDataSource()
        return dataSource
    }()
    
    private var profiles: [Profile] = []
    
    private let sectionInset: CGFloat = 10
    private let cellMarginHeight: CGFloat = 150
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.configure()
        
        self.interactor.getData()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.collectionView.reloadData()
    }
    
    //MARK: Configuration
    private func configure() {
        
        self.configureCollectionView()
        self.title = "Profiles"
    }
    
    private func configureCollectionView() {
        
        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = dataSource
        self.collectionView.delegate = self
        
        let flow = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = self.sectionInset
        flow.minimumLineSpacing = self.sectionInset
        flow.sectionInset = UIEdgeInsets(top: self.sectionInset, left: self.sectionInset, bottom: 0, right: self.sectionInset)
        
        self.collectionView.registerCell(MainProfileCollectionViewCell.self)
        
        self.dataSource.set(items: profiles)
    }
}

//MARK: - Public
extension ProfilesListViewController {

    func set(interactor: ProfilesListInteractorProtocol) {

        self.interactor = interactor
    }
}

extension ProfilesListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let selectedItem = self.dataSource.item(at: indexPath.row) else {
            return
        }
        var viewController: UIViewController?
        viewController = ViewControllersFactory.getProfileDetailsController(profile: selectedItem)
        self.open(viewController: viewController!, animated: true)
    }
}

extension ProfilesListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let sideSize = collectionView.frame
        
        let size = CGSize(width: (sideSize.width / 2) - (self.sectionInset * 2), height: self.cellMarginHeight)
        
        return size
    }
}

//MARK: - View Protocol
extension ProfilesListViewController: ProfilesListViewProtocol, SimpleAlertProtocol {

    func show(profiles: [Profile]) {

        self.profiles = profiles
        self.dataSource.set(items: profiles)

        self.collectionView.reloadData()
    }
    
    func showErrorMessage() {
        
        self.showGeneralPopUp("Error!", message: "500 Internal Server Error")
    }
}
