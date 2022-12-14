//
//  ViewController.swift
//  ParseJSONtoTable
//
//  Created by ashraf on 01/11/2022.
//

import UIKit

class TableViewController: UIViewController, NetworkDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    let networkManager = NetworkManager()
    
    var data: [JSON] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        networkManager.delegate = self
    }

    @IBAction func loadButtonTapped(_ sender: UIButton) {
        networkManager.fetchJSON()

    }
    
    func parseDataToTable(data: [JSON]) {
        self.data += data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func passCellToDetailView (_ index: Int) {
        let destVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        destVC.passedPostIDLabel = String(data[index].id)
        destVC.passedNameLabel = data[index].name
        destVC.passedEmailLabel = data[index].email
        destVC.passedBodyLabel = data[index].body
        present(destVC, animated: true)
        
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! tableCell
        cell.title.text = String(data[indexPath.row].id)
        cell.detail.text = data[indexPath.row].email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        passCellToDetailView(indexPath.row)
    }
}
