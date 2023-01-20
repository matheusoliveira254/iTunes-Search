//
//  AlbumListViewModel.swift
//  iTunes Search
//
//  Created by Matheus Oliveira on 11/3/22.
//

import Foundation

protocol AlbumListViewModelDelegate: AnyObject {
    func updateViews()
}

class AlbumListViewModel {
    
    private let albumService: AlbumServiceable
    var albumResults: [AlbumResults] = []
    weak var delegate: AlbumListViewModelDelegate?
    
    init(albumService: AlbumServiceable = AlbumService(), delegate: AlbumListViewModelDelegate) {
        self.albumService = albumService
        self.delegate = delegate
    }
    
    func loadAlbums(with searchTerm: String) {
        albumService.fetchAlbum(with: searchTerm) { [weak self] result in
            switch result {
            case .success(let topLevelDictionary):
                self?.albumResults = []
                self?.albumResults.append(contentsOf: topLevelDictionary.results)
                DispatchQueue.main.async {
                    self?.delegate?.updateViews()
                }
            case .failure(let error):
                print("Error fetching the data!", error.localizedDescription)
            }
        }
    }
}//End of class
