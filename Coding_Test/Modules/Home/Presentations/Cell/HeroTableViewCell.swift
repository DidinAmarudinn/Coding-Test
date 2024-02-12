//
//  HeroTableViewCell.swift
//  Coding_Test
//
//  Created by didin amarudin on 12/02/24.
//

import UIKit

class HeroTableViewCell: UITableViewCell {
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var rating: UILabel!
    var data: HeroModel?
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupUi() {
        if let data {
            heroImage.image = UIImage(named: data.image)
            rating.text = Rating(rawValue: data.rating)?.label
            name.text = data.name
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
