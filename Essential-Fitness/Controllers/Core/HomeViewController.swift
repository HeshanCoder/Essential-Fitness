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
        let table = UITableView()
        
        // register the table
        // register this as reusable identifire as cell
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
    }
    
    // Called to notify the view controller that its view has just laid out its subviews.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // set this to show in whole view
        homeFeedTable.frame  = view.bounds
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

/// extention help to keep our controllers clean.
extension HomeViewController : UITableViewDelegate, UITableViewDataSource{
    
    //numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // we must implement related methodes
        
        // Number of Rows in each Section
        return 20
    }
    
    //callForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        // we must implement related methodes
        
        // which cell we gonna deque for each row. set it with Cell Reuseble Identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = "hellow World"
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
}
