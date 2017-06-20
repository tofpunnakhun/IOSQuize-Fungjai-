//
//  TrackTableViewCell.swift
//  IOS Awesome List
//
//  Created by Punnakhun on 6/15/2560 BE.
//  Copyright © 2560 Punnakhun. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var trackName: UILabel!
    
    func configureCell(data: Data) {
        trackName.text = data.name
        configureImage(imageUrl: data.cover)
    }
    
    private func configureImage(imageUrl : String) {
        
        let url = URL(string: imageUrl)
        let urlRequest = URLRequest(url: url!)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            // do stuff with response, data & error here
            if error != nil {
                print(error!)
            }
            DispatchQueue.global(qos: .userInitiated).async {
                let image = data
                // Bounce back to the main thread to update the UI
                DispatchQueue.main.async {
                    self.trackImage.image = UIImage(data: image!)
                }
            }
        }).resume()
    }
}
