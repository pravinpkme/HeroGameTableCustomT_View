//
//  ViewController.swift
//  HeroGamePlanetveracity
//
//  Created by Pravin Kumar on 25/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var maintableview: UITableView!
    
    var heros = [HeroStats]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JSONDownloader {
            self.maintableview.reloadData()
        }
        maintableview.delegate = self
        maintableview.dataSource = self
    }




    func JSONDownloader (completed: @escaping ()->()) {
    
    let url = URL(string: "https://api.opendota.com/api/heroStats")
    
    URLSession.shared.dataTask(with: url!) { (data, response, error) in
        if error == nil {do{
            self.heros = try JSONDecoder().decode([HeroStats].self, from: data!)
            
            DispatchQueue.main.async {
                completed()
            }
            
        }catch {print(error.localizedDescription)}
        }
    }.resume()
    
}
}
extension ViewController : UITableViewDelegate, UITableViewDataSource{
  
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = maintableview.dequeueReusableCell(withIdentifier: "gamecell") as! CustomTVC
        
        cell.tvcname.text = heros[indexPath.row].localized_name
        cell.tvcattribute.text = heros[indexPath.row].primary_attr
        cell.tvcattack.text = heros[indexPath.row].attack_type
        let urlstring = "https://api.opendota.com"+(heros[indexPath.row].img)
        let url = URL(string: urlstring)
        cell.tvcimageview.downloaded(from: url!)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if  let destination = segue.destination as? HeroFullViewController{
            destination.hero = heros[(maintableview.indexPathForSelectedRow?.row)!]
        }
    }
    
}

