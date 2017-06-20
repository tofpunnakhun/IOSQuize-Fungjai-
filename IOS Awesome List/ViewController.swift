//
//  ViewController.swift
//  IOS Awesome List
//
//  Created by Punnakhun on 6/15/2560 BE.
//  Copyright © 2560 Punnakhun. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let API_URL = "http://www.anop72.info/api/seed.json"
    typealias DownloadComplete = () -> ()
    var allData = [Data]()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        downloadData()
    }
    
    func downloadData() {
        Alamofire.request(API_URL).responseJSON { response in
            let result = response.result
            
            if let jsonDictionary = result.value as? [Dictionary<String, AnyObject>] {
                for obj in jsonDictionary {
                    let data = Data(dataDictionary: obj)
                    self.allData.append(data)
                    print(obj)
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if allData[indexPath.row].type == "track" {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TrackTableViewCell", for: indexPath) as? TrackTableViewCell {
                let data = allData[indexPath.row]
                cell.configureCell(data: data)
                tableView.rowHeight = 100
                return cell
            }
        } else if allData[indexPath.row].type == "video" {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath) as? VideoTableViewCell {
                let data = allData[indexPath.row]
                cell.configureCell(data: data)
                tableView.rowHeight = 250
                return cell
            }
        } else if allData[indexPath.row].type == "ads" {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "AdsTableViewCell", for: indexPath) as? AdsTableViewCell {
                let data = allData[indexPath.row]
                cell.configureCell(data: data)
                tableView.rowHeight = 200
                return cell
            }
        }
        return UITableViewCell()
    }
}

