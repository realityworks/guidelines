//
//  ViewController.swift
//  guidelines
//
//  Created by Piotr Suwara on 12/5/20.
//  Copyright © 2020 Realityworks. All rights reserved.
//

import UIKit
import TinyConstraints

class ViewController: UIViewController {
    // MARK: Model
    let viewModel: ViewModel = ViewModel()

    // MARK: View
    let tableView = UITableView()
    let refreshControl = UIRefreshControl()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        style()
        configure()
        viewModel.loadData()
    }

    private func style() {
        // Setup the UI Components how we want them
        self.view.addSubview(tableView)
        tableView.edgesToSuperview()
        tableView.allowsSelection = false
        tableView.estimatedRowHeight = 140
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none

    }

    private func configure() {
        // Setup data bindings and registrations
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to reload")
        refreshControl.addTarget(self, action: #selector(reload), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
        
        viewModel.listenForUpdates(delegate: self)
    }
    
    @objc
    private func reload(sender: AnyObject) {
        viewModel.loadData()
        self.refreshControl.endRefreshing()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfFacts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell else { return UITableViewCell() }
        if let fact = viewModel.getFact(at: indexPath.row) {
            cell.configure(with: fact)
        }
        
        return cell
    }
}

extension ViewController: StoreFactsLoaderDelegate {
    func didUpdateFacts() {
        DispatchQueue.main.async { [unowned self] in
            self.title = self.viewModel.title
            self.tableView.reloadData()
        }
    }
    
    var delegateName: String { "\(self)"}
}
