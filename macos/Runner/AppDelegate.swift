import Cocoa
import FlutterMacOS

//import ServiceManagement

@main
class AppDelegate: FlutterAppDelegate {
  var statusBar: StatusBarController?
  var popover = NSPopover.init()
  override init() {
    popover.behavior = NSPopover.Behavior.transient  //to make the popover hide when the user clicks outside of it
    // quit if another instance is already running.
    AppDelegate.alreadyRunningGuard()
  }
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return false
  }
  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }

  override func applicationDidFinishLaunching(_ aNotification: Notification) {
    // uncomment the line below and the import statement
    // at the top to enable auto-launching on login
    //do {try SMAppService.mainApp.register()} catch {}

    let controller: FlutterViewController =
      mainFlutterWindow?.contentViewController as! FlutterViewController
    popover.contentViewController = controller
    popover.contentSize = NSSize(width: 360, height: 250)

    statusBar = StatusBarController.init(popover)
    mainFlutterWindow?.close()

    super.applicationDidFinishLaunching(aNotification)

  }

  // if the app is already running, show an alert and terminate the new instance.
  // this is to prevent multiple instances of a tray app running at the same time.
  private static func alreadyRunningGuard() {
    let bundleID = Bundle.main.bundleIdentifier!
    let runCount = NSRunningApplication.runningApplications(withBundleIdentifier: bundleID).count

    if runCount <= 1 {
      return
    }

    let a = NSAlert()
    a.messageText = "App already running"
    a.informativeText = "Another instance of this app is already running. Please close it first."
    a.addButton(withTitle: "OK")
    a.runModal()
    NSApp.terminate(nil)

  }
}
