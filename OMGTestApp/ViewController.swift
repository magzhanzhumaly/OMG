//
//  ViewController.swift
//  OMGTestApp
//
//  Created by Magzhan Zhumaly on 05.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var tableViewCellsCount = 0
    var data = [[Int]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        generateData()
    }
    
    func setup() {
        tableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.id)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func generateData() {
        let yCount = Int.random(in: 100..<200)
        for _ in 0..<yCount {
            var row: [Int] = []
            
            let xCount = Int.random(in: 3..<7)
            for _ in 0..<xCount {
                row.append(Int.random(in: 0..<100))
            }

            data.append(row)
        }
        
        tableView.reloadData()
    }
    
}

// MARK: Table View Extensions
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.id, for: indexPath) as! MyTableViewCell
        
        cell.configure(with: data[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
