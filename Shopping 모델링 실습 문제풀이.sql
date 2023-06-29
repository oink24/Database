# 날짜 : 2023/06/29
# 이름 : 강나은
# 내용 : Shopping 모델링 실습 문제풀이


# ------- 문제1
# 모든 장바구니 내역에서 고객명, 상품명, 상품수량을 조회하시오.
# 단, 상품수량 2건 이상만 조회할 것
SELECT b.userName, c.prodName, a.cartProdCount
		FROM `carts` AS a
		JOIN `Users` AS b ON a.userId = b.userId
		JOIN `Products` AS c ON a.prodNo = c.prodNo
		WHERE a.cartProdCount >= 2;


# ------- 문제2
# 모든 상품내역에서 상품번호, 상품카테고리명, 상품명, 상품가격, 판매자 이름, 판매자 연락처를 조회하시오.
## 상품, 카테고리, 판매자
SELECT a.prodNo, b.cateName, a.prodName, a.prodPrice, c.sellerManager, c.sellerPhone
		FROM `Products` AS a
		JOIN `Categories` AS b ON a.cateNo = b.cateNo
		JOIN `Sellers` AS c ON a.sellerNo = c.sellerNo;


# ------- 문제3
# 모든 고객의 아이디, 이름, 휴대폰, 현재포인트, 적립포인트 합을 조회하시오.
# 단, 적립포인트 내역이 없으면 0으로 출력
SELECT a.userId, a.userName, a.userBirth, a.userPoint, if(SUM(b.`point`) IS NULL, 0, SUM(b.`point`)) AS `적립포인트 합`
		FROM `Users` AS a
		LEFT JOIN `Points` AS b ON a.userId = b.userId
		GROUP BY a.userId;


# ------- 문제4
# 모든 주문의 주문번호, 주문자 아이디, 고객명, 상품명, 주문일자를 조회하시오.
# 단, 주문금액이 10만원 이상, 큰 금액순으로 조회, 금액이 같으면 이름이 사전순으로 될 것
## 주문, 고객, 주문제품상세, 상품
SELECT a.orderNo, a.userId, b.userName, d.prodName, a.orderDate
		FROM `Orders` AS a
		JOIN `Users` AS b ON a.userId = b.userId
		JOIN `OrderItems` AS c ON a.orderNo = c.orderNo
		JOIN `Products` AS d ON c.prodNo = d.prodNo
		WHERE c.itemPrice >= 100000
		GROUP BY orderNo
		ORDER BY b.userName, a.orderTotalPrice DESC;	
		

# ------- 문제5
# 모든 주문의 주문번호, 주문자 아이디, 고객명, 상품명, 주문일자를 조회하시오.
# 주문번호는 중복없이 상품명은 구분자 ,로 나열할 것.
SELECT a.orderNo, a.userId, b.userName, GROUP_CONCAT(d.`prodName` SEPARATOR ',') AS `상품명`, a.orderDate
		FROM `Orders` AS a
		JOIN `Users` AS b ON a.userId = b.userId
		JOIN `OrderItems` AS c ON a.orderNo = c.orderNo
		JOIN `Products` AS d ON c.prodNo = d.prodNo
		GROUP BY orderNo;


# ------- 문제6
# 모든 상품의 상품번호, 상품명, 상품가격, 할인율, 할인된 가격을 조회하시오.
SELECT `prodNo`, `prodName`, `prodPrice`, `prodDiscount`, (prodPrice * (1 - prodDiscount/100)) AS `할인된 가격`
		FROM `Products`;


# ------- 문제7
# 고소영이 판매하는 모든 상품의 상품번호, 상품명, 상품가격, 재고수량, 판매자이름을 조회하시오.
SELECT a.prodNo, a.prodName, a.prodPrice, a.prodStock, b.sellerManager
		FROM `Products` AS a
		JOIN `Sellers` AS b ON a.sellerNo = b.sellerNo
		WHERE b.sellerManager = '고소영';


# ------- 문제8
# 아직 상품을 판매하지 않은 판매자의 판매자번호, 판매자상호, 판매자이름, 판매자연락처를 조회하시오.
SELECT c.sellerNo, c.sellerBizName, c.sellerManager, c.sellerPhone
		FROM `Products` AS a
		LEFT JOIN `OrderItems` AS b ON a.prodNo = b.prodNo
		JOIN `Sellers` AS c ON a.sellerNo = c.sellerNo
		WHERE `itemCount` IS NULL;


# ------- 문제9
# 모든 주문상세내역 중 개별 상품 가격과 개수 그리고 할인율이 적용된 최종 총합을 구하고,
# 최종 총합이 10만원 이상 그리고 큰 금액 순으로 `주문번호`, `최종총합`을 조회하시오.
# 최종총합 : (prodPrice * (1 - prodDiscount/100)) * 개수
SELECT `orderNo`, ((itemPrice * (1 - itemDiscount/100)) * `itemCount`) AS `최종총합`
		FROM `OrderItems`
		GROUP BY `orderNo`
		HAVING `최종총합` >= 100000
		ORDER BY `최종총합` DESC;


# ------- 문제10
# 장보고 고객이 주문했던 모든 상품명을 `고객명`, `상품명`으로 조회하시오.
# 단, 상품명은 중복 안되며 상품명은 구분자 ,로 나열
SELECT d.userName, GROUP_CONCAT(a.`prodName` SEPARATOR ',') AS `상품명`
		FROM `Products` AS a
		JOIN `OrderItems` AS b ON a.prodNo = b.prodNo
		JOIN `Orders` AS c ON b.orderNo = c.orderNo
		JOIN `Users` AS d ON c.userId = d.userId
		WHERE d.userName = '장보고';

