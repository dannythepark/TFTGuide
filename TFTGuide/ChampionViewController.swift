//
//  ViewController.swift
//  TFTGuide
//
//  Created by Danny Park on 4/25/22.
//

import UIKit

class ChampionViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let imgURL = "https://hexcore-api.herokuapp.com/set6.5/imgs?champion="
    let traitURL = "https://hexcore-api.herokuapp.com/set6.5/imgs?trait="
    var champions = Champions()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        champions.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    
}
    

extension ChampionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return champions.champArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Updates Champion Name and Cost Label
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ChampionTableViewCell
        cell.championName?.text = champions.champArray[indexPath.row].name
        cell.costLabel?.text = "\(champions.champArray[indexPath.row].cost)"
        
        
        //Updates Champion Image
        if champions.champArray[indexPath.row].name == "Cho\'Gath" {
            cell.championImageView.loadImage(traitString: "Chogath")
        } else if champions.champArray[indexPath.row].name == "Jarvan IV" {
            cell.championImageView.loadImage(traitString: "JarvanIV")
        } else if champions.champArray[indexPath.row].name == "Kai\'Sa" {
            cell.championImageView.loadImage(traitString: "Kaisa")
        } else if champions.champArray[indexPath.row].name == "Kha\'Zix" {
            cell.championImageView.loadImage(traitString: "Khazix")
        } else if champions.champArray[indexPath.row].name == "Rek\'Sai" {
            cell.championImageView.loadImage(traitString: "RekSai")
        } else if champions.champArray[indexPath.row].name == "Tahm Kench" {
            cell.championImageView.loadImage(traitString: "TahmKench")
        } else if champions.champArray[indexPath.row].name == "Miss Fortune" {
            cell.championImageView.loadImage(traitString: "MissFortune")
        } else {
            if let url = URL(string: imgURL + champions.champArray[indexPath.row].name) {
                cell.championImageView.load(url: url)
            }
        }
        
        
        //Updates Trait Images
        if champions.champArray[indexPath.row].traits.count == 1 {
            cell.firstTrait.updateFirstTraits(traits: champions.champArray[indexPath.row].traits)
            cell.firstTrait.backgroundColor = .white

            cell.secondTrait.isHidden = true
            cell.thirdTrait.isHidden = true
        } else if champions.champArray[indexPath.row].traits.count == 2 {
            cell.firstTrait.updateFirstTraits(traits: champions.champArray[indexPath.row].traits)
            cell.secondTrait.updateSecondTraits(traits: champions.champArray[indexPath.row].traits)
            cell.firstTrait.backgroundColor = .white
            cell.secondTrait.backgroundColor = .white

            cell.thirdTrait.isHidden = true
        } else {
            cell.firstTrait.updateFirstTraits(traits: champions.champArray[indexPath.row].traits)
            cell.secondTrait.updateSecondTraits(traits: champions.champArray[indexPath.row].traits)
            cell.thirdTrait.updateThirdTraits(traits: champions.champArray[indexPath.row].traits)
            cell.firstTrait.backgroundColor = .white
            cell.secondTrait.backgroundColor = .white
            cell.thirdTrait.backgroundColor = .white
            cell.firstTrait.isHidden = false
            cell.secondTrait.isHidden = false
            cell.thirdTrait.isHidden = false
            }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}
