//
//  DemoImageView.swift
//  DemoDragDropImage
//
//  Created by ERIC DEJONCKHEERE on 31/05/2015.
//  Copyright (c) 2015 Eric Dejonckheere. All rights reserved.
//

import Cocoa

class DemoImageView: NSImageView {
    
    @IBOutlet var textView: NSTextView!
    @IBOutlet var placeholderMessage: NSTextField!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        registerForDraggedTypes([NSFilenamesPboardType])
    }
    
    override func viewDidMoveToWindow() {
        let trackingOptions: NSTrackingAreaOptions = [.ActiveInActiveApp, .MouseEnteredAndExited, .MouseMoved]
        let trackingArea = NSTrackingArea(rect: self.bounds, options: trackingOptions, owner: self, userInfo: nil)
        addTrackingArea(trackingArea)
        toolTip = "Déposez une image ici"
    }
    
    override func mouseEntered(theEvent: NSEvent) {
        appendToTextStorage(theEvent.description)
    }
    
    override func mouseExited(theEvent: NSEvent) {
        appendToTextStorage(theEvent.description)
    }
    
    override func draggingEntered(sender: NSDraggingInfo) -> NSDragOperation {
        appendToTextStorage(sender.description)
        return .Copy
    }
    
    override func performDragOperation(sender: NSDraggingInfo) -> Bool {
        if let path = getFilePathFromPasteBoard(sender) {
            if let img = NSImage(contentsOfFile: path) {
                self.image = img
                appendToTextStorage("Success: image grabbed from pasteboard", messageType: .Success)
                placeholderMessage.hidden = true
                return true
            }
            appendToTextStorage("Error: can't make an image from '\(path)'", messageType: .Error)
            return false
        }
        appendToTextStorage("Error: no files in the pasteboard", messageType: .Error)
        return false
    }
    
    private func getFilePathFromPasteBoard(sender: NSDraggingInfo) -> String? {
        if let pasteBoard = sender.draggingPasteboard().propertyListForType("NSFilenamesPboardType") as? [AnyObject],
            path = pasteBoard[0] as? String {
                appendToTextStorage("Pasteboard contents:\n\n \(pasteBoard)", messageType: .Info)
                return path
        }
        return nil
    }
    
    private func appendToTextStorage(text: String, messageType: MessageType = .Standard) {
        let attributed = TextManager.makeAttributedText("\(text)\n\n", messageType: messageType)
        let didAppendText = TextManager.appendAttributedStringToTextView(attributed, textView: textView)
        if !didAppendText { NSLog("%@", "Error with the textView") }
    }
    
}
