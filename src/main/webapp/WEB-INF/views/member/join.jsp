<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행의 즐거움 :: 떠나!</title>
<link rel="stylesheet" type="text/css"
	href="../resources/css/common.css">
<script src="../resources/js/jquery-3.5.1.min.js"></script>
<script src="../resources/js/jquery-user.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<!-- style -->
<style>
.table input:focus {
	border: 2px solid #c2dae8;
	border-color: #c2dae8;
}
</style>

<body>
	<div class="regist_container">
		<div class="wrapper">
			<div class="regist_content">
				<form action="/member/join" onsubmit="return checkRegist()"
					method="post" name="regist_frm">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}">
					<table class="table regist-table" border="1px solid lightgary">
						<caption class="regist-title">
							<h2>회원가입</h2>
						</caption>
						<tbody>
							<tr>
								<th>이름<span class="icon">*</span></th>
								<td><input type="text" id="username" name="username"
									maxlength="16" placeholder="이름을 입력하세요." autofocus></td>
							</tr>
							<tr>
								<th>아이디<span class="icon">*</span></th>
								<td><input type="text" id="userid" name="userid"
									maxlength="16" placeholder="아이디를 입력하세요.">
									<h4 class="regist-info">4~12자의 영문 대소문자와 숫자로 입력하여 주세요.</h4></td>
							</tr>
							<tr>
								<th>비밀번호<span class="icon">*</span></th>
								<td><input type="password" id="pw" name="pw" maxlength="16"
									placeholder="비밀번호를 입력하세요.">
									<h4 class="regist-info">4~12자의 영문 대소문자와 숫자로 입력하여 주세요.</h4></td>
							</tr>
							<tr>
								<th>비밀번호확인<span class="icon">*</span></th>
								<td><input type="password" name="mem_conpw" id="mem_conpw"
									value="" maxlength="16" placeholder="비밀번호를 다시 입력하세요."
									class="form-box"></td>
							</tr>
							<tr>
								<th>닉네임<span class="icon">*</span></th>
								<td><input type="text" id="nickname" name="nickname"
									maxlength="16" placeholder="닉네임을 입력하세요.">
									<h4 class="regist-info">2자 이상 16자 이하, 영어 또는 숫자 또는 한글로
										구성해주세요.</h4></td>
							</tr>
							<tr>
								<th style="vertical-align: middle;">이메일<span class="icon">*</span></th>
								<td><input type="text" name="email" id="email"
									maxlength="30" placeholder="이메일을 입력하세요."> @ <input
									id="domain-txt" name="domain-txt" type="text" /> <select
									id="domain-list" name="domain-list">
										<option value="1" selected>직접 입력</option>
										<option value="naver.com">naver.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
										<option value="kakao.com">kakao.com</option>
								</select></td>
							</tr>
							<tr>
								<th style="vertical-align: middle;">주소<span class="icon">*</span></th>
								<td><input type="text" id="postCode" name="postCode"
									maxlength="5" size="5" readonly style="width: 100px;">
									<!-- 우편번호 --> <input type="text" id="addr" name="addr"
									maxlength="20" readonly> <!-- 주소 --> <input
									type="button" class="btn btn_type1"
									onclick="sample6_execDaumPostcode()" value="우편번호찾기"> <!-- 주소 찾기 버튼--></td>
							</tr>
							<tr>
								<th>상세주소</th>
								<td><input type="text" name="detAddr" id="detAddr"
									maxlength="20" placeholder="상세 주소를 입력해주세요."></td>
							</tr>
							<tr>
								<th style="vertical-align: middle;">생년월일<span class="icon">*</th>
								<td><input type="text" name="birth_date" id="birth_date"
									maxlength="10" placeholder="YYYY-MM-DD"
									onkeyup="birth_keyup(this)"> <!--  <div class="info" id="info__birth">
                          <select class="box" id="birth-year">
                            <option disabled selected>출생 연도</option>
                          </select>
                          <select class="box" id="birth-month">
                            <option disabled selected>월</option>
                          </select>
                          <select class="box" id="birth-day">
                            <option disabled selected>일</option>
                          </select>
                        </div>
                        --></td>
							</tr>
							<tr>
								<th>전화번호<span class="icon">*</span></th>
								<td><input type="text" name="phone" id="phone"
									maxlength="13" placeholder="010-0000-0000"
									onkeyup="mobile_keyup(this)"></td>
							</tr>
							<tr>
								<th>성별<span class="icon">*</span></th>
								<!-- checked로 페이지 시작시 라디오 버튼 남자 누른거로 고정 -->
								<td>
								<input type="radio" name="gender" id="gender" value="남자" checked="checked"> 남자 
								<input type="radio" name="gender" id="gender" value="여자" style="margin-left: 10px"> 여자</td>
								<!-- <input type='radio' <?=gender == 'female'? 'checked': ''> 서버에서 받아온 값으로 이런식으로 불켜주기 -->
							</tr>
						</tbody>
					</table>
					<div class="btn_form">
						<input class="btn btn_type3" type="submit" value="회원가입">
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<!-- /.container-fluid -->





	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

	<%@ include file="/WEB-INF/views/includes/sidebar.jsp"%>




	<div id="top_btn">
		<a href="" onclick="goTop()"><img
			src="/resources/images/up-arrow.png"></a>
	</div>

</body>
<!-- User Script -->


<script>
	// 주소 
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					// document.getElementById("sample6_extraAddress").value = extraAddr;

				} else {
					// document.getElementById("sample6_extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postCode').value = data.zonecode;
				document.getElementById("addr").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detAddr").focus();
			}
		}).open();
	}
</script>




<script>
	// 이메일 입력방식 선택

	$('#domain-list').change(function() {
		$("#domain-list option:selected").each(function() {

			if ($(this).val() == '1') { // 직접입력일 경우
				$("#domain-txt").val(''); // 값 초기화
				$("#domain-txt").attr("disabled", false); // 활성화
			} else { // 직접입력이 아닐경우
				$("#domain-txt").val($(this).text()); // 선택값 입력
				$("#domain-txt").attr("disabled", true); // 비활성화
			}
		});
	});
	/*
	 // 도메인 직접 입력 or domain option 선택
	 const domainListEl = document.querySelector('#domain-list')
	 const domainInputEl = document.querySelector('#domain-txt')
	 // select 옵션 변경 시
	 domainListEl.addEventListener('change', (event) => {
	 // option에 있는 도메인 선택 시
	 if(event.target.value !== "type") {
	 // 선택한 도메인을 input에 입력하고 disabled
	 domainInputEl.value = event.target.value
	 domainInputEl.disabled = true
	 } else { // 직접 입력 시
	 // input 내용 초기화 & 입력 가능하도록 변경
	 domainInputEl.value = ""
	 domainInputEl.disabled = false
	 }
	 })
	 */
/*
	// '출생 연도' 셀렉트 박스 option 목록 동적 생성
	const birthYearEl = document.querySelector('#birth-year')
	// option 목록 생성 여부 확인
	isYearOptionExisted = false;
	birthYearEl.addEventListener('focus', function() {
		// year 목록 생성되지 않았을 때 (최초 클릭 시)
		if (!isYearOptionExisted) {
			isYearOptionExisted = true
			for (var i = 1940; i <= 2022; i++) {
				// option element 생성
				const YearOption = document.createElement('option')
				YearOption.setAttribute('value', i)
				YearOption.innerText = i
				// birthYearEl의 자식 요소로 추가
				this.appendChild(YearOption);
			}
		}
	});
	const birthYearE2 = document.querySelector('#birth-month')
	// option 목록 생성 여부 확인
	isYearOptionExisted2 = false;
	birthYearE2.addEventListener('focus', function() {
		// year 목록 생성되지 않았을 때 (최초 클릭 시)
		if (!isYearOptionExisted2) {
			isYearOptionExisted2 = true
			for (var i = 1; i <= 12; i++) {
				// option element 생성
				const monthOption = document.createElement('option')
				monthOption.setAttribute('value', i)
				monthOption.innerText = i
				// birthYearE2의 자식 요소로 추가
				this.appendChild(monthOption);
			}
		}
	});
	const birthYearE3 = document.querySelector('#birth-day')
	// option 목록 생성 여부 확인
	isYearOptionExisted3 = false;
	birthYearE3.addEventListener('focus', function() {
		// year 목록 생성되지 않았을 때 (최초 클릭 시)
		if (!isYearOptionExisted3) {
			isYearOptionExisted3 = true
			for (var i = 1; i <= 31; i++) {
				// option element 생성
				const dayOption = document.createElement('option')
				dayOption.setAttribute('value', i)
				dayOption.innerText = i
				// birthYearE2의 자식 요소로 추가
				this.appendChild(dayOption);
			}
		}
	});
*/
	//  생년월일 - 하이픈 자동 생성
	function birth_keyup(obj) {
		let birth_len = obj.value.length;
		if (event.keyCode == 8) {
			obj.value = obj.value.slice(0, birth_len)
			return 0;
		} else if (birth_len == 4 || birth_len == 7) {
			obj.value += '-';
		}
	}
	//  전화번호  - 하이픈 자동 생성 
	function mobile_keyup(obj) {
		let mobile_len = obj.value.length;
		console.log(mobile_len)
		if (event.keyCode == 8) {
			obj.value = obj.value.slice(0, mobile_len);
			return 0;
		} else if (mobile_len == 3 || mobile_len == 8) {
			obj.value += '-';
		}
	}

	function checkRegist() {

		//이메일 유효성검사 관련 변수
		var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var mem_email = $("#email").val();
		var mem_domain = $("#domain-txt").val();
		var mail = "";

		mail = mem_email + "@" + mem_domain;
		document.getElementById("email").value = mail;
		
		//전화번호 유효성검사 관련 변수
		var phone_rule = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
		var mem_phone = $("#phone").val();

		//이름 유효성검사 정규식
		var name_RegExp = /[가-힣]{2,15}$/;

		//id pw 유효성 검사 정규식
		var idpw_RegExp = /^[a-zA-z0-9]{4,12}$/;

		//닉네임 유효성 검사 정규식
		var nickname_RegExp = /^(?=.*[a-zA-Z0-9가-힣])[a-zA-Z0-9가-힣]{2,16}$/;

		// 이름 유효성검사 
		if ($("#username").val() == null || $("#username").val() == "") {
			alert("이름란이 비었습니다. 다시 입력하세요.");
			$("#username").focus();
			return false;
		} else if (!name_RegExp.test($("#username").val())) {
			alert("이름은 한글 2글자 이상으로 입력하세요.");
			$("#username").focus();
			return false;
		}

		//아이디 유효성검사    
		if (($("#userid").val() == null || $("#userid").val() == "")) {
			alert("아이디란이 비었습니다. 다시 입력하세요.")
			$("#userid").focus();
			return false;
		} else if (!idpw_RegExp.test($("#userid").val())) {
			alert("id는 4~12자의 영문 대소문자와 숫자의 조합으로 입력하여 주세요.");
			$("#userid").focus();
			return false;
		}

		//패스워드 유효성검사 
		if ($("#pw").val() == null || $("#pw").val() == "") {
			alert("패스워드가 비었습니다. 다시 입력하세요.");
			$("#pw").focus();
			return false;
		} else if (!idpw_RegExp.test($("#pw").val())) {
			alert("패스워드는 4~12자의 영문 대소문자와 숫자의 조합으로 입력하여 주세요.");
			$("#pw").focus();
			return false;
		} else if ($("#mem_conpw").val() == null || $("#mem_conpw").val() == "") {
			alert("패스워드 확인창이 비었습니다. 다시 입력하세요.");
			$("#mem_conpw").focus();
			return false;
		} else if ($("#pw").val() != $("#mem_conpw").val()) {
			alert("비밀번호와 비밀번호 확인란이 상이합니다.");
			$("#conpw").val("");
			$("#conpw").focus();
			return false;
		} else if ($("#userid").val() == $("#pw").val()) {
			alert("아이디와 비밀번호는 같을 수 없습니다. 다시 입력해주세요.");
			$("#pw").val("");
			$("#mem_conpw").val("");
			$("#pw").focus();
			return false;
		}

		//닉네임 유효성 검사
		if ($("#nickname").val() == null || $("#nickname").val() == "") {
			alert("닉네임이 비었습니다. 다시 입력하세요.");
			$("#nickname").focus();
			return false;
		} else if (!nickname_RegExp.test($("#nickname").val())) {
			alert("닉네임은 2자 이상 16자 이하, 영어 또는 숫자 또는 한글로 입력하세요");
			$("#nickname").focus();
			return false;
		}

		if ($("#email").val() == null || $("#email").val() == "") {
			alert("이메일란이 비었습니다. 다시 입력하세요.");
			$("#email").focus();
			return false;
		} else if ($("#domain-txt").val() == null
				|| $("#domain-txt").val() == "") {
			alert("도메인란이 비었습니다. 다시 입력하세요.");
			$("#domain-txt").focus();
			return false;
		} else if ($("#postCode").val() == null || $("postCode").val() == "") {
			alert("우편번호란이 비었습니다. 다시 입력하세요.");
			$("#postCode").focus();
			return false;
		} else if ($("#addr").val() == null || $("#addr").val() == "") {
			alert("주소란이 비었습니다. 다시 입력하세요.");
			$("#addr").focus();
			return false;
		} else if ($("#birth_date").val() == null
				|| $("#birth_date").val() == "") {
			alert("생년월일란이 비었습니다. 다시 입력하세요.");
			$("#birth_date").focus();
			return false;
		} else if ($("#phone").val() == null || $("#phone").val() == "") {
			alert("전화번호란이 비었습니다. 다시 입력하세요.");
			$("#phone").focus();
			return false; 
		} else if ($(':radio[name="gender"]:checked').length < 1) {
			alert("성별이 선택되지 않았습니다. 성별을 선택하세요.");
			$("#gender").focus();
			return false;
		}

		// 이메일 확인
		if (!email_rule.test(mail)) {
			alert("이메일을 형식에 맞게 입력해주세요.");
			$("#email").focus();
			return false;
		}
		// 전화번호
		if (!phone_rule.test(mem_phone)) {
			alert("전화번호를 형식에 맞게 입력해주세요.");
			$("#phone").focus();
			return false;
		}

		/*console.log(mail);*/
		alert("회원가입 되었습니다.");
		return true;
	}
</script>
</html>