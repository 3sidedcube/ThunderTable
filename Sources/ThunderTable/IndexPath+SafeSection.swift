//
//  IndexPath+SafeSection.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 21/02/2022.
//  Copyright © 2022 3SidedCube. All rights reserved.
//

import Foundation

extension IndexPath {

    /// This provides safe access to `self.section` as with VoiceOver on sometimes an `IndexPath`
    /// is passed to methods which has an empty array of `indexes` and causes a "trap" in the internals of `IndexPath`
    /// - Note: See discussion here: https://developer.apple.com/forums/thread/663787
    var safeSection: Int? {
        guard count == 2 else { return nil }
        return section
    }
}
