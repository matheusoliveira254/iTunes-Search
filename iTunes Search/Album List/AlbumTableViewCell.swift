//
//  AlbumTableViewCell.swift
//  iTunes Search
//
//  Created by Matheus Oliveira on 11/3/22.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    @IBOutlet weak var albumArtWorkImageView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumPriceLabel: UILabel!
    @IBOutlet weak var trackCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureAlbum(with album: AlbumResults) {
        albumTitleLabel.text = "\(album.collectionName)"
        albumPriceLabel.text = "\(album.collectionPrice)"
        trackCountLabel.text = "\(album.trackCount) Songs"
    }
}
