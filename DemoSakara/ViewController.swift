//
//  ViewController.swift
//  DemoSakara
//
//  Created by Prashanth reddy on 3/14/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.separatorStyle = .none
        viewModel.delegate = self
        
        viewModel.processSwapAPIRequest()
        
        let nib = UINib(nibName: "ShipViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "shipcellidentifier")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.shipsModel?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shipcellidentifier", for: indexPath) as? ShipViewCell else {
            return UITableViewCell()
        }
        let shipData = viewModel.shipsModel?.results[indexPath.row]
        cell.configureView(shipData?.name ?? "No information")
        return cell
    }
}

extension ViewController: ViewModelDelegate {
    func populateListView() {
        DispatchQueue.main.async {[weak self] in
            self?.tableView.reloadData()
        }
    }
}

