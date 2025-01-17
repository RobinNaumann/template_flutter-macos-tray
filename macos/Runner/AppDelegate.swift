import Cocoa
import FlutterMacOS
//import ServiceManagement

@main
class AppDelegate: FlutterAppDelegate {
  var statusBar: StatusBarController?
  var popover = NSPopover.init()
  override init() {
    popover.behavior = NSPopover.Behavior.transient //to make the popover hide when the user clicks outside of it
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
    
    let controller: FlutterViewController = mainFlutterWindow?.contentViewController as! FlutterViewController
    popover.contentViewController = controller 
    popover.contentSize = NSSize(width: 360, height: 250)
    
    statusBar = StatusBarController.init(popover)
    mainFlutterWindow?.close()
    
    super.applicationDidFinishLaunching(aNotification)
    
  }
}
