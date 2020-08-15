//
//  ViewController.swift
//  Webinar
//
//  Created by MacBook Air on 11.08.2020.
//  Copyright © 2020 VardanMakhsudyan. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var list: [String] = ["USD", "GBP", "RUB", "EUR"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "rateDetails", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "rateDetails" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationViewController: TableViewController = segue.destination as! TableViewController
                destinationViewController.rate = list[indexPath.row]
            }
        }
    }
}

