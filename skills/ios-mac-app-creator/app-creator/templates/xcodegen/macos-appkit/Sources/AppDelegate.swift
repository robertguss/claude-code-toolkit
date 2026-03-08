import AppKit

@main
final class AppDelegate: NSObject, NSApplicationDelegate {
    private var window: NSWindow?

    func applicationDidFinishLaunching(_ notification: Notification) {
        let viewController = NSViewController()
        let rootView = NSView()
        rootView.wantsLayer = true
        rootView.layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor
        viewController.view = rootView

        let window = NSWindow(contentViewController: viewController)
        window.title = "__APP_NAME__"
        window.setContentSize(NSSize(width: 720, height: 480))
        window.makeKeyAndOrderFront(nil)
        self.window = window
    }
}
