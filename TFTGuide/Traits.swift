//
//  Traits.swift
//  TFTGuide
//
//  Created by Danny Park on 4/29/22.
//

import Foundation

class Traits {
    
    
    struct Returned: Codable {
        var name: String
        var description: String
    }
    
    
    var urlString = "https://hexcore-api.herokuapp.com/set6.5/traits"
    var traitArray: [Returned] = []
    

    
    func getData(completed: @escaping () -> ()) {
        print ("We are accessing the url \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print ("Error: Could not create URL String from \(urlString)")
            completed()
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print ("error \(error.localizedDescription)")
            }
            
            do {
                self.traitArray = try JSONDecoder().decode([Returned].self, from: data!)
                print ("Here is what we returned \(self.traitArray)")
       } catch {
        print ("JSON Error ")
        }
           completed()
           }
           task.resume()
    }
}
