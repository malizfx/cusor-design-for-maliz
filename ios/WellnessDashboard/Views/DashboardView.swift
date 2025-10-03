import SwiftUI

struct DashboardView: View {
    // Sample state (replace with real data later)
    @State private var hydrationProgress: Double = 0.65
    @State private var waterConsumedLiters: Double = 1.3
    @State private var waterGoalLiters: Double = 2.0
    @State private var sleepHours: Double = 7.2
    @State private var steps: Int = 6540

    private var dateString: String {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEEE, MMMM d")
        return formatter.string(from: Date())
    }

    private var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12: return "Good morning"
        case 12..<17: return "Good afternoon"
        case 17..<22: return "Good evening"
        default: return "Hello"
        }
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppTheme.Metrics.cardSpacing) {
                header

                focusCard

                statsRow
            }
            .padding(.horizontal, AppTheme.Metrics.horizontalPadding)
            .padding(.bottom, 24)
        }
        .background(AppTheme.Colors.background.ignoresSafeArea())
    }

    private var header: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 4) {
                Text(dateString)
                    .font(.subheadline)
                    .foregroundColor(AppTheme.Colors.secondaryText)
                    .accessibilityLabel("Today is \(dateString)")

                Text(greeting)
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(AppTheme.Colors.primaryText)
                    .accessibilityAddTraits(.isHeader)
            }

            Spacer()

            Image(systemName: "leaf.fill")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(AppTheme.Colors.accent)
                .frame(width: 36, height: 36)
                .background(AppTheme.Colors.accent.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .accessibilityHidden(true)
        }
        .padding(.top, AppTheme.Metrics.verticalPadding)
    }

    private var focusCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center, spacing: 16) {
                RingProgressView(progress: hydrationProgress, lineWidth: 12, color: AppTheme.Colors.hydration)
                    .frame(width: 120, height: 120)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Today's Focus")
                        .font(.footnote.weight(.semibold))
                        .foregroundColor(AppTheme.Colors.secondaryText)

                    Text("Hydration")
                        .font(.title2.weight(.bold))
                        .foregroundColor(AppTheme.Colors.primaryText)

                    Text("\(Int(hydrationProgress * 100))% of goal")
                        .font(.callout)
                        .foregroundColor(AppTheme.Colors.secondaryText)

                    Text("\(waterConsumedLiters, specifier: "%.1f")L of \(waterGoalLiters, specifier: "%.1f")L")
                        .font(.subheadline)
                        .foregroundColor(AppTheme.Colors.primaryText)
                }
            }

            Button(action: { /* TODO: hook up */ }) {
                Text("Log Water")
                    .font(.callout.weight(.semibold))
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(AppTheme.Colors.hydration)
            .controlSize(.regular)
            .frame(minHeight: AppTheme.Metrics.minTapTarget)
            .accessibilityLabel("Log water intake")
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: AppTheme.Metrics.cardCornerRadius)
                .fill(AppTheme.Colors.cardBackground)
                .overlay(
                    RoundedRectangle(cornerRadius: AppTheme.Metrics.cardCornerRadius)
                        .fill(AppTheme.Colors.hydration.opacity(0.06))
                )
        )
        .shadow(color: AppTheme.Colors.shadow,
                radius: AppTheme.Metrics.shadowRadius,
                y: AppTheme.Metrics.shadowYOffset)
        .accessibilityElement(children: .contain)
        .accessibilityLabel("Hydration focus")
        .accessibilityValue("\(Int(hydrationProgress * 100)) percent of goal, \(waterConsumedLiters, specifier: "%.1f") liters consumed out of \(waterGoalLiters, specifier: "%.1f") liters")
    }

    private var statsRow: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Today")
                .font(.headline)
                .foregroundColor(AppTheme.Colors.primaryText)
                .accessibilityAddTraits(.isHeader)

            HStack(spacing: AppTheme.Metrics.cardSpacing) {
                StatCardView(
                    iconName: "drop.fill",
                    title: "Water",
                    value: String(format: "%.1f", waterConsumedLiters),
                    unit: "L",
                    color: AppTheme.Colors.hydration,
                    accessibilityHint: "Water intake so far today"
                )

                StatCardView(
                    iconName: "bed.double.fill",
                    title: "Sleep",
                    value: String(format: "%.1f", sleepHours),
                    unit: "h",
                    color: AppTheme.Colors.sleep,
                    accessibilityHint: "Sleep duration last night"
                )

                StatCardView(
                    iconName: "figure.walk",
                    title: "Steps",
                    value: NumberFormatter.localizedString(from: NSNumber(value: steps), number: .decimal),
                    unit: "",
                    color: AppTheme.Colors.steps,
                    accessibilityHint: "Steps taken today"
                )
            }
            .accessibilityElement(children: .contain)
            .accessibilityLabel("Today's stats")
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .preferredColorScheme(.light)
            .previewDisplayName("Wellness Dashboard")
    }
}
