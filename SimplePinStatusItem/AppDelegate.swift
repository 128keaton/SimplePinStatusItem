//
//  AppDelegate.swift
//  SimplePinStatusItem
//
//  Created by Keaton Burleson on 3/30/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    
    var popover: PinnablePopover?
    var popoverVC: ViewController?
    
    let menuBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.initPopover()
        self.initMenuBarItem(title: "Open Popover")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    fileprivate func initMenuBarItem(title: String) {
        self.menuBarItem.button?.title = title
        self.menuBarItem.button?.target = self
    }
    
    
    fileprivate func initPopover() {
        popover = PinnablePopover()
        popover?.behavior = .applicationDefined
    }
    
    @objc fileprivate func showStationaryVC(sender: NSStatusBarButton) {
        guard let popover = popover else {return}
        
        if (popoverVC == nil) {

            guard let vc = NSStoryboard(name: "Main", bundle: nil).instantiateController( withIdentifier: .init(stringLiteral: "popoverVC")) as? ViewController else {return}
            popoverVC = vc
        }
        
        popover.contentViewController = popoverVC
        popover.show(relativeTo: .zero, of: sender, preferredEdge: .minY)
    }

}

