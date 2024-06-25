//
//  SFWSTunesLoader.swift
//  SongsForWorshipSample
//
//  Created by Philip Loden on 6/24/24.
//

import Foundation
import SongsForWorship

class SFWSTunesLoader: TunesLoader {
    static func filename(forTuneInfo tuneInfo: SongsForWorship.SongCollectionTuneInfo, song: SongsForWorship.Song) -> String? {
        return nil
    }
    
    static func loadTunes(forSong aSong: SongsForWorship.Song, appConfig: SongsForWorship.AppConfig, tuneInfos: [SongsForWorship.SongCollectionTuneInfo], completion: @escaping ((any Error)?, [any SongsForWorship.TuneDescriptionProtocol]) -> Void) {
        completion(nil, [])
    }
    
    static func defaultFilename(forTuneInfo tuneInfo: SongsForWorship.SongCollectionTuneInfo, song: SongsForWorship.Song) -> String? {
        return nil
    }
}
