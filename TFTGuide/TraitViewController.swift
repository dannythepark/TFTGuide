//
//  TraitViewController.swift
//  TFTGuide
//
//  Created by Danny Park on 4/29/22.
//

import UIKit

class TraitViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var traits = Traits()
    var imgURL = "https://hexcore-api.herokuapp.com/set6.5/imgs?trait="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        traits.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    

}


extension TraitViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return traits.traitArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TraitTableViewCell
        cell.traitName?.text = traits.traitArray[indexPath.row].name
        cell.traitDesc?.text = traits.traitArray[indexPath.row].description
        
        cell.traitImageView.loadImage(traitString: "\(traits.traitArray[indexPath.row].name)")
        cell.traitImageView.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }



}
