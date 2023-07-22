//
//  HomeData.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/21.
//

import UIKit
func layout() -> UICollectionViewCompositionalLayout{
    
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1) , heightDimension: .fractionalHeight(1))
    
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.8))
    
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    
    let section = NSCollectionLayoutSection(group:group)
    section.orthogonalScrollingBehavior = .groupPagingCentered // 너비에 구애받지 않게 연속적으로 나타나게끔
    section.interGroupSpacing = 20
    
    
    let layout = UICollectionViewCompositionalLayout(section: section)
    
    return layout
    
}
