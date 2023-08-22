//
//  SelectionOptionVC.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/08/07.
//

import UIKit

class SelectionOptionVC: UIViewController, UICollectionViewDelegate {
    var currentCategory: Int = 1

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    var buttons : [UIButton] = []
    @IBOutlet weak var pageControl: UIPageControl!
    // MARK: - Properties
    var selectedProduct: Product?
    var list: [ProductInfo] = []
    
    typealias Item = ProductInfo
    var datasource: UICollectionViewDiffableDataSource<Section,Item>!

    enum Section {
        case main
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func pageControlChanged(_ sender: UIPageControl) {
        updateButtonTags()
        fetchDataForCategory(1, (pageControl.currentPage * 5) + 1, 10)
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        let page = sender.tag
        fetchDataForCategory(currentCategory, page, 10)
    }


    func updateButtonTags() {
        for i in 0..<5 {
                buttons[i].tag = (pageControl.currentPage * 5) + i
                buttons[i].setTitle("\(buttons[i].tag + 1)", for: .normal)
            }
    }

    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [button1, button2, button3, button4, button5]
            updateButtonTags()
        setupCollectionView()
        fetchDataForCategory(1,0,10) // Default category
    }
    
    // MARK: - Actions
    @IBAction func optionSegment(_ sender: UISegmentedControl) {
        currentCategory = sender.selectedSegmentIndex + 1
        pageControl.currentPage = 0 // 페이지 컨트롤 초기화
        updateButtonTags()          // 버튼 태그 업데이트
        fetchDataForCategory(currentCategory, 0, 10)  // 첫 페이지 데이터 가져오기
        if sender.selectedSegmentIndex == 1
        {
            pageControl.isHidden = true
        }
        else {
            pageControl.isHidden = false
        }
    }

    
    
    // MARK: - Helpers
    func setupCollectionView() {
        collectionView.delegate = self
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: {collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath)
                    as? ProductCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(item)
            return cell
        })
        collectionView.collectionViewLayout = productLayout()
        collectionView.alwaysBounceVertical = false
    }
    
    func fetchDataForCategory(_ category: Int, _ page: Int, _ size : Int) {
        APIService.fetchProducts(from: category, page: page, size: 10) { [weak self] result in
            switch result {
            case .success(let products):
                self?.list = products
                self?.updateDataSource()
            case .failure(let error):
                print("Error fetching products: \(error)")
            }
        }
    }

    func updateDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        datasource.apply(snapshot, animatingDifferences: true)
    }

    // 필요한 layout 함수 추가 (e.g. itemLayout())
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ingredientId = list[indexPath.item].ingredientId
        let storyboard = UIStoryboard(name: "Payment", bundle: nil) // 스토리보드 이름 확인
            if let paymentVC = storyboard.instantiateViewController(withIdentifier: "PaymentVC") as? PaymentVC {
                paymentVC.ingredientId = self.list[self.collectionView.indexPathsForSelectedItems?.first?.item ?? 0].ingredientId
                self.navigationController?.pushViewController(paymentVC, animated: true)
            }
    }
}

