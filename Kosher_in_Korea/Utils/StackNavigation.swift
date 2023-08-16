//
//  StackNavigation.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/14.
//

import UIKit

func goHome(controller : UIViewController) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "HomeVC") as? HomeVC else { return }
        controller.navigationController?.pushViewController(vc, animated: true)
    if let tabBarController = controller.tabBarController {
            tabBarController.selectedIndex = 0
        }
    
    
    
}
func goPayment(controller : UIViewController) {
    let storyboard = UIStoryboard(name: "Payment", bundle: nil)
    if let paymentVC = storyboard.instantiateViewController(withIdentifier: "PaymentVC") as? PaymentVC {
        paymentVC.productDelegate = controller as? ProductDelegate
        controller.navigationController?.pushViewController(paymentVC, animated: true)
    } else { }
}


func goReservation(controller : UIViewController) {

    let storyboard = UIStoryboard(name: "Reservation", bundle: nil)
       let nextVC = storyboard.instantiateViewController(withIdentifier: "ReservationVC") as! ReservationVC
       let navController = UINavigationController(rootViewController: nextVC) // 네비게이션 컨트롤러로 감싸기
    navController.modalPresentationStyle = .fullScreen // 전체 화면으로 모달 표시
    controller.present(navController, animated: true, completion: nil)
//    let storyboard = UIStoryboard(name: "Reservation", bundle: nil)
//    let productsVC = storyboard.instantiateViewController(withIdentifier: "ReservationVC") as! ReservationVC
//    controller.navigationController?.pushViewController(productsVC, animated: false)
}

func goAddressSearch (controller : UIViewController)
{
    let storyboard = UIStoryboard(name: "AddressSearch", bundle: nil)
    let nextVC = storyboard.instantiateViewController(withIdentifier: "AddressSearchVC") as! AddressSearchVC
    controller.present(nextVC, animated: true, completion: nil)
}
func goOrder (controller : UIViewController)
{
    let storyboard = UIStoryboard(name: "Order", bundle: nil)
    let nextVC = storyboard.instantiateViewController(withIdentifier: "OrderVC") as! OrderVC
    controller.present(nextVC, animated: true, completion: nil)
}

func goSearch(controller : UIViewController) {

  
    let nextVC = controller.storyboard?.instantiateViewController(withIdentifier: "Search") as! SearchVC
       let navController = UINavigationController(rootViewController: nextVC) // 네비게이션 컨트롤러로 감싸기
       navController.modalPresentationStyle = .fullScreen // 전체 화면으로 모달 표시
    controller.present(navController, animated: true, completion: nil)
}
func goDateSelect (controller : UIViewController)
{
    let storyboard = UIStoryboard(name: "DateSelect", bundle: nil)
    let nextVC = storyboard.instantiateViewController(withIdentifier: "DateSelectVC") as! DateSelectVC
    controller.present(nextVC, animated: true, completion: nil)
}

