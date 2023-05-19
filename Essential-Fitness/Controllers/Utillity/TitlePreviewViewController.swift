//
//  TitlePreviewViewController.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/7/23.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
    
    private var wkouts: Workout?
    private let titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // enable the auto layout so we can build the UI
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry potter"
        return label
    }()
    
    private let overviewLabel: UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0 // that means this can take multiple lines
        label.text = "This is the best movie ever to watch as a kid!"
        return label
    }()
    
    private let downloadButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        /*
        let action = UIAction { action in
            action.downloadTitleAt
            }
        button.addAction(action, for: .touchUpInside)
        */
        return button
    }()


    // this is the view to view the vedio from youtube
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // add sub views the views to main view of the controller
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)
        view.addSubview(downloadButton)
        
        //navigationController?.navigationBar.isHidden = true
        self.tabBarController?.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.navigationController?.navigationBar.backgroundColor = .none
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "save", style: .plain, target: self, action: #selector(downloadTitleAt))
        
        downloadButton.addTarget(self, action: #selector(downloadTitleAt), for: .touchUpInside)
        // build the ui by arranging sub views
        configureConstraints()
    }
    
    @objc private func downloadTitleAt() {
        // basicaly in here we are cownloading a title.  so we can use this to call persistant layer to save title
        print("downloading")
        DataPersistenceManager.shared.downloadTitleWith(model: wkouts!) { result in
            switch result {
            case .success():
                // posting notification.  and this is lisning somewhare in the application. using the same name
                // in other word in somewhere else in the app we can observe to lisnt this notification for given name and do somthing for that.
                // for this it is in downloadsViewController
                NotificationCenter.default.post(name: NSNotification.Name("downloaded"), object: nil)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func configureConstraints() {
        
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 300)
        ]
        
        let overviewLabelConstraints = [
            overviewLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 15),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        let downloadButtonConstraints = [
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 25),
            downloadButton.widthAnchor.constraint(equalToConstant: 140),
            downloadButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        // activate created UI constraints
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(overviewLabelConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }
    
    public func configure(with model: TitlePreviewViewModel, on workout: Workout?, isFromHome: Bool) {
        self.wkouts = workout
        titleLabel.text = model.title
        overviewLabel.text = model.titleOverview
        self.downloadButton.isHidden = true
        if isFromHome {
            self.downloadButton.isHidden = false
        }
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
    
}
