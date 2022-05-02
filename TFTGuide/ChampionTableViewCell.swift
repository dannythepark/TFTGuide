//
//  ChampionTableViewCell.swift
//  TFTGuide
//
//  Created by Danny Park on 4/25/22.
//

import UIKit

class ChampionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var championImageView: UIImageView!
    @IBOutlet weak var championName: UILabel!
    @IBOutlet weak var firstTrait: UIImageView!
    @IBOutlet weak var secondTrait: UIImageView!
    @IBOutlet weak var thirdTrait: UIImageView!
    @IBOutlet weak var costLabel: UILabel!

    
}

extension UIImageView {
    
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    
    func loadImage(traitString: String) {
        DispatchQueue.global().async { [weak self] in
            if let image = UIImage(named: traitString) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
    
    
    func updateFirstTraits(traits: [String]) {
        var image = traits[0]
        var stripped = (image[image.index(of:"_")!...])
        //print (stripped.dropFirst())
        loadImage(traitString: String(stripped.dropFirst()))
        
    }
    
    func updateSecondTraits(traits: [String]) {
        var image = traits[1]
        var stripped = (image[image.index(of:"_")!...])
        //print (stripped.dropFirst())
        loadImage(traitString: String(stripped.dropFirst()))
        
    }
    
    func updateThirdTraits(traits: [String]){
            var image = traits[2]
            var stripped = (image[image.index(of:"_")!...])
            //print (stripped.dropFirst())
            loadImage(traitString: String(stripped.dropFirst()))
        }
    
            
}

        

