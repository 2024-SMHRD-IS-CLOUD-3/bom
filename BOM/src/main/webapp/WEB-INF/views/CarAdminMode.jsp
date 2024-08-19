<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>매입 완료된 유모차 판매글 작성페이지</title>
<link rel="stylesheet" href="writing.css">
</head>
<body>
	<header class="u-clearfix u-gradient u-header u-header" id="sec-b9bc"
		data-animation-name="" data-animation-duration="0"
		data-animation-delay="0" data-animation-direction="">
		<div class="u-clearfix u-sheet u-sheet-1">
			<p class="u-align-center u-text u-text-body-alt-color u-text-1">
				<a
					class="u-active-none u-border-none u-btn u-button-link u-button-style u-custom-font u-hover-none u-none u-text-body-alt-color u-btn-1"
					href="./">BOM </a>
			</p>
			<nav class="u-menu u-menu-one-level u-offcanvas u-menu-1">
				<div class="menu-collapse u-custom-font"
					style="font-size: 1rem; letter-spacing: 0px; font-family: PretendardVariable; font-weight: 700;">
					<a
						class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-text-active-color u-custom-text-color u-custom-text-hover-color u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
						href="#"> <svg class="u-svg-link" viewBox="0 0 24 24">
							<use xlink:href="#menu-hamburger"></use></svg> <svg
							class="u-svg-content" version="1.1" id="menu-hamburger"
							viewBox="0 0 16 16" x="0px" y="0px"
							xmlns:xlink="http://www.w3.org/1999/xlink"
							xmlns="http://www.w3.org/2000/svg">
							<g>
							<rect y="1" width="16" height="2"></rect>
							<rect y="7" width="16" height="2"></rect>
							<rect y="13" width="16" height="2"></rect>
</g></svg>
					</a>
				</div>
				<div class="u-custom-menu u-nav-container">
					<ul class="u-custom-font u-nav u-unstyled u-nav-1">
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="./" style="padding: 10px 20px;">Home</a></li>


						<li class="u-nav-item">
							<div class="dropdown">
								<a
									class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
									href="b_board" style="padding: 10px 20px;">Market</a>
								<div class="dropdown-content">
									<a href="boyC">남아의류</a> <a href="girlC">여아의류</a> <a href="toy">장난감류</a>
									<a href="book">도서교구</a> <a href="furniture">아이가구</a> <a
										href="newBorn">육아출산</a> <a href="babyCar">유모차</a>
								</div>
							</div>
						</li>
						<li class="u-nav-item">
							<div class="dropdown">
								<a id="car"
									class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
									href="car" style="padding: 10px 20px;">Stroller</a>
								<div class="dropdown-content">
									<a href="car">유모차 매입 신청</a> <a href="goCar">유모차 구매</a>

								</div>
							</div>

						</li>
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="goComm" style="padding: 10px 20px;">Board</a></li>
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="goMyList" style="padding: 10px 20px;">MyPage</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</header>

	<main>
		<div style="text-align: left; margin-top: 20px;">
			<button onclick="goBack()" class="back-btn">← 돌아가기</button>
		</div>

		<div class="upload-container">
			<div class="image-preview">
				<img
					src="${empty file ? 'uploads/KakaoTalk_20240817_110031317.png' : file }"
					id="preview" alt="Image Preview">

			</div>
			<div class="form-container">

				<form id="upload-form" action="adminWrite?idx=${deal.car_idx}"
					method="post" enctype="multipart/form-data">
					<label for="title">제목</label> <input type="text" id="title"
						name="car_title"
						value="${empty deal.car_title ? '제목을 입력하세요. ': deal.car_title}">
					<label for="car_rank">rank</label> <select id="category"
						name="car_rank">

						<option value="S">S급</option>
						<option value="A">A급</option>
						<option value="B">B급</option>

					</select> <label for="car_cours">cours</label> <select name="car_cours">
						<option value="신청" ${deal.car_cours == '신청' ? 'selected' : ''}>신청</option>
						<option value="접수" ${deal.car_cours == '접수' ? 'selected' : ''}>접수</option>
						<option value="심사" ${deal.car_cours == '심사' ? 'selected' : ''}>심사</option>
						<option value="매입" ${deal.car_cours == '매입' ? 'selected' : ''}>매입</option>
						<option value="거절" ${deal.car_cours == '거절' ? 'selected' : ''}>거절</option>
						<option value="완료" ${deal.car_cours == '완료' ? 'selected' : ''}>완료</option>
					</select> <label for="price">가격</label> <input type="text" id="car_price"
						name="car_price"
						value="${empty deal.car_price ? '가격을 입력하세요.' : deal.car_price}">

					<label for="description">내용</label>
					<textarea id="description" name="car_content" rows="5" >원글자가 남긴 내용입니다.   >>
					${empty deal.car_content ? '내용을 입력하세요.' : deal.car_content}
					</textarea>


					<!-- 파일 업로드 -->
					<div class="file-upload">
						<input type="file" id="imageUpload" name="file"
							style="display: none;" onchange="handleFileChange(event)">
						<label for="imageUpload" class="file-select-btnx">파일선택</label>

						<!-- 파일 이름 표시 -->
						<div class="file-name-display">
							<c:if test="${not empty deal.car_file}">
            ${deal.car_file} <!-- 첫 번째 파일 이름을 표시 -->
							</c:if>
							<c:if test="${empty deal.car_file}">
            파일이 선택되지 않았습니다.
        </c:if>
						</div>
					</div>

					<!-- 파일 삭제 버튼 -->
					<button type="button" onclick="removeFile()">이미지 삭제</button>
					<br>

					<!-- 제출 버튼 -->
					<button type="submit" class="submit-btn">완료</button>
				</form>

			</div>
			<br>



		</div>

	</main>

	<script>

	   let selectedFile = null; // 선택된 파일을 저장할 변수

	    function handleFileChange(event) {
	        const imagePreview = document.getElementById('preview');
	        const fileInput = document.getElementById('imageUpload');
	        const fileNameDisplay = document.querySelector('.file-name-display'); // 파일 이름을 표시할 요소
	        const files = event.target.files;

	        if (files.length > 0) {
	            const file = files[0]; // 하나의 파일만 허용
	            selectedFile = file; // 선택된 파일 저장

	            // 파일 이름 표시
	            if (fileNameDisplay) {
	                fileNameDisplay.textContent = file.name;
	            }

	            const reader = new FileReader();
	            reader.onload = function(e) {
	                imagePreview.src = e.target.result; // 미리보기 이미지 업데이트
	                imagePreview.alt = file.name; // alt 속성에 파일 이름 할당
	            };
	            reader.readAsDataURL(file); // 파일 읽기
	        }
	    }

	    function removeFile() {
	        const imagePreview = document.getElementById('preview');
	        const fileInput = document.getElementById('imageUpload');
	        const fileNameDisplay = document.querySelector('.file-name-display'); // 파일 이름을 표시할 요소

	        // 미리보기 이미지와 파일 입력 초기화
	        imagePreview.src = 'uploads/KakaoTalk_20240817_110031317.png'; // 기본 이미지로 변경
	        imagePreview.alt = 'Image Preview';
	        fileInput.value = ''; // 파일 입력 초기화
	        selectedFile = null; // 선택된 파일 초기화

	        // 파일 이름 초기화
	        if (fileNameDisplay) {
	            fileNameDisplay.textContent = '파일이 선택되지 않았습니다.';
	        }
	    }

	    document.getElementById('upload-form').onsubmit = function(e) {
	        // 선택된 파일이 없으면 기본적으로 폼이 제출되지 않도록 할 수도 있습니다.
	        if (!selectedFile) {
	            e.preventDefault();
	            alert('파일을 선택해주세요.');
	        }
	    };
    
</script>

</body>
</html>
