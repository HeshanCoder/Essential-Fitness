//
//  WebViewerController.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/5/23.
//

import UIKit
import WebKit

class WebViewerController: UIViewController {
    
    private let webView = WKWebView()
    private let urlString: String
    
    init(with urlString: String){
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // if we cant construct a URL from string that pass this will return
        guard let url = URL(string: self.urlString) else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        // if we have URL this will load it in webview
        self.webView.load(URLRequest(url: url))
    }
    
    private func setupUI() {
        
        // top Done button
        //  work only if it in navigation controller. modally not working this
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        // add navigation style to done button
        self.navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        
        self.view.addSubview(webView)
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.webView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    
    @objc private func didTapDone() {
        self.dismiss(animated: true, completion: nil)
    }
}
