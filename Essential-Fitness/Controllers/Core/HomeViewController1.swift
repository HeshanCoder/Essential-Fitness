//
//  HomeViewController1.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/7/23.
//

import UIKit

class HomeViewController1: UIViewController {
    
    private var workouts: [Workout] = [Workout]()
    
    private let upcomingTable: UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarController?.navigationController?.navigationBar.isHidden = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(upcomingTable)
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
        setupNavigationUI()
        fetchUpcoming()
    }
    
    // setting this e an see the table with data.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }
    
    // get omly upcoming
    private func fetchUpcoming() {
        // to avoid memory leak [weak self]
        APICaller.shared.getUpcomingWorkouts { [weak self] result in
            switch result {
            case .success(let workouts):
                self?.workouts = workouts
                // make sure to run this in main thread
                DispatchQueue.main.async {
                    self?.upcomingTable.reloadData()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func setupNavigationUI(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogout))
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

// extends for upcomingTable.delegate, upcomingTable.dataSource. for that use UITableViewDelegate, UITableViewDataSource so we can data bind
extension HomeViewController1: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         // we acccess indexpath of row
         cell.textLabel?.text = titles[indexPath.row].original_name ?? titles[indexPath.row].original_title ?? "Unknown"
         return cell
         */
        // deque the cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        
        let workout = workouts[indexPath.row]
        // pass titleName and posterURL that expect configure method
        cell.configure(with: TitleViewModel(titleName: (workout.original_title ?? workout.original_name) ?? "Unknown title name", posterURL: workout.poster_path ?? ""))
        return cell
    }
    
    // height for a raw in upcomming list
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    // tapble image on the table cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let workout = workouts[indexPath.row]
        
        // get the tapped cell title
        guard let workoutName = workout.original_title ?? workout.original_name else {
            return
        }
        
        
        APICaller.shared.getMovie(with: workoutName) { [weak self] result in
            switch result {
            case .success(let videoElement):
                DispatchQueue.main.async {
                    let vc = TitlePreviewViewController()
                    vc.configure(with: TitlePreviewViewModel(title: workoutName , youtubeView: videoElement, titleOverview: workout.overview ?? ""), on: workout, isFromHome: true)
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
