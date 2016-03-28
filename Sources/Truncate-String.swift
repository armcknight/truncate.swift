//
//  Truncate-String.swift
//  Truncate
//
//  Created by Andrew McKnight on 3/27/16.
//  Copyright © 2016 Two Ring Software. All rights reserved.
//

import Foundation

/// The side of the string that characters are removed from when truncating.
public enum TruncationSide {

    /// Truncate characters from the left side of a string.
    case Left

    /// Truncate characters from the right side of a string.
    case Right
}

public let defaultTruncationSide = TruncationSide.Right

public extension String {

    public func truncate(toLength length: Int) -> String {
        return self.truncate(toLength: length, truncatingFromSide: defaultTruncationSide)
    }

    public func truncate(toLength length: Int, truncatingFromSide truncationSide: TruncationSide) -> String {
        return self.truncate(toLength: length, truncatingFromSide: truncationSide, truncationIndicator: nil)
    }

    public func truncate(toLength length: Int, truncationIndicator indicator: String?) -> String {
        return self.truncate(toLength: length, truncatingFromSide: defaultTruncationSide, truncationIndicator: indicator)
    }

}

public extension String {

    public func truncate(toLength length: Int, truncatingFromSide truncationSide: TruncationSide, truncationIndicator: String?) -> String {

        if !(0 ..< self.characters.count).contains(length) {
            return self
        }

        if length == 0 {
            return ""
        }

        let shouldIndicateTruncation = truncationIndicator != nil

        switch truncationSide {

            case .Left:
                return truncateLeft(toLength: length, shouldIndicateTruncation: shouldIndicateTruncation, truncationIndicator: truncationIndicator)

            case .Right:
                return truncateRight(toLength: length, shouldIndicateTruncation: shouldIndicateTruncation, truncationIndicator: truncationIndicator)

        }

    }

}

private extension String {

    private func truncateRight(toLength length: Int, shouldIndicateTruncation: Bool, truncationIndicator: String?) -> String {
        if shouldIndicateTruncation {
            let truncated = self.substringToIndex(self.startIndex.advancedBy(length - 1))
            return [truncated, truncationIndicator!].joinWithSeparator("")
        }

        return self.substringToIndex(self.startIndex.advancedBy(length))
    }

    private func truncateLeft(toLength length: Int, shouldIndicateTruncation: Bool, truncationIndicator: String?) -> String {
        let overshoot = self.characters.count - length
        if shouldIndicateTruncation {
            let start = self.startIndex.advancedBy(overshoot + 1)
            let end = self.startIndex.advancedBy(self.characters.count)
            let range = start ..< end
            let truncated = self.substringWithRange(range)
            return [truncationIndicator!, truncated].joinWithSeparator("")
        }

        return self.substringFromIndex(self.startIndex.advancedBy(overshoot))
    }

}
