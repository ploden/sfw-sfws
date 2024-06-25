//
//  SFWSSong.swift
//  SongsForWorshipSample
//
//  Created by Philip Loden on 6/24/24.
//

import Foundation
import SongsForWorship

class SFWSSong: Song {
    public init(index: Int,
                number: String,
                title: String,
                reference: String? = nil,
                stanzas: [String],
                pdfPageNumbers: [Int],
                isTuneCopyrighted: Bool,
                tune: Tune? = nil,
                verseLine1: String? = nil,
                verseLine2: String? = nil,
                infoTune: String? = nil,
                infoComposer: String? = nil)
    {
        super.init(index: index, number: number, title: title, reference: reference, stanzas: stanzas, pdfPageNumbers: pdfPageNumbers, isTuneCopyrighted: isTuneCopyrighted)
        self.verseLine1 = verseLine1
        self.verseLine2 = verseLine2
        self.infoTune = infoTune
        self.infoComposer = infoComposer
    }

    public var verseLine1: String?
    public var verseLine2: String?
    public var infoTune: String?
    public var infoComposer: String?

    open override class func readSongs(fromFile jsonFilename: String, directory: String) -> [Song] {
        let decoder = JSONDecoder()

        guard
            let path = Bundle.main.path(forResource: jsonFilename, ofType: "json", inDirectory: directory),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)),
            let songContainers = try? decoder.decode([SFWSSongContainer].self, from: jsonData)
        else
        {
            let path = Bundle.main.path(forResource: jsonFilename, ofType: "json", inDirectory: directory)!
            let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
            let songContainers = try! decoder.decode([SFWSSongContainer].self, from: jsonData)
            fatalError("SFWSSong: readSongs: failed to read songs")
        }

        var idx = 0

        let songs = songContainers.compactMap { songContainer in
            let song = SFWSSong(index: idx,
                               number: songContainer.number,
                               title: songContainer.title,
                               reference: songContainer.reference,
                               stanzas: songContainer.stanzas,
                               pdfPageNumbers: songContainer.pdfPageNumbers,
                               isTuneCopyrighted: songContainer.isTuneCopyrighted ?? false,
                               tune: nil,
                               verseLine1: songContainer.verseLine1,
                               verseLine2: songContainer.verseLine2,
                               infoTune: songContainer.infoTune,
                               infoComposer: songContainer.infoComposer)

            idx += 1
            return song
        }

        return songs
    }

}
