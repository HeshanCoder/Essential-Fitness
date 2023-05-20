//
//  DownloadsViewController.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/8/23.
//

import UIKit

class DownloadsViewController: UIViewController {

    private var workouts: [WorkoutItems] = [WorkoutItems]()
       
       private let downloadedTable: UITableView = {
           
           let table = UITableView()
           table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
           return table
       }()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .systemBackground
           view.addSubview(downloadedTable)
           navigationController?.navigationBar.prefersLargeTitles = true
           navigationController?.navigationItem.largeTitleDisplayMode = .always
           downloadedTable.delegate = self
           downloadedTable.dataSource = self
           fetchLocalStorageForDownload()
           NotificationCenter.default.addObserver(forName: NSNotification.Name("downloaded"), object: nil, queue: nil) { _ in
               self.fetchLocalStorageForDownload()
           }
       }
       
       
       private func fetchLocalStorageForDownload() {
           
           // [weak self] to prevent momory leak
           DataPersistenceManager.shared.fetchingTitlesFromDataBase { [weak self] result in
               switch result {
               case .success(let workouts):
                   self?.workouts = workouts
                   // need to dispatch
                   DispatchQueue.main.async {
                       self?.downloadedTable.reloadData()
                   }
               case .failure(let error):
                   print(error.localizedDescription)
               }
           }
       }
       
       // set the table in full view
       override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           downloadedTable.frame = view.bounds
       }
   }



   extension DownloadsViewController: UITableViewDelegate, UITableViewDataSource {
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return workouts.count
       }
       
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
               return UITableViewCell()
           }
           
           let workout = workouts[indexPath.row]
           cell.configure(with: TitleViewModel(titleName: (workout.original_title ?? workout.original_name) ?? "Unknown title name", posterURL: workout.poster_path ?? ""))
           return cell
       }
       
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 140
       }
       
       // deleting somthing from the table
       func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           switch editingStyle {
           case .delete:
               // deleting it form core database
               DataPersistenceManager.shared.deleteTitleWith(model: workouts[indexPath.row]) { [weak self] result in
                   switch result {
                   case .success():
                       print("Deleted fromt the database")
                   case .failure(let error):
                       print(error.localizedDescription)
                   }
                   // below 2 line order matters
                   self?.workouts.remove(at: indexPath.row)
                   // remve the cell form the row - remember to call this after deleting from database
                   tableView.deleteRows(at: [indexPath], with: .fade)
               }
           default:
               break;
           }
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
           
           let workout = workouts[indexPath.row]
            
           guard let titleName = workout.original_title ?? workout.original_name else {
               return
           }
           
           
           APICaller.shared.getWorkout(with: titleName) { [weak self] result in
               switch result {
               case .success(let videoElement):
                   DispatchQueue.main.async {
                       var wk: Workout?
                       let vc = TitlePreviewViewController()
                    vc.configure(with: TitlePreviewViewModel(title: titleName, youtubeView: videoElement, titleOverview: workout.overview ?? "", timeDuration: workout.minute_average ?? "0m", repCount: workout.reps_and_sets ?? "No reps*", caloriCount: Int(workout.calories_count ?? 0)),on: wk, isFromHome: false)
                       self?.navigationController?.pushViewController(vc, animated: true)
                   }
                   
                   
               case .failure(let error):
                   print(error.localizedDescription)
               }
           }
       }
       
       
       
   }
