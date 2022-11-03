//
//  AlbumDataProvider.swift
//  iTunes Search
//
//  Created by Matheus Oliveira on 11/3/22.
//

import Foundation

protocol AlbumServiceable {
    func fetchAlbum(with artistName: String, completion: @escaping (Result<TopLevelDictionary, NetworkError>) -> Void)
}

struct AlbumService: AlbumServiceable {
    private let service = APIService()
    private var baseURL = "https://itunes.apple.com/search?entity=album&attribute=allArtistTerm&limit=25&term="

    func fetchAlbum(with artistName: String, completion: @escaping (Result<TopLevelDictionary, NetworkError>) -> Void) {
        let artistURL = baseURL + artistName.lowercased()
        guard let baseAlbumURL = URL(string: artistURL) else {completion(.failure(.badURL)); return}
        
        let request = URLRequest(url: baseAlbumURL)
        
        service.perform(request) { result in
            switch result {
            case .success(let album):
                do {
                    let topLevelDictionary = try JSONDecoder().decode(TopLevelDictionary.self, from: album)
                    completion(.success(topLevelDictionary))
                } catch {
                    completion(.failure(.errorDecoding(error)))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}//End of struct
