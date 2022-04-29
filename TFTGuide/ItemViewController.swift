//
//  ItemViewController.swift
//  TFTGuide
//
//  Created by Danny Park on 4/29/22.
//

import UIKit

class ItemViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var items = Items()
    var imgURL = "https://hexcore-api.herokuapp.com/set6.5/imgs?item="
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        items.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    

}


extension ItemViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemTableViewCell
        cell.itemName?.text = items.itemArray[indexPath.row].name
        cell.itemDesc?.text = items.itemArray[indexPath.row].description
        if let url = URL(string: imgURL + "\(items.itemArray[indexPath.row].id)") {
            cell.itemImageView.load(url: url)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

}
