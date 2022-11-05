//
//  AlbumDetailDataProvider.swift
//  iTunes Search
//
//  Created by Matheus Oliveira on 11/4/22.
//

import Foundation

protocol AlbumDetailSearviceable {
    func fetchAlbumDetails(with album: AlbumResults, completion: @escaping (Result<DetailsTopLevelDictionary, NetworkError>) -> Void)
}

struct AlbumDetailService: AlbumDetailSearviceable {
    private let service = APIService()
    private let baseURL = "https://itunes.apple.com/lookup?entity=song&id="
    
    func fetchAlbumDetails(with album: AlbumResults, completion: @escaping (Result<DetailsTopLevelDictionary, NetworkError>) -> Void) {
        guard let albumID = album.collectionId,
              let albumDetailURL = URL(string: baseURL + "\(albumID)") else {completion(.failure(.badURL)); return}
        print(albumDetailURL)
        let request = URLRequest(url: albumDetailURL)
        
        service.perform(request) { result in
            switch result {
            case .success(let albumDetails):
                do {
                    let detailsTopLevelDictionary = try JSONDecoder().decode(DetailsTopLevelDictionary.self, from: albumDetails)
                    completion(.success(detailsTopLevelDictionary))
                } catch {
                    completion(.failure(.errorDecoding(error)))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}//End of struct
