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
func itemLayout() -> UICollectionViewCompositionalLayout{
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    let horizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
    let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, subitem: item, count: 2)

    let verticalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
    let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize, subitem: horizontalGroup, count: 2)

    let section = NSCollectionLayoutSection(group: verticalGroup)
    section.interGroupSpacing = 20

    let layout = UICollectionViewCompositionalLayout(section: section)

    return layout
}
func productLayout() -> UICollectionViewCompositionalLayout{
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 5)
            
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            let layout = UICollectionViewCompositionalLayout(section: section)
            return layout
}
