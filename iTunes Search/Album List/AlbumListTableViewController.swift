//
//  AlbumListTableViewController.swift
//  iTunes Search
//
//  Created by Matheus Oliveira on 11/3/22.
//

import UIKit

class AlbumListTableViewController: UITableViewController {

    @IBOutlet weak var artistSearchBar: UISearchBar!
    
    private var albumListViewModel: AlbumListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.albumListViewModel = AlbumListViewModel(delegate: self)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Albums"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumListViewModel.albumResults.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as? AlbumTableViewCell else {return UITableViewCell()}
        let album = albumListViewModel.albumResults[indexPath.row]
        cell.configureAlbum(with: album)
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}//End of class

extension AlbumListTableViewController: AlbumListViewModelDelegate {
    func updateViews() {
        tableView.reloadData()
    }
}

extension AlbumListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        albumListViewModel.loadAlbums(with: searchText)
    }
}
