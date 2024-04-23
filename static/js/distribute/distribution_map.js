var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 

// Ajax 요청을 보내어 데이터베이스에서 Distribution 데이터 가져오기
$.ajax({
    url: 'http://127.0.0.1:8000/get-distribution-data/',  // 위의 뷰 함수의 URL
    type: 'GET',  // GET 요청
    success: function(data) {
        // Ajax 요청이 성공하면 이 함수가 실행됩니다.
        // data에는 장고 뷰에서 반환한 JSON 데이터가 포함됩니다.
        console.log(data);  // 반환된 JSON 데이터를 콘솔에 출력하여 확인합니다.

        // 반환된 JSON 데이터를 기반으로 마커를 표시할 위치와 내용을 가지고 있는 객체 배열을 생성합니다.
        var positions = [];

        // 데이터를 반복하여 객체 배열에 추가합니다.
        data.forEach(function(item) {
            var position = {
                content: '<div style="min-width:50px; min-height:50px;"><div>' + item.title + '</div><div>' + item.content.replace(/\n/g, '<br>') + '</div></div>', // 제목과 내용을 포함하여 내용을 설정합니다.
                latlng: new kakao.maps.LatLng(item.latitude, item.longitude) // 위도와 경도는 데이터에서 받아온 값을 사용합니다.
            };
            positions.push(position);
        });

        // 생성된 객체 배열을 사용하여 마커를 표시합니다.
        displayMarkers(positions);
    },
    error: function(xhr, status, error) {
        // Ajax 요청이 실패하면 이 함수가 실행됩니다.
        console.error(error);  // 에러를 콘솔에 출력하여 확인합니다.
    }
});

// 마커를 표시하는 함수
function displayMarkers(positions) {
    // 마커를 생성하고 지도 위에 표시합니다.
    positions.forEach(function(position) {
        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: position.latlng // 마커의 위치
        });

        // 마커에 표시할 인포윈도우를 생성합니다.
        var infowindow = new kakao.maps.InfoWindow({
            content: position.content // 인포윈도우에 표시할 내용
        });

        // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다.
        // 이벤트 리스너로는 클로저를 만들어 등록합니다.
        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    });
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다.
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다.
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}
// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    