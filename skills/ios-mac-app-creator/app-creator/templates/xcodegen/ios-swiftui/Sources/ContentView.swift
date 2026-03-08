import SwiftUI

struct ContentView: View {
    private let intentMessages = [
        "Translating your idea into pixels…",
        "Warming up the app brain…",
        "Assembling the first screen…",
        "Brewing a working prototype…",
        "Making it real, one view at a time…",
    ]
    private let messageTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State private var messageIndex = 0

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                AppIconPlaceholder()
                Text("__APP_NAME__")
                    .font(.system(size: 34, weight: .bold))
                    .multilineTextAlignment(.center)
                Text(intentMessages[messageIndex])
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                ProgressView("Getting things ready…")
                    .progressViewStyle(.circular)
                    .font(.system(size: 18, weight: .semibold))
            }
            .padding(24)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onReceive(messageTimer) { _ in
                messageIndex = (messageIndex + 1) % intentMessages.count
            }
        }
    }
}

private struct AppIconPlaceholder: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [.accentColor, .accentColor.opacity(0.7)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .strokeBorder(.white.opacity(0.25), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.15), radius: 12, y: 6)

            Image(systemName: "app.fill")
                .font(.system(size: 40, weight: .semibold))
                .foregroundStyle(.white)
        }
        .frame(width: 104, height: 104)
        .accessibilityHidden(true)
    }
}

#Preview {
    ContentView()
}
