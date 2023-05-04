//
//  ViewController.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/4/23.
//

import UIKit

class OtherViewController: UIViewController {
    let name: String
    init(with name: String) {
        self.name = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {

    let tableView = UITableView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        // if we want to iitalised somthing we can use this custome intialiser for this class.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView() // run the default implementation is super class first.
        // call before viewDidLoad()
        // we can tell whaterver the this view is.  example a UITableView
        // register a table view cell
        // set table view dataSourece = self
        
        view = tableView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // called right after the given controller is loaded
        // most setup things goes to here ( ex : notification observers, dispach a request to fetch data from the internet/API, applying colors
    
        view.backgroundColor = .systemGreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // after the view is loaded (viewDidLoad()) into memory it is about to appear.. that meens it is not yet visible to the user
        // uses to dispach a request to fetch data from the internet/API, cast resources database, vibrate the divice
        // not much common
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // now the user can see the view
        // in here we can call layout functions. view is loaded to the on-screen so it is a part of the view hierarchy for the contoller
        // uses to dispach a request to fetch data from the internet/API, add sub views to the view, show spinners, prmpt password, analtics, face ID
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // view is about to disappere
        // uses to dismiss the spinners,  do some clean-ups for the UI
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // view now disappear
        // uses to do further clean-ups
    }
    
    deinit {
        // cleanup memory, nil up some variables
        // used to remove notification observers
        NotificationCenter.default.removeObserver(self)
    }
}

