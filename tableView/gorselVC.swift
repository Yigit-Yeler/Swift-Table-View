//
//  gorselVC.swift
//  tableView
//
//  Created by Yiğit Yeler on 26.03.2023.
//

import UIKit

class gorselVC: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    var secilenSehir = ""
    var secilenGoruntu = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel.text = secilenSehir
        myImage.image = secilenGoruntu
    }
}
