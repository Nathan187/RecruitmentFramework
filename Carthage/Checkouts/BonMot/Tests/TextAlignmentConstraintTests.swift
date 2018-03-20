//
//  TextAlignmentConstraintTests.swift
//  BonMot
//
//  Created by Cameron Pulsford on 10/6/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import Foundation

#if os(OSX)
    import AppKit
#else
    import UIKit
#endif

import XCTest
@testable import BonMot

class TextAlignmentConstraintTests: XCTestCase {

    private func field(withText text: String, fontSize: CGFloat) -> BONTextField {
        let field = BONTextField(frame: .zero)
        field.translatesAutoresizingMaskIntoConstraints = false

        field.font = BONFont(name: "Avenir-Roman", size: fontSize)

        #if os(OSX)
            field.stringValue = text
        #else
            field.text = text
        #endif

        return field
    }

    func testTopConstraint() {
        let left = field(withText: "left", fontSize: 17)
        let right = field(withText: "right", fontSize: 50)

        let constraint = TextAlignmentConstraint.with(
            item: left,
            attribute: .top,
            relatedBy: .equal,
            toItem: right,
            attribute: .top
        )

        XCTAssertEqual(constraint.constant, 0, accuracy: 0.0001)
    }

    func testCapHeightConstraint() {
        let left = field(withText: "left", fontSize: 17)
        let right = field(withText: "right", fontSize: 50)

        let constraint = TextAlignmentConstraint.with(
            item: left,
            attribute: .capHeight,
            relatedBy: .equal,
            toItem: right,
            attribute: .capHeight
        )

        let target: CGFloat = 9.636

        XCTAssertEqual(constraint.constant, target, accuracy: 0.0001)
    }

    func testXHeightConstraint() {
        let left = field(withText: "left", fontSize: 17)
        let right = field(withText: "right", fontSize: 50)

        let constraint = TextAlignmentConstraint.with(
            item: left,
            attribute: .xHeight,
            relatedBy: .equal,
            toItem: right,
            attribute: .xHeight
        )

        let target: CGFloat = 17.556

        XCTAssertEqual(constraint.constant, target, accuracy: 0.0001)
    }

    func testTopToCapHeightConstraint() {
        let left = field(withText: "left", fontSize: 17)
        let right = field(withText: "right", fontSize: 50)

        let constraint = TextAlignmentConstraint.with(
            item: left,
            attribute: .top,
            relatedBy: .equal,
            toItem: right,
            attribute: .capHeight
        )

        let target: CGFloat = 14.6

        XCTAssertEqual(constraint.constant, target, accuracy: 0.0001)
    }

    func testCapHeightToTopConstraint() {
        let left = field(withText: "left", fontSize: 17)
        let right = field(withText: "right", fontSize: 50)

        let constraint = TextAlignmentConstraint.with(
            item: left,
            attribute: .capHeight,
            relatedBy: .equal,
            toItem: right,
            attribute: .top
        )

        let target: CGFloat = -4.964

        XCTAssertEqual(constraint.constant, target, accuracy: 0.0001)
    }

    func testTopToXHeightConstraint() {
        let left = field(withText: "left", fontSize: 17)
        let right = field(withText: "right", fontSize: 50)

        let constraint = TextAlignmentConstraint.with(
            item: left,
            attribute: .top,
            relatedBy: .equal,
            toItem: right,
            attribute: .xHeight
        )

        let target: CGFloat = 26.6

        XCTAssertEqual(constraint.constant, target, accuracy: 0.0001)
    }

    func testXHeightToTopConstraint() {
        let left = field(withText: "left", fontSize: 17)
        let right = field(withText: "right", fontSize: 50)

        let constraint = TextAlignmentConstraint.with(
            item: left,
            attribute: .xHeight,
            relatedBy: .equal,
            toItem: right,
            attribute: .top
        )

        let target: CGFloat = -9.044

        XCTAssertEqual(constraint.constant, target, accuracy: 0.0001)
    }

    func testCapHeightToXHeightConstraint() {
        let left = field(withText: "left", fontSize: 17)
        let right = field(withText: "right", fontSize: 50)

        let constraint = TextAlignmentConstraint.with(
            item: left,
            attribute: .capHeight,
            relatedBy: .equal,
            toItem: right,
            attribute: .xHeight
        )

        let target: CGFloat = 21.636

        XCTAssertEqual(constraint.constant, target, accuracy: 0.0001)
    }

    func testXHeightToCapHeightConstraint() {
        let left = field(withText: "left", fontSize: 17)
        let right = field(withText: "right", fontSize: 50)

        let constraint = TextAlignmentConstraint.with(
            item: left,
            attribute: .xHeight,
            relatedBy: .equal,
            toItem: right,
            attribute: .capHeight
        )

        let target: CGFloat = 5.556

        XCTAssertEqual(constraint.constant, target, accuracy: 0.0001)
    }

}
