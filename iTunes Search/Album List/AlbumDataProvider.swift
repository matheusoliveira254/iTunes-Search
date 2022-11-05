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
    private let baseURL = "https://itunes.apple.com/search"

    func fetchAlbum(with artistName: String, completion: @escaping (Result<TopLevelDictionary, NetworkError>) -> Void) {
        let artistName = artistName.lowercased()
        
        guard let baseAlbumURL = URL(string: baseURL) else {completion(.failure(.badURL)); return}
        let searchQuery = URLQueryItem(name: "term", value: artistName)
        let entityQuery = URLQueryItem(name: "entity", value: "album")
        let attributeQuery = URLQueryItem(name: "attribute", value: "allArtistTerm")
        let limitQuery = URLQueryItem(name: "limit", value: "25")
        var components = NSURLComponents(url: baseAlbumURL, resolvingAgainstBaseURL: true)
        components?.queryItems = [entityQuery, attributeQuery, limitQuery, searchQuery]
        guard let finalURL = components?.url else {return}
        
        print(finalURL)
        let request = URLRequest(url: finalURL)
        
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
