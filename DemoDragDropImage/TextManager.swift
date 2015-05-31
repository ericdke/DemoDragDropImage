//
//  TextManager.swift
//  DemoDragDropImage
//
//  Created by ERIC DEJONCKHEERE on 31/05/2015.
//  Copyright (c) 2015 Eric Dejonckheere. All rights reserved.
//

import Cocoa

enum MessageType {
    case Success, Error, Info, Standard
}

class TextManager {
    
    class func makeAttributedText(string: String, size: CGFloat = 14.0, messageType: MessageType) -> NSAttributedString {
        let font: NSFont
        if let helv = NSFont(name: "Helvetica Neue Light", size: size) {
            font = helv
        } else {
            font = NSFont.systemFontOfSize(size)
        }
        var color: NSColor
        switch messageType {
        case .Success:
            color = .greenColor()
        case .Error:
            color = .redColor()
        case .Info:
            color = .blueColor()
        default:
            color = .blackColor()
        }
        let attributes = [NSForegroundColorAttributeName: color, NSFontAttributeName: font]
        return NSAttributedString(string: string, attributes: attributes)
    }
    
    class func appendAttributedStringToTextView(attibutedString: NSAttributedString, textView: NSTextView) -> Bool {
        if let storage = textView.textStorage {
            storage.appendAttributedString(attibutedString)
            textView.scrollRangeToVisible(NSMakeRange(textView.attributedString().length, 0))
            return true
        }
        return false        
    }
    
}