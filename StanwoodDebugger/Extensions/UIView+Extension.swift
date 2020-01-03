//
//  UIView+Extension.swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2018 Stanwood GmbH (www.stanwood.io)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

/// Source: https://github.com/okakaino/InnerShadowTest

extension UIView {
    
    // different inner shadow styles
    enum InnerShadowSide: String {
        case allSides, left, right, top, bottom, topAndLeft, topAndRight, bottomAndLeft, bottomAndRight, exceptLeft, exceptRight, exceptTop, exceptBottom
    }
    
    // define function to add inner shadow
    @discardableResult
    func addInnerShadow(to: InnerShadowSide, color: UIColor = .black, radius: CGFloat = 2, cornerRadius: CGFloat = 0.0, opacity: Float = 0.35) -> CAShapeLayer {
        // define and set a shaow layer

        let layerName = "shadow\(to.rawValue)"
        let shadowLayer = CAShapeLayer()
        shadowLayer.name = layerName
        shadowLayer.frame = bounds
        shadowLayer.shadowColor = color.cgColor
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowRadius = radius
        shadowLayer.fillRule = .evenOdd
        
        // define shadow path
        let shadowPath = CGMutablePath()
        
        // define outer rectangle to restrict drawing area
        let insetRect = bounds.insetBy(dx: -radius * 2.0, dy: -radius * 2.0)
        
        // define inner rectangle for mask
        let innerFrame: CGRect = { () -> CGRect in
            switch to
            {
            case .allSides:
                return CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height)
            case .left:
                return CGRect(x: 0.0, y: -radius * 2.0, width: frame.size.width + radius * 2.0, height: frame.size.height + radius * 4.0)
            case .right:
                return CGRect(x: -radius * 2.0, y: -radius * 2.0, width: frame.size.width + radius * 2.0, height: frame.size.height + radius * 4.0)
            case .top:
                return CGRect(x: -radius * 2.0, y: 0.0, width: frame.size.width + radius * 4.0, height: frame.size.height + radius * 2.0)
            case.bottom:
                return CGRect(x: -radius * 2.0, y: -radius * 2.0, width: frame.size.width + radius * 4.0, height: frame.size.height + radius * 2.0)
            case .topAndLeft:
                return CGRect(x: 0.0, y: 0.0, width: frame.size.width + radius * 2.0, height: frame.size.height + radius * 2.0)
            case .topAndRight:
                return CGRect(x: -radius * 2.0, y: 0.0, width: frame.size.width + radius * 2.0, height: frame.size.height + radius * 2.0)
            case .bottomAndLeft:
                return CGRect(x: 0.0, y: -radius * 2.0, width: frame.size.width + radius * 2.0, height: frame.size.height + radius * 2.0)
            case .bottomAndRight:
                return CGRect(x: -radius * 2.0, y: -radius * 2.0, width: frame.size.width + radius * 2.0, height: frame.size.height + radius * 2.0)
            case .exceptLeft:
                return CGRect(x: -radius * 2.0, y: 0.0, width: frame.size.width + radius * 2.0, height: frame.size.height)
            case .exceptRight:
                return CGRect(x: 0.0, y: 0.0, width: frame.size.width + radius * 2.0, height: frame.size.height)
            case .exceptTop:
                return CGRect(x: 0.0, y: -radius * 2.0, width: frame.size.width, height: frame.size.height + radius * 2.0)
            case .exceptBottom:
                return CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height + radius * 2.0)
            }
        }()
        
        // add outer and inner rectangle to shadow path
        shadowPath.addRect(insetRect)
        shadowPath.addRect(innerFrame)
        
        // set shadow path as show layer's
        shadowLayer.path = shadowPath

        //remove any old shadow layer
        layer.sublayers?.filter { $0.name == layerName }.forEach{ $0.removeFromSuperlayer() }
        // add shadow layer as a sublayer
        layer.addSublayer(shadowLayer)
        
        // hide outside drawing area
        clipsToBounds = true
        
        return shadowLayer
    }
    
    // Shake
    enum SimpleAnimationEdge {
        case none
        case top
        case bottom
        case left
        case right
    }
    
    @discardableResult func shake(toward edge: SimpleAnimationEdge = .none,
                                  amount: CGFloat = 0.15,
                                  duration: TimeInterval = 0.6,
                                  delay: TimeInterval = 0,
                                  completion: ((Bool) -> Void)? = nil) -> UIView {
        let steps = 8
        let timeStep = 1.0 / Double(steps)
        var dx: CGFloat, dy: CGFloat
        if edge == .left || edge == .right {
            dx = (edge == .left ? -1 : 1) * self.bounds.size.width * amount;
            dy = 0
        } else {
            dx = 0
            dy = (edge == .top ? -1 : 1) * self.bounds.size.height * amount;
        }
        UIView.animateKeyframes(
            withDuration: duration, delay: delay, options: .calculationModeCubic, animations: {
                var start = 0.0
                for i in 0..<(steps - 1) {
                    UIView.addKeyframe(withRelativeStartTime: start, relativeDuration: timeStep) {
                        self.transform = CGAffineTransform(translationX: dx, y: dy)
                    }
                    if (edge == .none && i % 2 == 0) {
                        swap(&dx, &dy)  // Change direction
                        dy *= -1
                    }
                    dx *= -0.85
                    dy *= -0.85
                    start += timeStep
                }
                UIView.addKeyframe(withRelativeStartTime: start, relativeDuration: timeStep) {
                    self.transform = .identity
                }
        }, completion: completion)
        return self
    }
}
