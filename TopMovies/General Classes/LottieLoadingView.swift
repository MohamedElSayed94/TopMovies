//
//  LottieLoadingView.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 29/12/2020.
//  Copyright © 2020 Mohamed Elsayed. All rights reserved.
//

import Foundation
import Lottie
import UIKit
import SnapKit

class LottieLoadingView:UIView {
    
    private let baseView = UIView()
    private let loadingView = AnimationView.init(name: "Loading")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        
    }
    
    private func setUI() {
        
        self.addSubview(baseView)
        
        baseView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        baseView.addSubview(loadingView)
        baseView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        
        loadingView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(300)
        }
        
        loadingView.loopMode = .loop
        
    }
    
    fileprivate func loadingStatus(_ bool:Bool) {
        
        if bool {
            loadingView.play()
        }else{
            loadingView.stop()
        }
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

struct LoadingIndicator {
    
    private static let loadingView = LottieLoadingView()
    
    static func start(vc:UIViewController, sender:UIButton? = nil) {
        
        vc.view.addSubview(loadingView)
        
        loadingView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        loadingView.loadingStatus(true)
        
        if let _button = sender {
            _button.isUserInteractionEnabled = false
        }
        
    }
    
    static func stop(sender:UIButton? = nil) {
        
        if let _button = sender {
            _button.isUserInteractionEnabled = true
        }
        
        loadingView.loadingStatus(false)
        loadingView.removeFromSuperview()
        
    }
    
}
