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
    
    let formatter = TimeFormatter()
    
    func configureSongCell(with song: SongDetails?) {
        guard let song = song,
              let songTitle = song.trackName,
              let songPrice = song.trackPrice,
              let songTime = song.trackTimeMillis else {return}
        let songTimeInSeconds = songTime / 1000
        
        DispatchQueue.main.async {
            self.songTitleLabel.text = songTitle
            self.songPriceLabel.text = "$\(songPrice ?? 0.0)"
            self.songTimeLabel.text = self.formatter.toString(from: songTimeInSeconds)
        }
    }
}//End of class
