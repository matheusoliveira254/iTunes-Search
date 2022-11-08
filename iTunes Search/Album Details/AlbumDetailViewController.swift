//
//  ViewController.swift
//  iTunes Search
//
//  Created by Matheus Oliveira on 11/2/22.
//

import UIKit

class AlbumDetailViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var AlbumDetailsArtImageView: UIImageView!
    @IBOutlet weak var AlbumDetailsTitleLabel: UILabel!
    @IBOutlet weak var songsDetailTableView: UITableView!
    
    var albumDetailViewModel: AlbumDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songsDetailTableView.delegate = self
        songsDetailTableView.dataSource = self
        updateDetailViews()
    }
    
    func configureDetail(with albumImage: UIImage, title: String) {
        DispatchQueue.main.async {
            self.AlbumDetailsArtImageView.image = albumImage
            self.AlbumDetailsTitleLabel.text = title
        }
    }
}//End of class

extension AlbumDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Songs"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumDetailViewModel.songDetails.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = songsDetailTableView.dequeueReusableCell(withIdentifier: "songDetailCell", for: indexPath) as? AlbumDetailTableViewCell else {return UITableViewCell()}
        let song = albumDetailViewModel.songDetails[indexPath.row]
        cell.configureSongCell(with: song)
        return cell
    }
}//End of extension

extension AlbumDetailViewController: AlbumDetailViewModelDelegate {
    func updateDetailViews() {
        songsDetailTableView.reloadData()
    }
}
