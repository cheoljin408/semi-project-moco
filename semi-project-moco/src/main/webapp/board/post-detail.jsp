<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div  class="container" style="margin-top: 50px; padding: 0px 100px;">
	<table class="table">
	   <tr>
	      <td>제목:   ${requestScope.pvo.post_title}</td>
	      <td>작성자: ${requestScope.pvo.mvo.nickname}</td>
	      <td>작성일: ${requestScope.pvo.post_regdate}</td>
	      <td>조회수: ${requestScope.pvo.hits}</td>
	   </tr>
	   <tr>
	        <td colspan="4">
	            <label><b>소스코드</b></label> &nbsp;  &nbsp;
	               <pre><textarea id = "editor" name="editor" rows="10">${requestScope.pvo.post_code}</textarea></pre>
	               <script>
	                   var editor = CodeMirror.fromTextArea
	                   (document.getElementById('editor'), {
	                       mode:"clike", 
	                       theme : "duotone-light",
	                       lineNumbers: true,
	                   });
	               </script>
	            <%-- pre : db 에 저장된 글형식 그대로 표현  --%>
	        </td>
	    </tr>
	   <tr>
	      <td colspan="4">
	         <%-- pre : db 에 저장된 글형식 그대로 표현  --%>
	         <pre><font size="4"> ${requestScope.pvo.post_content} </font></pre>
	      </td>
	   </tr>
	   <%-- 글쓴이가 로그인한 회원이면 하단부에 삭제와 수정버튼을 제공한다  --%>
	   <c:if test="${requestScope.pvo.mvo.email == sessionScope.mvo.email}">
	      <tr>
	      <%--  부트스트랩에서 제공하는 중앙정렬 class : text-center   --%>
	         <td colspan="4" class="text-center">
	             <script type="text/javascript">
	                 function deletePost(){
	                     if(confirm("삭제하시겠습니까?")){
	                         document.getElementById("deleteForm").submit();
	                     }
	                 }function updatePost(){
	                     if(confirm("수정하시겠습니까?")){
	                            document.getElementById("updateForm").submit();
	                        }
	                 }
	             </script>
	             <form action="DeletePostController.do" id="deleteForm" method="post">
	                 <input type="hidden" name="postNo" id="no" value="${requestScope.pvo.post_no}">
	             </form>
	             <form action="EditPostPageController.do" id="updateForm" method="post">
	                    <input type="hidden" name="postNo" id="no" value="${requestScope.pvo.post_no}">
	                    <input type="hidden" name="languageCode" id="no" value="${requestScope.pvo.languageCode}">
	                </form>
	            <button type="button" class="btn btn-primary" onclick="deletePost()">삭제</button>
	            <button type="button" class="btn btn-primary" onclick="updatePost()">수정</button>
	         </td>
	      </tr>
	   </c:if>
	</table>
	<c:import url="${requestScope.url2}"></c:import>
</div>