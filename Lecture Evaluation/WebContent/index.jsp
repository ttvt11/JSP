<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter"%>
    <%@ page import="evaluation.EvaluationDTO"%>
	<%@ page import="evaluation.EvaluationDAO"%>
	<%@ page import="user.UserDAO"%>
	<%@ page import="java.net.URLEncoder"%>
	<%@ page import="java.util.ArrayList"%>
	<% request.setCharacterEncoding("UTF-8"); %>
	
<!doctype html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <head>
    <title>講義評価  WEB サイ11ト111a11</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <!-- 커스텀 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/custom.css">
  </head>
  <body>
  
<%
	String lectureDivide = "전체";
	String searchType = "최신순";
	String search = "";
	int pageNumber = 0;
	if(request.getParameter("lectureDivide") != null) {
		lectureDivide = request.getParameter("lectureDivide");
	}
	if(request.getParameter("searchType") != null) {
		searchType = request.getParameter("searchType");
	}
	if(request.getParameter("search") != null) {
		search = request.getParameter("search");
	}
	if(request.getParameter("pageNumber") != null) {
		try {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch (Exception e) {
			System.out.println("검색 페이지 번호 오류");
		}
	}
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}



%>	



  
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="index.jsp">강의평가 WEB サイト</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbar">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="index.jsp">メイン</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown" style=>
              会員管理
            </a>
            <div class="dropdown-menu" aria-labelledby="dropdown">
<%
	if(userID == null) {
%>
              <a class="dropdown-item" href="userLogin.jsp">ロゴイン</a>
              <a class="dropdown-item" href="userJoin.jsp">新規登録</a>
<%
	} else {
%>
              <a class="dropdown-item" href="userLogout.jsp">ログアウト</a>
<%
	}
%>
            </div>
          </li>
        </ul>
        <form action="./index.jsp" method="get" class="form-inline my-2 my-lg-0">
          <input type="text" name="search" class="form-control mr-sm-2" type="search" placeholder="内容を入力してください。" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">検索</button>
        </form>
      </div>
    </nav>
    
    <section class="container">
    	<form action="./index.jsp" method="get" class="form-inline mt-3">
    		<select name="lectureDivide" class="form-control mx-1 mt-2">
    			<option value="전체">全体</option>
    			<option value="전공" <%if(lectureDivide.equals("전공")) out.println("selected");%>>専攻</option>
    			<option value="교양" <%if(lectureDivide.equals("교양")) out.println("selected");%>>教養</option>
    			<option value="기타" <%if(lectureDivide.equals("기타")) out.println("selected");%>>その外</option>
    		</select>
    	        <select name="searchType" class="form-control mx-1 mt-2">
          <option value="최신순">최신순</option>
          <option value="추천순" <%if(searchType.equals("추천순")) out.println("selected");%>>추천순</option>
        </select>
			<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="内容を入力してください。">
			<button type="submit" class="btn btn-primary mx-1 mt-2">検索</button>
    		<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">登録する</a>
    		<a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#reportModal">申告</a>
    	</form>
    	
<%
	ArrayList<EvaluationDTO> evaluationList = new ArrayList<EvaluationDTO>();
	evaluationList = new EvaluationDAO().getList(lectureDivide, searchType, search, pageNumber);
	if(evaluationList != null)
	for(int i = 0; i < evaluationList.size(); i++) {
		if(i == 5) break;
		EvaluationDTO evaluation = evaluationList.get(i);
%>
    	
	<!-- 평가게시판 글작성등록 -->
	<!-- 1번째글 -->
    	<div class="card bg-light mt-3">
        <div class="card-header bg-light">
          <div class="row">
            <div class="col-8 text-left"> <%= evaluation.getLectureName() %> &nbsp; <small> <%= evaluation.getProfessorName() %></small></div>
            <div class="col-4 text-right">
              종합 <span style="color: red;"> <%= evaluation.getTotalScore() %></span>
                      </div>
          </div>
        </div>
        <div class="card-body">
          <h5 class="card-title">
            <%=evaluation.getEvaluationTitle()%>&nbsp;<small>(<%=evaluation.getLectureYear()%>년 <%=evaluation.getSemesterDivide()%>)</small>
          </h5>
          <p class="card-text"><%=evaluation.getEvaluationContent()%></p>
          <div class="row">
            <div class="col-9 text-left">
              성적 <span style="color: red;"><%=evaluation.getCreditScore()%></span>
              널널 <span style="color: red;"><%=evaluation.getComfortableScore()%></span>
              강의 <span style="color: red;"><%=evaluation.getLectureScore()%></span>
              <span style="color: green;">(추천: <%=evaluation.getLikeCount()%>)</span>
            </div>
            <div class="col-3 text-right">
              <a onclick="return confirm('추천하시겠습니까?')" href="./likeAction.jsp?evaluationID=">추천</a>
              <a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?evaluationID=">삭제</a>
            </div>
          </div>
        </div>
      </div>
<%
	}
%>

    </section>
      <ul class="pagination justify-content-center mt-3">
      <li class="page-item">
<%
	if(pageNumber <= 0) {
%>     
        <a class="page-link disabled">이전</a>
<%
	} else {
%>
		<a class="page-link" href="./index.jsp?lectureDivide=<%=URLEncoder.encode(lectureDivide, "UTF-8")%>&searchType=<%=URLEncoder.encode(searchType, "UTF-8")%>&search=<%=URLEncoder.encode(search, "UTF-8")%>&pageNumber=<%=pageNumber - 1%>">이전</a>
<%
	}
%>
      </li>
      <li class="page-item">
<%
	if(evaluationList.size() < 6) {
%>     
        <a class="page-link disabled">다음</a>
<%
	} else {
%>
		<a class="page-link" href="./index.jsp?lectureDivide=<%=URLEncoder.encode(lectureDivide, "UTF-8")%>&searchType=<%=URLEncoder.encode(searchType, "UTF-8")%>&search=<%=URLEncoder.encode(search, "UTF-8")%>&pageNumber=<%=pageNumber + 1%>">다음</a>
<%
	}
%>

		<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">평가등록評価登録</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="./evaluationRegisterAction.jsp" method="post">
							<div class="form-row">
								<div class="form-group col-sm-6">
								<label>講義名</label>
								<input type="text" name="lectureName" class="form-control" maxlength="20">
								</div>
								<div class="form-group col-sm-6">
								<label>教授名</label>
								<input type="text" name="professorName" class="form-control" maxlength="20">
								</div>
							</div>
							
							
							<div class="form-row">
                <div class="form-group col-sm-4">
                  <label>受講年度</label>
                  <select name="lectureYear" class="form-control">
                    <option value="2011">2011</option>
                    <option value="2012">2012</option>
                    <option value="2013">2013</option>
                    <option value="2014">2014</option>
                    <option value="2015">2015</option>
                    <option value="2016">2016</option>
                    <option value="2017">2017</option>
                    <option value="2018">2018</option>
                    <option value="2019" selected>2019</option>
                    <option value="2020">2020</option>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                  </select>
                </div>
                <div class="form-group col-sm-4">
                  <label>受講学期</label>
                  <select name="semesterDivide" class="form-control">
                    <option value="1학기" selected>1学期</option>
                    <option value="여름학기">夏学期</option>
                    <option value="2학기">2学期</option>
                    <option value="겨울학기">冬学期</option>
                  </select>
                </div>
                <div class="form-group col-sm-4">
                  <label>講義区分</label>
                  <select name="lectureDivide" class="form-control">
                    <option value="전공" selected>専攻</option>
                    <option value="교양">教養</option>
                    <option value="기타">その外</option>
                  </select>
                </div>
              </div>
  <div class="form-group">
                <label>タイトル</label>
                <input type="text" name="evaluationTitle" class="form-control" maxlength="20">
              </div>
              <div class="form-group">
                <label>内容</label>
                <textarea name="evaluationContent" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
              </div>
              <div class="form-row">
                <div class="form-group col-sm-3">
                  <label>総合</label>
                  <select name="totalScore" class="form-control">
                    <option value="A" selected>A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                    <option value="F">F</option>
                  </select>
                </div>
                <div class="form-group col-sm-3">
                  <label>成績</label>
                  <select name="creditScore" class="form-control">
                    <option value="A" selected>A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                    <option value="F">F</option>
                  </select>
                </div>
                <div class="form-group col-sm-3">
                  <label>널널</label>
                  <select name="comfortableScore" class="form-control">
                    <option value="A" selected>A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                    <option value="F">F</option>
                  </select>
                </div>
                <div class="form-group col-sm-3">
                  <label>講義</label>
                  <select name="lectureScore" class="form-control">
                    <option value="A" selected>A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                    <option value="F">F</option>
                  </select>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">キャンセル</button>
                <button type="submit" class="btn btn-primary">登録する</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modal">申告する</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form method="post" action="./reportAction.jsp">
              <div class="form-group">
                <label>申告 題目</label>
                <input type="text" name="reportTitle" class="form-control" maxlength="20">
              </div>
              <div class="form-group">
                <label>申告 内容</label>
                <textarea type="text" name="reportContent" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">キャンセル</button>
                <button type="submit" class="btn btn-danger">申告する</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
      Copyright ⓒ 2019 김성태(キムソンテ) All Rights Reserved.
    </footer>
    <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="./js/jquery.min.js"></script>
    <!-- Popper 자바스크립트 추가하기 -->
    <script src="./js/popper.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->
    <script src="./js/bootstrap.min.js"></script>
  </body>
</html>
