//
//  BaseViewController.swift
//  DemoTexture
//
//  Created by 3embed on 14/09/24.
//

import AsyncDisplayKit

class BaseViewController: ASDKViewController<BaseNode> {

    override init() {
        super.init(node: BaseNode())
        self.node.backgroundColor = .cyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder:) has not been implemented")
    }


}
