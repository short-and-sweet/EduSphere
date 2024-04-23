function buttonClick(buttonId) {
    var xhr = new XMLHttpRequest();  // XMLHttpRequest 객체 생성
    xhr.open('GET', `/map_template_click/${buttonId}/`, true);  // GET 방식으로 서버로 요청
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {  // 요청 완료 상태 확인
            if (xhr.status === 200) {  // 요청 성공 여부 확인
                // 서버에서 받은 HTML을 .Detail-Content에 적용
                document.querySelector('.Detail-Content').innerHTML = xhr.responseText;
            } else {
                console.error('Error:', xhr.status);
            }
        }
    };
    xhr.send();  // 요청 보내기
}