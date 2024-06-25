//
//  SFWSMetreCVCellViewModel.swift
//  SongsForWorshipSample
//
//  Created by Philip Loden on 6/24/24.
//

import Foundation
import SongsForWorship
import UIKit

class SFWSMetreCVCellViewModel: MetreCVCellViewModelProtocol {
    var title: String
    var attributedMetreText: NSAttributedString
    var leftText: String
    var rightText: String
    var versesText: String?
    var copyrightText: String?
    var metreLabelFont: UIFont
    var titleLabelFont: UIFont
    var copyrightLabelFont: UIFont

    required init(_ song: Song, copyrightText: String? = nil, settings: Settings, appConfig: AppConfig) {
        metreLabelFont = Helper.defaultFont(withSize: settings.fontSize, appConfig: appConfig, settings: settings)
        titleLabelFont = Helper.defaultFont(withSize: 22.0, forTextStyle: .title2, appConfig: appConfig, settings: settings)
        copyrightLabelFont = UIFont.systemFont(ofSize: 9.0)
        self.copyrightText = copyrightText

        if let song = song as? SFWSSong {
            self.title = song.title
            self.attributedMetreText = song.attributedMetreText() ?? NSAttributedString(string: "")
            self.leftText = song.infoComposer ?? ""
            self.rightText = song.infoTune ?? ""
            self.versesText = "\(song.verseLine1 ?? "")\n\(song.verseLine2 ?? "")"
        } else {
            self.title = ""
            self.attributedMetreText = NSAttributedString(string: "")
            self.leftText = ""
            self.rightText = ""
        }
    }
}
