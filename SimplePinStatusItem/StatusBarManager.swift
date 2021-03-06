//
//  StatusBarManager.swift
//  SimplePinStatusItem
//
//  Created by Keaton Burleson on 3/30/21.
//

import Foundation
import AppKit

class StatusBarManager: NSObject {
    var popover: PinnablePopover?
    var popoverVC: ViewController?
    
    let menuBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menuBarIcon = NSImage(named: "StatusBarIcon")
    
    override init() {
        super.init()
        print("Hello from StatusBarManager")
        
        self.initPopover()
        self.initMenuBarItem()
    }
    
    fileprivate func initMenuBarItem() {
        self.menuBarItem.button?.image = menuBarIcon
        self.menuBarItem.button?.target = self
        self.menuBarItem.button?.action = #selector(showStationaryVC(sender:))
    }
    
    
    fileprivate func initPopover() {
        popover = PinnablePopover(pinned: true)
    }
    
    @objc fileprivate func showStationaryVC(sender: NSStatusBarButton) {
        guard let popover = popover else {return}
        
        // Checks if the popover is already shown and if the popover should close
        // If so, close the popover and return
        if (popover.isShown && popover.shouldClose) {
            popover.close()
            return
        }
 
        if (popoverVC == nil) {
            guard let vc = NSStoryboard(name: "Main", bundle: nil).instantiateController( withIdentifier: .init(stringLiteral: "popoverVC")) as? ViewController else {return}
            popoverVC = vc
            popoverVC?.popover = popover
        }
        
        popover.contentViewController = popoverVC
        popover.show(relativeTo: .zero, of: sender, preferredEdge: .minY)
    }
}
