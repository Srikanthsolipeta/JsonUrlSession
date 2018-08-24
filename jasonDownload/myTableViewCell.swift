//
//  myTableViewCell.swift
//  jasonDownload
//
//  Created by Srikanth Solipeta on 8/8/18.
//  Copyright © 2018 apex. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var imgImage: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var dobLbl: UILabel!
    
    @IBOutlet weak var countryLbl: UILabel!
    
    @IBOutlet weak var heightLbl: UILabel!
    
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateCell(name:String, dob:String, image:String, height:String, desc:String, country:String) {
        let url = URL(string: image)
        let data = try? Data(contentsOf: url!)
        imgImage.image = UIImage(data: data!)
        nameLbl.text = name
        dobLbl.text=dob
        countryLbl.text = country
        heightLbl.text = height
        descriptionLbl.text = desc
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
