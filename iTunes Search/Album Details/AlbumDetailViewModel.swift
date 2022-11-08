//
//  AlbumDetailViewModel.swift
//  iTunes Search
//
//  Created by Matheus Oliveira on 11/4/22.
//

import UIKit

protocol AlbumDetailViewModelDelegate: AnyObject {
    func updateDetailViews()
}

class AlbumDetailViewModel {
    private let albumDetailService: AlbumDetailSearviceable
    var songDetails: [SongDetails] = []
    weak var delegate: AlbumDetailViewModelDelegate?
    
    init(albumDetailService: AlbumDetailSearviceable = AlbumDetailService(), delegate: AlbumDetailViewModelDelegate) {
        self.albumDetailService = albumDetailService
        self.delegate = delegate
    }
    
    func loadAlbumDetails(with album: AlbumResults) {
        albumDetailService.fetchAlbumDetails(with: album) { [weak self] result in
            switch result {
            case .success(let songDetails):
                self?.songDetails.append(contentsOf: songDetails.results)
                DispatchQueue.main.async {
                    self?.delegate?.updateDetailViews()
                }
            case .failure(let error):
                print("Error fetching the details data!", error.localizedDescription)
            }
        }
    }
}//End of class
