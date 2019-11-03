//
//  EjemploTableViewController.swift
//  RepasoTableViews
//
//  Created by Apple Device 11 on 11/2/19.
//  Copyright © 2019 Apple Device 11. All rights reserved.
//

import UIKit

class EjemploTableViewController: UITableViewController {
    
    //Modelo
    let data = ["Dallas Cowyboys",
                "Baltimore Ravens",
                "Arizona Cardinals",
                "Atlanta Falcons",
                "Baltimore Ravens",
                "Buffalo Bills",
                "Carolina Panthers"
                ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1. definir celda
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        //2. contenido celda
        cell.textLabel?.text = data[indexPath.row]
        //3. regresar celda
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "ShowNFLTeam" else {return}
        
        let destinationVC = segue.destination as! UINavigationController
        let topViewController = destinationVC.viewControllers[0]
        let nflStaticVC = topViewController as! NFLStaticTableViewController
        
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        
        let nflTeam = data[indexPath.row]
        
        nflStaticVC.nflTeam = nflTeam
    }
    
    //Method wrappers
    @IBAction func regresaAVistaPrincipal(_ segue: UIStoryboardSegue) {
        
    }
}
