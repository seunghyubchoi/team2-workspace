(function($) {
  "use strict"; // Start of use strict

  // Toggle the side navigation
  // $("#sidebarToggle, #sidebarToggleTop").on('click', function(e) {
  //   $("body").toggleClass("sidebar-toggled");
  //   $(".sidebar").toggleClass("toggled");
  //   if ($(".sidebar").hasClass("toggled")) {
  //     $('.sidebar .collapse').collapse('hide');
  //   };
  // });

  // // Close any open menu accordions when window is resized below 768px
  // $(window).resize(function() {
  //   if ($(window).width() < 768) {
  //     $('.sidebar .collapse').collapse('hide');
  //   };
    
  //   // Toggle the side navigation when window is resized below 480px
  //   if ($(window).width() < 480 && !$(".sidebar").hasClass("toggled")) {
  //     $("body").addClass("sidebar-toggled");
  //     $(".sidebar").addClass("toggled");
  //     $('.sidebar .collapse').collapse('hide');
  //   };
  // });

  // Prevent the content wrapper from scrolling when the fixed side navigation hovered over
  // $('body.fixed-nav .sidebar').on('mousewheel DOMMouseScroll wheel', function(e) {
  //   if ($(window).width() > 768) {
  //     var e0 = e.originalEvent,
  //       delta = e0.wheelDelta || -e0.detail;
  //     this.scrollTop += (delta < 0 ? 1 : -1) * 30;
  //     e.preventDefault();
  //   }
  // });

  // Scroll to top button appear
  $(document).on('scroll', function() {
    var scrollDistance = $(this).scrollTop();
    if (scrollDistance > 100) {
      $('.scroll-to-top').fadeIn();
    } else {
      $('.scroll-to-top').fadeOut();
    }
  });

  // Smooth scrolling using jQuery easing
  $(document).on('click', 'a.scroll-to-top', function(e) {
    var $anchor = $(this);
    $('html, body').stop().animate({
      scrollTop: ($($anchor.attr('href')).offset().top)
    }, 1000, 'easeInOutExpo');
    e.preventDefault();
  });



})(jQuery); // End of use strict

// common script
function sidebarActiveDelete(){
  $(".nav-item").each(function(){
    if ($(this).hasClass("active")) {
      $(this).removeClass('active')
    }
  });
  $(".collapse-item").each(function(){
    if ($(this).hasClass("active")) {
      $(this).removeClass('active')
    }
  });
}
  
function sidebarActive(sidebarId) {
  $(sidebarId).addClass("active");
}

function sidebarCollapseActive(collapseId) {
  $(collapseId).addClass("active");
  $("#collapsePages").addClass("show");
}

function deleteList() {
  var arr = new Array();
  var list = $("input[name=deleteCheck]");
  for (var i = 0; i < list.length; i++){
    if(list[i].checked){
      arr.push(list[i].value);
    }
  }
  $("#deleteList").val(arr);
}

// Admin Notice script
function changeValue(a) {
	$("#notice-add-file span").text(a.files[0].name);
}

// Admin QnA script
function notCom(){
  var ansYn = $("input[name=ansYn]");

  ansYn.val("N");

  $("#comBtn").click();
}

// Admin Member script
function sample6_execDaumPostcode() {
  new daum.Postcode({
      oncomplete: function (data) {
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
              if (data.bname !== ''
                  && /[동|로|가]$/g.test(data.bname)) {
                  extraAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if (data.buildingName !== ''
                  && data.apartment === 'Y') {
                  extraAddr += (extraAddr !== '' ? ', '
                      + data.buildingName
                      : data.buildingName);
              }
              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if (extraAddr !== '') {
                  extraAddr = ' (' + extraAddr + ')';
              }
              // 조합된 참고항목을 해당 필드에 넣는다.
              //document.getElementById("sample6_extraAddress").value = extraAddr;
              $("#sample6_extraAddress").val(extraAddr);
          } else {
              //document.getElementById("sample6_extraAddress").value = '';
              $("#sample6_extraAddress").val("");
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          //document.getElementById('sample6_postcode').value = data.zonecode;
          $("#sample6_postcode").val(data.zonecode);
          //document.getElementById("sample6_address").value = addr;
          $("#sample6_address").val(addr)
          // 커서를 상세주소 필드로 이동한다.
          // document.getElementById("sample6_detailAddress")
          //     .focus();
          $("#sample6_detailAddress").val("")
          $("#sample6_detailAddress").focus();
      }
  }).open();
}

function modifyLocation(num){
  $("#Location form").attr("action", "adminUpdate.lo");
  $("#modal-title").text("배송지 수정");

  $("#Location input[name=locNo]").val($("input[name=locNo" + num + "]").val());
  $("#Location input[name=locAddressName]").val($("input[name=locAddressName" + num + "]").val());
  $("#Location input[name=locName]").val($("input[name=locName" + num + "]").val());
  $("#Location input[name=locPhone]").val($("input[name=locAddressPhone" + num + "]").val());
  $("#Location input[name=locAddress]").val($("input[name=locAddress" + num + "]").val());
  $("#Location input[name=locAddressDtl]").val($("input[name=locAddressDetail" + num + "]").val());
  $("#Location input[name=locPostCode]").val($("input[name=locPostNumber" + num + "]").val());
  $("#Location input[name=locYn]").val($("input[name=locYn" + num + "]").val());
  
  if($("input[name=locYn" + num + "]").val() == 'Y'){
    $("#locYnBox").prop("checked", true);
  }else{
    $("#locYnBox").prop("checked", false);
  }
}

function addLocation(locYn){
  $("#Location form").attr("action", "adminInsert.lo");
  $("input[name=memNo]").siblings("table").find("input").val("");
  $("#modal-title").text("배송지 추가");

  if(locYn == 'Y'){
      $("#locYnBox").prop("checked", true);
      $("#locYn").val(locYn);
      $("#locYnBox").prop("disabled", true);
  }else{
      $("#locYnBox").prop("checked", false);
      $("#locYn").val('N');
  }
}

function changeLocYnBox(){
  if($("#locYn").val() == 'Y'){
    $("#locYn").val("N")
  }else{
    $("#locYn").val("Y");
  }
}

function deleteLocation(num){
  $("#deleteNo").val($("input[name=locNo" + num + "]").val());
}
