//
//  Album.swift
//  iTunes Search
//
//  Created by Matheus Oliveira on 11/2/22.
//

import Foundation

struct TopLevelDictionary: Decodable {
    let resultCount: Int
    let results: [AlbumResults]
}

struct AlbumResults: Decodable {
    let collectionId: Int?
    let collectionName: String?
    let trackCount: Int?
    let artworkUrl100: String?
    let collectionPrice: Double?
}
