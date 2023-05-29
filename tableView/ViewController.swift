//
//  ViewController.swift
//  tableView
//
//  Created by Yiğit Yeler on 26.03.2023.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tabloGorunumu: UITableView!
    var dizi = [String]()
    var goruntuler = [UIImage]()
    
    var tiklananSehir = ""
    var tiklananGorsel = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabloGorunumu.delegate = self
        tabloGorunumu.dataSource = self
        // Do any additional setup after loading the view.
        
        // Hocam sanal makinede safaride dediginiz site acilmadi o yuzden bu bilgilerle yaptim
        dizi.append("Izmir")
        dizi.append("Samsun")
        dizi.append("Urfa")
        dizi.append("Ankara")
        dizi.append("Elazig")
        dizi.append("Eskisehir")
        dizi.append("Istanbul")
        dizi.append("Izmit")
        dizi.append("Zonguldak")
        dizi.append("Malatya")
        
        
        goruntuler.append(UIImage(named: "luffy")!)
        goruntuler.append(UIImage(named: "luffy")!)
        goruntuler.append(UIImage(named: "luffy")!)
        goruntuler.append(UIImage(named: "luffy")!)
        goruntuler.append(UIImage(named: "luffy")!)
        goruntuler.append(UIImage(named: "pirateking")!)
        goruntuler.append(UIImage(named: "pirateking")!)
        goruntuler.append(UIImage(named: "pirateking")!)
        goruntuler.append(UIImage(named: "pirateking")!)
        goruntuler.append(UIImage(named: "pirateking")!)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dizi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hucre = UITableViewCell()
        
        var icerik = hucre.defaultContentConfiguration()
        icerik.text = dizi[indexPath.row]
        hucre.contentConfiguration = icerik
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tiklananSehir = dizi[indexPath.row]
        tiklananGorsel = goruntuler[indexPath.row]
        performSegue(withIdentifier: "gorselVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gorselVC" {
            let gidilecekHedef = segue.destination as! gorselVC
            gidilecekHedef.secilenSehir = tiklananSehir
            gidilecekHedef.secilenGoruntu = tiklananGorsel
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.dizi.remove(at: indexPath.row)
            self.goruntuler.remove(at: indexPath.row)
            self.tabloGorunumu.deleteRows(at: [indexPath], with:.fade)
        }
    }

}

