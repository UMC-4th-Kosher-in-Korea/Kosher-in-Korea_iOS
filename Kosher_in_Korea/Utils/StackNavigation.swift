//
//  StackNavigation.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/14.
//

import UIKit
func goHome(controller : UIViewController) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let HomeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
    HomeVC.modalPresentationStyle = .fullScreen
    controller.present(HomeVC, animated: true, completion: nil)
}
func goReservation(controller : UIViewController) {

    let storyboard = UIStoryboard(name: "Reservation", bundle: nil)
       let nextVC = storyboard.instantiateViewController(withIdentifier: "ReservationVC") as! ReservationVC
       let navController = UINavigationController(rootViewController: nextVC) // 네비게이션 컨트롤러로 감싸기
       navController.modalPresentationStyle = .fullScreen // 전체 화면으로 모달 표시
    controller.present(navController, animated: true, completion: nil)
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
