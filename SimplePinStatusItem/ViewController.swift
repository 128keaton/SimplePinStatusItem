//
//  ViewController.swift
//  SimplePinStatusItem
//
//  Created by Keaton Burleson on 3/30/21.
//

import Cocoa

class ViewController: NSViewController {

    public var popover: PinnablePopover?
    
    @IBOutlet var statusLabel: NSTextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateStatusLabel()
    }
    
    
    fileprivate func updateStatusLabel() {
        self.statusLabel?.stringValue = "Status: \(self.popover!.shouldClose ? "Unpinned" : "Pinned")"
    }

    
    @IBAction func togglePinnedStatus(sender: NSButton) {
        self.popover?.shouldClose = !self.popover!.shouldClose
        self.updateStatusLabel()
        NSApplication.shared.activate(ignoringOtherApps: true)
    }

}

