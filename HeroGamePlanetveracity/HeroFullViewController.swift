//
//  HeroFullViewController.swift
//  HeroGamePlanetveracity
//
//  Created by Pravin Kumar on 25/03/22.
//

import UIKit

class HeroFullViewController: UIViewController {

    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var attributelabel: UILabel!
    
    
    @IBOutlet weak var attacklabel: UILabel!
    
    
    @IBOutlet weak var legslabel: UILabel!
    
    var hero: HeroStats?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = hero?.localized_name
        attacklabel.text = hero?.attack_type
        attributelabel.text = hero?.primary_attr
        legslabel.text = "\((hero?.legs)!)"
        let urlstring = "https://api.opendota.com"+(hero?.img)!
        let url = URL(string: urlstring)
        imageview.downloaded(from: url!)

    }
    

}



extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
