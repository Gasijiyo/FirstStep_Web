<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>DD</title>
		<!-- 일정 추가 창 -->
		<!-- Bootstrap CSS 파일 링크 -->
		<meta name="viewport" content="width=device-width, initial-scale=1" />
 		<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<style>
		
		</style>
	</head>
	<body>		
	
	 <!-- insertModal -->
    <div class="modal fade insertModal" id="myModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">일정 등록</h4>
            <button
              type="button"
              class="close"
              onclick="initModal('insertModal', g_arg)"
            >
              &times;
            </button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            <div class="form-group empl_nm">
              <label for="empl_nm">보고자:</label>
              <input
                type="textbox"
                class="form-control"
                placeholder=""
                id="empl_nm"
                readonly="readonly"
              />
            </div>
            <br />
            <div class="form-group">
              <label for="title">일정내용:</label>
              <input
                type="textbox"
                class="form-control"
                placeholder=""
                id="title"
              />
            </div>
            <div class="form-group">
              <label for="start">시작일:</label>
              <select class="form-control" id="start" onchange="startChange()">
                
              </select>
            </div>
            <div class="form-group">
              <label for="end">종료일:</label>
              <select class="form-control" id="end">
                
              </select>
            </div>
            <div class="form-group">
              <label for="allDay">종일여부:</label>
              <div class="form-check">
                <label class="form-check-label">
                  <input
                    type="radio"
                    class="form-check-input"
                    value="true"
                    name="allDay"
                  />예
                </label>
              </div>

              <div class="form-check">
                <label class="form-check-label">
                  <input
                    type="radio"
                    checked="checked"
                    class="form-check-input"
                    value="false"
                    name="allDay"
                  />아니오
                </label>
              </div>
            </div>
          </div>
          <!-- Modal footer -->
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-success approvalBtn"
              onclick="approvalSch('insertModal',g_arg)"
            >
              승인
            </button>
            <button
              type="button"
              class="btn btn-danger rejectBtn"
              onclick="rejectSch('insertModal', g_arg)"
            >
              반려
            </button>

            <button
              type="button"
              class="btn btn-dark float-right deleteBtn"
              onclick="deleteSch('insertModal', g_arg)"
            >
              삭제
            </button>
            <button
              type="button"
              class="btn btn-warning float-right insertBtn"
              onclick="insertSch('insertModal', g_arg)"
            >
              등록
            </button>
          </div>
        </div>
      </div>
    </div>
	
	 
		
		
		<!-- Bootstrap JavaScript 파일 링크 -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<%--<script>
      
		
		
		 $(function(){
         $('#datepicker').datepicker({
        	  dateFormat: 'yy-mm-dd' //달력 날짜 형태
                  ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                  ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
                  ,changeYear: true //option값 년 선택 가능
                  ,changeMonth: true //option값  월 선택 가능                
                  ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                  ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                  ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
                  ,buttonText: "선택" //버튼 호버 텍스트              
                  ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
                  ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
                  ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
                  ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
                  ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
                  ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                  ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
        	 
         });
       //초기값을 오늘 날짜로 설정해줘야 합니다.
         $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
    	});     
    
	</script>--%>
		
	</body>
</html>