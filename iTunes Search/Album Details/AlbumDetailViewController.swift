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
    
    private var albumDetailViewModel: AlbumDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        songsDetailTableView.delegate = self
//        songsDetailTableView.dataSource = self
    }
    
    func configureDetail(with albumImage: UIImage, title: String) {
        DispatchQueue.main.async {
            self.AlbumDetailsArtImageView.image = albumImage
            self.AlbumDetailsTitleLabel.text = title
        }
    }
}//End of class

//extension AlbumDetailViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
    
//}//End of extension

