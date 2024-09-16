//
//  BaseCellNode.swift
//  DemoTexture
//
//  Created by 3embed on 14/09/24.
//

import AsyncDisplayKit
//Analogous to UITableViewCell or UICollectionViewCell
class BaseCellNode: ASCellNode {
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
}
