<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.HashMap, dto.ProductDTO, dto.MemberDTO, java.util.Map.Entry, java.util.ArrayList"%>
<jsp:useBean class="dto.ProductDTO" id="productDTO"/>
<jsp:useBean class="dao.ProductDAO" id="productDAO"/>
<jsp:setProperty property="*" name="productDTO"/>
<jsp:useBean class="dto.MemberDTO" id="memberDTO"/>
<jsp:useBean class="dao.MemberDAO" id="memberDAO"/>
<jsp:setProperty property="*" name="memberDTO"/>
<%
String action = request.getParameter("action");

//단순 페이지이동
if(action.equals("JOIN")){//회원가입 페이지로 이동
	response.sendRedirect("join.jsp");
}
else if(action.equals("MYPAGE")){//마이페이지
	response.sendRedirect("mypage.jsp");
}
else if(action.equals("LOGIN")){//로그인화면으로 이동
	response.sendRedirect("login.jsp");
}
else if(action.equals("CART")){//장바구니
	response.sendRedirect("cart.jsp");
}

//요청과 함께 페이지 이동
else if(action.equals("MAIN")){//메인
	String searchType = request.getParameter("type");//검색타입
	if(searchType != null){	//검색을 시도했다면
		String searchKeyword = request.getParameter("searchKeyword");//검색어
		if(searchType.equals("상품명")){//상품명 검색
			productDTO.setCondition("SEARCH_NAME");
			productDTO.setName(searchKeyword);
		}
		else if(searchType.equals("판매자")){//판매자 검색
			productDTO.setCondition("SEARCH_SELLER");
			productDTO.setSeller(searchKeyword);
		}
	}
	else {//검색을 시도하지 않았다면
		productDTO.setCondition("ALL");
	}
	request.setAttribute("datas", productDAO.selectAll(productDTO));//컨디션값에 따라 받은 데이터를 요청에 datas로 세팅
	pageContext.forward("main.jsp");//정보를 가지고 이동 = 포워드
}
else if(action.equals("PRODUCT")){//상품상세
	productDTO.setNum(Integer.parseInt(request.getParameter("num")));//url에서 상품 pk 받아오기
	ProductDTO res = productDAO.selectOne(productDTO);//pk해당하는 상품 정보 받아오기
	
	if(res != null && res.getCnt() > 0){ //검증
		//재고가 있다면 
		//요청과 함께, 상세 페이지로
		request.setAttribute("data", res);
		pageContext.forward("productInfo.jsp");
	}
	else{//재고가 없다면 
		//안내 후 이전화면으로
		out.println("<script>alert('접근할 수 없는 페이지 입니다.');history.go(-1);</script>");
	}
	//V에서 다른 화면을 보여주는 방식도 있지만 옛날 방식이다.
}
else if(action.equals("ADMIN")){//관리자 페이지
	String searchType = request.getParameter("type");//검색어
	String role = (String)session.getAttribute("role");//계정권한불러오기

	//검증
	if(!"ADMIN".equals(role)){//admin계정이 아니라면
		//접근차단
		response.sendRedirect("ctrl.jsp?action=MAIN");
	}
	if(searchType != null){	//입력값이 있을떼
		String searchKeyword = request.getParameter("searchKeyword");
		if(searchType.equals("상품명")){ //상품명 검색 선택 시
			productDTO.setCondition("SEARCH_NAME");
			productDTO.setName(searchKeyword);//검색어
		}
		else if(searchType.equals("판매자")){//판매자 검색 선택 시
			productDTO.setCondition("SEARCH_SELLER");
			productDTO.setSeller(searchKeyword);//검색어
		}
	}
	else {//입력값이 없다면
		productDTO.setCondition("ALL");
	}
	request.setAttribute("datas", productDAO.selectAll(productDTO)); //상품정보
	request.setAttribute("userList", memberDAO.selectAll(memberDTO)); //상품추가할 때 판매자 리스트
	pageContext.forward("admin.jsp");//요청 값 가지고 admin으로 이동
}

//기능
else if(action.equals("INSERTPRODUCT")){//상품추가
	if(productDAO.insert(productDTO)){
		//상품 추가 성공
		out.println("<script>alert('상품추가성공!');</script>");
	}
	else{
		//insert실패
		out.println("<script>alert('상품추가 실패. 관리자에게 문의하세요.');</script>");
	}
	//실패하던 성공하던 관리자페이지로 돌아간다.
	out.println("<script>location.href = 'ctrl.jsp?action=ADMIN';</script>");
}
else if(action.equals("DELETEPRODUCT")){//상품삭제
	String[] datas = request.getParameterValues("product");
	boolean flag = false;
	for(String data : datas){
		ProductDTO product = new ProductDTO();
		product.setNum(Integer.parseInt(data));
		flag = productDAO.delete(product);
		if(!flag){//삭제 실패시
			break;//즉시 종료
		}
	}
	if(flag){
		//삭제 성공
		out.println("<script>alert('상품삭제성공!');</script>");
	}
	else{
		//삭제 실패
		out.println("<script>alert('상품삭제 실패. 관리자에게 문의하세요.');</script>");
	}
	//삭제 성공하던,실패하던 관리자 페이지로 돌아간다.
	out.println("<script>location.href = 'ctrl.jsp?action=ADMIN';</script>");
}
else if(action.equals("JOIN_TRY")){//회원가입
	if(memberDAO.selectOne(memberDTO) == null){//아이디가 중복되지 않았을때
		if(memberDAO.insert(memberDTO)){
			//회원가입성공 안내 후 로그인 페이지로 이동한다.
			out.println("<script>alert('회원가입 성공!');location.href = 'ctrl.jsp?action=LOGIN';</script>");
		}
		else{
			//회원가입실패 안내 후 회원가입 페이지로 이동한다.
			out.println("<script>alert('회원가입 불가. 관리자에게 문의하세요.');location.href = 'ctrl.jsp?action=JOIN';</script>");
		}
	}
	else{
		//아이디 중복실패
		out.println("<script>alert('해당 아이디 사용 불가');history.go(-1);</script>");
	}
}
else if(action.equals("LOGOUT")){//로그아웃
	//세션 값 비우기
	session.removeAttribute("user");
	session.removeAttribute("userName");
	session.removeAttribute("role");
	session.removeAttribute("cart");
	//메인화면으로 이동
	response.sendRedirect("ctrl.jsp?action=MAIN");
}
else if(action.equals("LOGIN_TRY")){//로그인
	MemberDTO data = memberDAO.selectOne(memberDTO);
	if(data == null){//일치하는 데이터가 없다면
		//로그인 실패 페이지 띄우고 이전페이지로 돌아가기
		out.println("<script>alert('로그인 실패');history.go(-1);</script>");
	}
	else{
		//로그인 성공시
		//세션에 값 저장
		session.setAttribute("user", data.getMid());
		session.setAttribute("userName", data.getName());
		session.setAttribute("role", data.getRole());
		//메인화면으로 이동
		response.sendRedirect("ctrl.jsp?action=MAIN");
	}
}
else if(action.equals("CHANGENAME")){//이름변경
	memberDTO.setMid((String)session.getAttribute("user"));//PK값
	if(memberDAO.update(memberDTO)){
		session.setAttribute("userName", memberDTO.getName());
		out.println("<script>alert('이름변경 성공!');</script>");
	}
	else{
		out.println("<script>alert('이름변경 실패, 관리자에게 문의하세요.');</script>");
	}
	out.println("<script>location.href = 'ctrl.jsp?action=MYPAGE';</script>");
}
else if(action.equals("DELETED")){//회원탈퇴
	memberDTO.setMid((String)session.getAttribute("user"));//PK값
	if(memberDAO.delete(memberDTO)){
		//삭제 성공
		out.println("<script>alert('회원탈퇴성공!');</script>");
		//세션값을 비우기 위해 로그아웃을 진행한다
		out.println("<script>location.href = 'ctrl.jsp?action=LOGOUT';</script>");
	}
	else{
		//삭제 실패
		out.println("<script>alert('회원탈퇴 실패. 관리자에게 문의하세요.');</script>");
		out.println("<script>location.href = 'ctrl.jsp?action=MAIN';</script>");
	}
}
else if(action.equals("ADDCART")){//장바구니에 물건추가
	String[] datas = request.getParameterValues("product");
	HashMap<ProductDTO, Integer> cart = (HashMap<ProductDTO, Integer>)session.getAttribute("cart");
	
	if(cart == null){ //장바구니라는게 없다면
 		cart = new HashMap<>();//장바구니 생성
 		session.setAttribute("cart", cart);//세션 저장
 	}
	
	if(datas != null){//받아온 정보가 있다면
		for(String num : datas){
			boolean flag = false;
			//장바구니에 있는 상품인지 확인
			for(Entry<ProductDTO, Integer> product : cart.entrySet()){
				if((product.getKey().getNum()+"").equals(num)){
					//이미 있는 상품이라면 카운트 증가
					cart.put(product.getKey(), product.getValue() + 1);
					flag = true;
					break;
				}
			}
			if(!flag){//장바구니에 없는 상품이라면
				//장바구니에 새로 추가
				productDTO.setNum(Integer.parseInt(num));//PK값
				cart.put(productDAO.selectOne(productDTO), 1);//반환된 상품객체에 구매량을 1로 추가
			}
			
		}
	}
	//추가가 끝나면 장바구니로 이동
	response.sendRedirect("ctrl.jsp?action=CART");
}
else if(action.equals("DELETECART")){//장바구니의 물건삭제
	String[] datas = request.getParameterValues("product");
	HashMap<ProductDTO, Integer> cart = (HashMap<ProductDTO, Integer>)session.getAttribute("cart");

	//검증
	if(cart == null){//장바구니가 없다면
		//접근불가 장바구니로 이동
		response.sendRedirect("ctrl.jsp?action=CART");
	}

	if(datas != null){//삭제하고자하는 상품이 존재한다면
		for(String num : datas){
			//장바구니에서 물건 찾기
			for(Entry<ProductDTO, Integer> product : cart.entrySet()){
				if((product.getKey().getNum()+"").equals(num)){
					//얼마큼 담겨있었건 바로 삭제
					cart.remove(product.getKey());
					break;
				}
			}
		}
	}
	//장바구니로 이동
	response.sendRedirect("ctrl.jsp?action=CART");
}
else if(action.equals("BUYCART")){//장바구니의 물건 구매
	HashMap<ProductDTO, Integer> cart = (HashMap<ProductDTO, Integer>)session.getAttribute("cart");//세션에서 장바구니 불러오기
	
	boolean flag = false;
	if(cart != null){//장바구니가 비어있지 않다면
		for(Entry<ProductDTO, Integer> product : cart.entrySet()){//K V 한 세트씩 불러오기
			ProductDTO data = new ProductDTO();
			//상품 PK
			data.setNum(product.getKey().getNum());
			//개수
			data.setCnt(product.getValue());
			//업데이트(구매)
			flag = productDAO.update(data);//업데이트 성공실패
			if(!flag){//실패한다면
				break;//구매 종료
			}
		}
	}
	if(flag){
		//업데이트에 전부 성공했다면
		out.println("<script>alert('구매 성공!');</script>");
		session.removeAttribute("cart");
		response.sendRedirect("ctrl.jsp?action=MAIN");
	}
	else {
		//업데이트 실패
		out.println("<script>alert('구매 실패. 관리자에게 문의하세요');</script>");
		response.sendRedirect("ctrl.jsp?action=CART"); //장바구니 화면으로 다시 보내기
	}
}

%>