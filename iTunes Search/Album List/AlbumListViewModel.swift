//
//  AlbumListViewModel.swift
//  iTunes Search
//
//  Created by Matheus Oliveira on 11/3/22.
//

import Foundation

class AlbumListViewModel {
    
    private let albumService: AlbumServiceable
    var topLevelDictionary: TopLevelDictionary?
    var albumResults: [AlbumResults] = []
    var searchTerm: String?
//    weak var delegate: AlbumListTableViewDelegate?
    
    init(albumService: AlbumServiceable = AlbumService()) {
        self.albumService = albumService
    }
    
    func loadAlbums() {
        guard let searchTerm = searchTerm else {return}
        albumService.fetchAlbum(with: searchTerm) { [weak self] result in
            switch result {
            case .success(let topLevelDic):
                self?.topLevelDictionary = topLevelDic
                self?.albumResults.append(contentsOf: topLevelDic.results)
            case .failure(let error):
                print("Error fetching the data!", error.localizedDescription)
//                self?.delegate.encountered(error)

            }
        }
    }
    
}//End of class
