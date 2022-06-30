//
//  NewsTableViewCell.swift
//  FalconInterview
//
//  Created by Justin Haung on 2022/6/30.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    static let identifier = "NewsTableViewCell"
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
