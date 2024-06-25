//
//  SFWSSongTVCellViewModel.swift
//  SongsForWorshipSample
//
//  Created by Philip Loden on 6/24/24.
//

import Foundation
import SongsForWorship

class SFWSSongTVCellViewModel: SongTVCellViewModelProtocol {
    var number: String

    var title: String

    var reference: String

    required init?(_ song: Song) {
        guard let song = song as? SFWSSong else { return nil }

        self.number = song.number
        self.title = song.title
        self.reference = {
            if let ref = song.reference {
                return "Sample Song \(ref)"
            } else {
                return ""
            }
        }()
    }
}
