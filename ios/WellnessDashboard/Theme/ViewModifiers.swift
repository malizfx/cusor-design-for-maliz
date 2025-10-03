import SwiftUI

struct CardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(AppTheme.Colors.cardBackground)
            .cornerRadius(AppTheme.Metrics.cardCornerRadius)
            .shadow(color: AppTheme.Colors.shadow,
                    radius: AppTheme.Metrics.shadowRadius,
                    y: AppTheme.Metrics.shadowYOffset)
    }
}

extension View {
    func cardStyle() -> some View { modifier(CardStyle()) }
}
