import SwiftUI

enum AppTheme {
    struct Colors {
        static let background = Color(UIColor.systemBackground)
        static let cardBackground = Color(UIColor.secondarySystemBackground)
        static let primaryText = Color(UIColor.label)
        static let secondaryText = Color(UIColor.secondaryLabel)
        static let accent = Color(UIColor.systemTeal)
        static let hydration = Color(UIColor.systemTeal)
        static let sleep = Color(UIColor.systemIndigo)
        static let steps = Color(UIColor.systemGreen)
        static let separator = Color(UIColor.separator)
        static let shadow = Color.black.opacity(0.08)
    }

    struct Metrics {
        static let horizontalPadding: CGFloat = 20
        static let verticalPadding: CGFloat = 16
        static let cardCornerRadius: CGFloat = 16
        static let cardSpacing: CGFloat = 12
        static let shadowRadius: CGFloat = 16
        static let shadowYOffset: CGFloat = 8
        static let minTapTarget: CGFloat = 44
    }
}
