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

function changeValue(a) {
	$("#notice-add-file span").text(a.files[0].name);
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

function notCom(){
  var ansYn = $("input[name=ansYn]");

  ansYn.val("N");

  $("#comBtn").click();
}