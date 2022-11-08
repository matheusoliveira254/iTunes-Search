//
//  AlbumDetailTableViewCell.swift
//  iTunes Search
//
//  Created by Matheus Oliveira on 11/4/22.
//

import UIKit

class AlbumDetailTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var songPriceLabel: UILabel!
    @IBOutlet weak var songTimeLabel: UILabel!
    
    func configureSongCell(with song: SongDetails?) {
        guard let song = song else {return}
        DispatchQueue.main.async {
            self.songTitleLabel.text = song.trackName
            self.songPriceLabel.text = "$\(song.trackPrice)"
//            songTimeLabel.text =
        }
    }
}//End of class
