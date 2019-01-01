//
//  NetworkDetailItems.swift
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
import StanwoodCore

class NetworkDetailISections: Stanwood.Sections {}

class NetworkLatencySection: Stanwood.Elements<NetworkItem>, Headerable {
    
    var headerView: UIView {
        let view = NetworkHeaderView.loadFromNib(bundle: Bundle.debuggerBundle())
        view?.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        view?.set(title: "LATENCY")
        return view ?? UIView()
    }
    
    override func cellType(forItemAt indexPath: IndexPath) -> Fillable.Type? {
        return NetworkLatencyCell.self
    }
}

class NetworkErrorSection: Stanwood.Elements<NetworkItem>, Headerable {
    
    var headerView: UIView {
        let view = NetworkHeaderView.loadFromNib(bundle: Bundle.debuggerBundle())
        view?.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        view?.set(title: "ERROR")
        return view ?? UIView()
    }
    
    
    override func cellType(forItemAt indexPath: IndexPath) -> Fillable.Type? {
        return NetworkErrorCell.self
    }
}

class NetworkOverviewSection: Stanwood.Elements<NetworkItem>, Headerable {
    
    var headerView: UIView {
        let view = NetworkHeaderView.loadFromNib(bundle: Bundle.debuggerBundle())
        view?.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        view?.set(title: "CALL OVERVIEW")
        return view ?? UIView()
    }
    
    override func cellType(forItemAt indexPath: IndexPath) -> Fillable.Type? {
        return NetworkOverviewCell.self
    }
}

class NetworkResponseSection: Stanwood.Elements<NetworkItem>, Headerable {
    
    var headerView: UIView {
        let view = NetworkHeaderView.loadFromNib(bundle: Bundle.debuggerBundle())
        view?.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        view?.set(title: "RESPONSE")
        return view ?? UIView()
    }
    
    override func cellType(forItemAt indexPath: IndexPath) -> Fillable.Type? {
        return NetworkResponseCell.self
    }
}

class NetworkHeadersSection: Stanwood.Elements<NetworkItem>, Headerable {
    
    var headerView: UIView {
        let view = NetworkHeaderView.loadFromNib(bundle: Bundle.debuggerBundle())
        view?.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        view?.set(title: "HEADERS")
        return view ?? UIView()
    }
    
    override func cellType(forItemAt indexPath: IndexPath) -> Fillable.Type? {
        return NetworkHeadersCell.self
    }
}

class NetworkDataSection: Stanwood.Elements<NetworkItem>, Headerable {
    
    var headerView: UIView {
        let view = NetworkHeaderView.loadFromNib(bundle: Bundle.debuggerBundle())
        view?.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        view?.set(title: "DATA RESPONSE")
        return view ?? UIView()
    }
    
    override func cellType(forItemAt indexPath: IndexPath) -> Fillable.Type? {
        return NetworkDataResponseCell.self
    }
}

class NetworkBodySection: Stanwood.Elements<NetworkItem>, Headerable {
    
    var headerView: UIView {
        let view = NetworkHeaderView.loadFromNib(bundle: Bundle.debuggerBundle())
        view?.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        view?.set(title: "DATA BODY")
        return view ?? UIView()
    }
    
    override func cellType(forItemAt indexPath: IndexPath) -> Fillable.Type? {
        return NetworkDataBodyCell.self
    }
}
