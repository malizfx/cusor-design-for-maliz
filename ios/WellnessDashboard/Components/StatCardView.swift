import SwiftUI

struct StatCardView: View {
    let iconName: String
    let title: String
    let value: String
    let unit: String
    let color: Color
    var accessibilityHint: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image(systemName: iconName)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(color)
                    .frame(width: 28, height: 28)
                    .background(color.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                Text(title)
                    .font(.subheadline.weight(.semibold))
                    .foregroundColor(AppTheme.Colors.secondaryText)

                Spacer(minLength: 0)
            }

            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text(value)
                    .font(.title3.weight(.semibold))
                    .foregroundColor(AppTheme.Colors.primaryText)
                if !unit.isEmpty {
                    Text(unit)
                        .font(.footnote)
                        .foregroundColor(AppTheme.Colors.secondaryText)
                }
            }

            Spacer(minLength: 0)
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 14)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: AppTheme.Metrics.minTapTarget)
        .contentShape(Rectangle())
        .cardStyle()
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(title)
        .accessibilityValue("\(value) \(unit)")
        .accessibilityHint(accessibilityHint ?? "")
    }
}

struct StatCardView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 12) {
            StatCardView(iconName: "drop.fill", title: "Water", value: "1.3", unit: "L", color: AppTheme.Colors.hydration)
            StatCardView(iconName: "bed.double.fill", title: "Sleep", value: "7.2", unit: "h", color: AppTheme.Colors.sleep)
            StatCardView(iconName: "figure.walk", title: "Steps", value: "6,540", unit: "", color: AppTheme.Colors.steps)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
