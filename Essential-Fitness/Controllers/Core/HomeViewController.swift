//
//  HomeViewController.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/4/23.
//

import UIKit

class HomeViewController: UIViewController {
    // this way of createing componet is called annonimouse closure pattern
    private let homeFeedTable: UITableView = {
        
        // .grouped like apple users setting app
        // homeFeedTable.frame  = view.bounds in viewDidLayoutSubviews()
        let table = UITableView(frame: .zero, style: .grouped)
        
        // register the table
        // register our custome view cell
        // now this tableView is registerd with ColletionViewTableViewCell and it knows when to load the cell
        table.register(ColletionViewTableViewCell.self, forCellReuseIdentifier: ColletionViewTableViewCell.identifire)
        return table
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "Loading..."
        label.numberOfLines = 2
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.isHidden = true
        
        //self.setupUI()
        //self.label.text = "Fitness App"
        // add this table to our view
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        // hero section
        configureNavbar()
        //homeFeedTable.tableHeaderView = UIView(frame:  CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        //view.bounds.width = full width
        let headerView = MainHeaderUIView(frame:  CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
        
        // set this to show in whole view
        homeFeedTable.frame  = view.bounds
    }
    
    // Called to notify the view controller that its view has just laid out its subviews.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    private func configureNavbar() {
        var image = UIImage(named: "App_icon") // grab the image first
        image = image?.withRenderingMode(.alwaysOriginal) // force the ios system use the Image as it is. (not in default blue color)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white
    }
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        // Bar Button type button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogout))
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
    
    @objc private func didTapLogout() {
        //print("DEBUG PRINT:", "didTapLogout")
        
        AuthService.shared.signOut { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showLogoutError(on: self, with: error)
                return
            }
            
            // set the window for the sceneDelegate and the call its checkAuthentication() function
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
    }
}

//extention help to keep our controllers clean.
extension HomeViewController : UITableViewDelegate, UITableViewDataSource{
    // methode tho define sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    // numberOfRowsInSection
    // this methode define how may rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // we must implement related methodes
        
        // Number of Rows in each Section
        return 1
    }
    
    //cell for this row at
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        // we must implement related methodes
        
        /*
         // which cell we gonna deque for each row. set it with Cell Reuseble Identifier
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
         cell.textLabel?.text = "hellow World"
         return cell
         */
        
        // properly set dequeueReusableCell with our custome table view cell and handle the cell
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: ColletionViewTableViewCell.identifire, for: indexPath) as? ColletionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
        
    }
    
    // set height for Row at
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // set height for header in section
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    // for navigation bar to dtick on the top while scroling
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top // ofcest of the top.
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}
