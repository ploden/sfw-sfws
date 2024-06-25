//
//  SFWSAppDelegate.swift
//  SongsForWorshipSample
//
//  Created by Philip Loden on 6/24/24.
//

import UIKit
import SongsForWorship

class SFWSAppDelegate: SFWAppDelegate {

    override func startAnalytics() {}

    override func shouldPerformAnalytics() -> Bool {
        if _isDebugAssertConfiguration() {
             return false
         }
        return true
    }

}
