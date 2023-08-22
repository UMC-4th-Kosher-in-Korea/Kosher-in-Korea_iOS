import UIKit
protocol MyCartCellDelegate: AnyObject {
    func didTapAddButton(in cell: MyCartCell)
    func didTapSubtractButton(in cell: MyCartCell)
    func didTapDeleteButton(in cell : MyCartCell)
    func didUpdatePrice(in cell: MyCartCell, updatedPrice: Int)
}
class MyCartVC: UIViewController, UICollectionViewDelegate {
    var selectedItemsToDelete: [Int] = []
    @IBAction func moveBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func moveToOrder(_ sender: Any) {
        print("Dd")
     
        let storyboard = UIStoryboard(name: "Payment", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: "OrderSheetVC") as? OrderSheetVC
        else {return}
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    var cartItems: [CartIngredient] = []

    @IBOutlet weak var collectionView: UICollectionView!

    enum Section {
        case main
    }

    @IBOutlet weak var totalPrice: UILabel!
    var datasource: UICollectionViewDiffableDataSource<Section, CartIngredient>!

    func updateDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, CartIngredient>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cartItems, toSection: .main)
        datasource.apply(snapshot, animatingDifferences: true)
    }
    func loadCartData() {
        APIService.fetchUserCart(for: UserDataManager.shared.userID!) { [weak self] result in
            switch result {
            case .success(let cartData):
                self?.cartItems = cartData.cartIngredients
                self?.totalPrice.text = "Total: \(formatPrice(cartData.totalPrice))"
                self?.updateDataSource() // 새로운 데이터로 콜렉션 뷰를 업데이트합니다.
                
                
            case .failure(let error):
                print("Error fetching cart data: \(error.localizedDescription)")
                // 추가적인 오류 처리를 여기에 구현할 수 있습니다. (예: 사용자에게 오류 메시지 표시)
            }
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        deleteSelectedItems()
    }

    override func viewWillAppear(_ animated: Bool) {
        updateDataSource()
        loadCartData()

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()

        datasource = UICollectionViewDiffableDataSource<Section, CartIngredient>(collectionView: collectionView) { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCartCell", for: indexPath) as? MyCartCell else {
                fatalError("Cannot create new cell")
            }
            cell.delegate = self
            cell.configure(item)
            return cell
        }
        collectionView.collectionViewLayout = itemLayout()

       updateDataSource()
        loadCartData()
        //totalPrice.text = " Total : \(cartItems)"
    }
    func itemLayout() -> UICollectionViewCompositionalLayout{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 5)
                
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.3))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                let layout = UICollectionViewCompositionalLayout(section: section)
                return layout
    }
}
extension MyCartVC: MyCartCellDelegate {
    
    func didUpdatePrice(in cell: MyCartCell, updatedPrice: Int) {
        if let indexPath = collectionView.indexPath(for: cell) {
            // 값 업데이트 (주의: 이는 모든 셀에서 호출되므로 최적화가 필요할 수 있습니다.)
            var total = 0
            for visibleCell in collectionView.visibleCells as! [MyCartCell] {
                total += visibleCell.price * visibleCell.numberOfProducts
            }
            //UserDataManager.shared.totalPrice = total
            totalPrice.text = "Total: \(formatPrice(total))"
        }
    }
    
    func didTapAddButton(in cell: MyCartCell) {
        
        if let indexPath = collectionView.indexPath(for: cell), cartItems[indexPath.item].quantity > 0 {
            let cartIngredient = cartItems[indexPath.item]
            let dto = ModifyCartIngredientDto(cartIngredientId: cartIngredient.cartIngredientId)
            APIService.increaseIngredientCount(dto: dto) { [weak self] result in
                switch result {
                case .success(let updatedCartData):
                    DispatchQueue.main.async {
                        
                        self?.cartItems = updatedCartData.cartIngredients
                        self?.updateDataSource()
                        self?.updateTotalPrice()  // 여기에 추가
                    }
                case .failure(let error):
                    print("Error increasing count: \(error)")
                    // Display error message to the user.
                }
            }
        }
    }
    
    
    func didTapDeleteButton(in cell: MyCartCell) {
        if let indexPath = collectionView.indexPath(for: cell) {
            let cartIngredient = cartItems[indexPath.item]
            selectedItemsToDelete.append(cartIngredient.cartIngredientId) // ID 추가
            
            cartItems.remove(at: indexPath.item)
            updateDataSource() // 화면 업데이트
            updateTotalPrice()
        }
    }
    func deleteSelectedItems() {
        for cartIngredientId in selectedItemsToDelete {
            let dto = ModifyCartIngredientDto(cartIngredientId: cartIngredientId)
            
            APIService.deleteIngredientFromCart(dto: dto) { [weak self] result in
                switch result {
                case .success(let updatedCartData):
                    DispatchQueue.main.async {
                        self?.cartItems = updatedCartData.cartIngredients
                        self?.updateDataSource()
                        self?.updateTotalPrice()
                    }
                case .failure(let error):
                    print("Error deleting cart item with ID \(cartIngredientId): \(error)")
                    // Display error message to the user.
                }
            }
        }
        selectedItemsToDelete.removeAll()  // 모든 항목을 삭제한 후 배열 비우기
    }
    
    
    func didTapSubtractButton(in cell: MyCartCell) {
        if let indexPath = collectionView.indexPath(for: cell), cartItems[indexPath.item].quantity > 0 {
            let cartIngredient = cartItems[indexPath.item]
            let dto = ModifyCartIngredientDto(cartIngredientId: cartIngredient.cartIngredientId)
            APIService.decreaseIngredientCount(dto: dto) { [weak self] result in
                switch result {
                case .success(let updatedCartData):
                    self?.cartItems = updatedCartData.cartIngredients
                    self?.updateDataSource()
                    self?.updateTotalPrice()
                case .failure(let error):
                    print("Error decreasing count: \(error)")
                    // Display error message to the user.
                }
            }
        }
    }
    
    
    func updateTotalPrice() {
        
        let total = cartItems.reduce(0) { $0 + ($1.price * $1.quantity) }
        totalPrice.text = "Total: \(formatPrice(total))"
        
            }
    
}
