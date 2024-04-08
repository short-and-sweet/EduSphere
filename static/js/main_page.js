// JavaScript로 세션 정보를 확인하고 alert를 띄우는 함수
function checkSignupSuccess() {
    // 세션에 signup_success 정보가 있는지 확인
    if (sessionStorage.getItem('signup_success')) {
        // alert를 띄움
        alert("회원가입이 정상적으로 완료되었습니다.");
        // 세션에서 정보를 삭제
        sessionStorage.removeItem('signup_success');
    }
}

// 페이지 로드 시 함수 호출
window.onload = function() {
    checkSignupSuccess();
};