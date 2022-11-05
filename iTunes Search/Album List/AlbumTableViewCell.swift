//
//  AlbumTableViewCell.swift
//  iTunes Search
//
//  Created by Matheus Oliveira on 11/3/22.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    @IBOutlet weak var albumArtWorkImageView: ServiceRequestImageView!
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
    
    func configureAlbum(with album: AlbumResults?) {
        guard let album = album else {return}
        albumTitleLabel.text = "\(album.collectionName ?? "empty")"
        albumPriceLabel.text = "$\(album.collectionPrice ?? 0.0)"
        trackCountLabel.text = "\(album.trackCount ?? 0) Songs"
        fetchImage(for: album)
    }
    
    func fetchImage(for artist: AlbumResults) {
        guard let imageURL = URL(string: artist.artworkUrl100 ?? "empty image url") else {return}
                albumArtWorkImageView.fetch(using: imageURL)
    }
}// End of class
