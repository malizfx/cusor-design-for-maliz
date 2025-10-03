import SwiftUI

struct RingProgressView: View {
    var progress: Double // 0...1
    var lineWidth: CGFloat = 12
    var color: Color = AppTheme.Colors.accent

    private var clampedProgress: Double { min(max(progress, 0), 1) }

    private var formattedPercent: String {
        let percent = Int((clampedProgress * 100).rounded())
        return "\(percent)%"
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(AppTheme.Colors.separator.opacity(0.25), lineWidth: lineWidth)

            Circle()
                .trim(from: 0, to: clampedProgress)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(.degrees(-90))
                .animation(.easeOut(duration: 0.8), value: clampedProgress)

            Text(formattedPercent)
                .font(.title3.weight(.semibold))
                .foregroundColor(AppTheme.Colors.primaryText)
                .accessibilityHidden(true)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Progress")
        .accessibilityValue(formattedPercent)
    }
}

struct RingProgressView_Previews: PreviewProvider {
    static var previews: some View {
        RingProgressView(progress: 0.65, lineWidth: 12, color: AppTheme.Colors.hydration)
            .frame(width: 140, height: 140)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
