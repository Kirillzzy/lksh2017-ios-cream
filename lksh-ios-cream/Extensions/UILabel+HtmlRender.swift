//
//  UILabel+HtmlRender.swift
//  lksh-ios-cream
//
//  Created by Kirill Averyanov on 07/08/2017.
//  Copyright © 2017 Kirill Averyanov. All rights reserved.
//

import UIKit.UILabel

extension UILabel {
  func setHTMLFromString(htmlText: String) {
    guard let font = self.font else { return }
    //swiftlint:disable:next line_length
    let modifiedFont = NSString(format:"<span style=\"font-family: \(font.fontName); font-size: \(font.pointSize)\">%@</span>" as NSString, htmlText) as String

    if let data = modifiedFont.data(using: .unicode, allowLossyConversion: true),
      let attrStr = try? NSAttributedString(
        data: data,
        options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
                  NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue],
        documentAttributes: nil
      ) {
      self.attributedText = attrStr
      self.numberOfLines = htmlText.components(separatedBy: "\n").count
    }
  }
}
