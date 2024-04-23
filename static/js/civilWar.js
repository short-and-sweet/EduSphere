// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다

var civilWar_infowindow = new kakao.maps.InfoWindow({zIndex:1});

var civilWar_mapContainer = document.getElementById('civilWar_map'), // 지도를 표시할 div 
    civilWar_mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var civilWar_map = new kakao.maps.Map(civilWar_mapContainer, civilWar_mapOption); 

// 장소 검색 객체를 생성합니다
var civilWar_ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
civilWar_ps.keywordSearch('지하 1층 주차장', civilWar_placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function civilWar_placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            civilWar_displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        civilWar_map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function civilWar_displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: civilWar_map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(civilWar_map, marker);
    });
}

// 현재 위치
function civilWar_map_setBounds() {
    civilWar_map_setCenterAndMarker();
}
// 지도 중심 위치와 중심 마커를 설정하는 함수
function civilWar_map_setCenterAndMarker() {
    if (navigator.geolocation) {
        // 사용자의 현재 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
            var lat = position.coords.latitude; // 위도
            var lng = position.coords.longitude; // 경도

            var newCenter = new kakao.maps.LatLng(lat, lng); // 새로운 중심 좌표

            // 기존의 중심 마커를 제거합니다
            civilWar_map.setCenter(newCenter);
            
            // 새로운 중심 마커를 생성하고 지도에 표시합니다
            var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png', // 마커이미지의 주소입니다    
            imageSize = new kakao.maps.Size(34, 39), // 마커이미지의 크기입니다
            imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
            markerPosition = new kakao.maps.LatLng(lat, lng); // 마커가 표시될 위치입니다
            var newMarker = new kakao.maps.Marker({
                position: markerPosition, 
                image: markerImage // 마커이미지 설정 
            });

            

            newMarker.setMap(civilWar_map);

            var iwContent = '<div style="width:150px;text-align:center;padding:6px 0;">현재 내위치</div>',
                iwPosition = new kakao.maps.LatLng(lat, lng), //인포윈도우 표시 위치입니다
                iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
            
            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                position : iwPosition, 
                content : iwContent,
                removable : iwRemoveable
            });
            
            // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
            infowindow.open(civilWar_map, newMarker); 

            
        });
    } else {
        // Geolocation을 지원하지 않는 경우
        alert('Geolocation을 지원하지 않는 브라우저입니다');
    }
}