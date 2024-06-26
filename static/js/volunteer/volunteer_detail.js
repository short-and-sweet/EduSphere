var latitude = document.getElementById('latitude').textContent;
var longitude = document.getElementById('longitude').textContent;

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(latitude, longitude),
        level: 2 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var startSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
    startSize = new kakao.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
    startOption = { 
        offset: new kakao.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
    };

// 출발 마커 이미지를 생성합니다
var startImage = new kakao.maps.MarkerImage(startSrc, startSize, startOption);

var startDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_drag.png', // 출발 마커의 드래그 이미지 주소입니다    
    startDragSize = new kakao.maps.Size(50, 64), // 출발 마커의 드래그 이미지 크기입니다 
    startDragOption = { 
        offset: new kakao.maps.Point(15, 54) // 출발 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
    };

// 출발 마커의 드래그 이미지를 생성합니다
var startDragImage = new kakao.maps.MarkerImage(startDragSrc, startDragSize, startDragOption);

// 출발 마커가 표시될 위치입니다 
var startPosition = new kakao.maps.LatLng(latitude, longitude); 

// 출발 마커를 생성합니다
var startMarker = new kakao.maps.Marker({
    map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
    position: startPosition,
    draggable: true, // 출발 마커가 드래그 가능하도록 설정합니다
    image: startImage // 출발 마커이미지를 설정합니다
});

// 출발 마커에 dragstart 이벤트를 등록합니다
kakao.maps.event.addListener(startMarker, 'dragstart', function() {
    // 출발 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
    startMarker.setImage(startDragImage);
});

// 출발 마커에 dragend 이벤트를 등록합니다
kakao.maps.event.addListener(startMarker, 'dragend', function() {
     // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
    startMarker.setImage(startImage);
});
