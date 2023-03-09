// Call the dataTables jQuery plugin
$(document).ready(function () {
  var lang_kor = {
    "decimal": "",
    "emptyTable": "데이터가 없습니다.",
    "info": "_START_ - _END_ (총 _TOTAL_ 행)",
    "infoEmpty": "0행",
    "infoFiltered": "(전체 _MAX_ 행 중 검색결과)",
    "infoPostFix": "",
    "thousands": ",",
    "lengthMenu": "_MENU_ 개씩 보기",
    "loadingRecords": "로딩중...",
    "processing": "처리중...",
    "search": "검색 : ",
    "zeroRecords": "검색된 데이터가 없습니다.",
    "paginate": {
      "first": "첫 페이지",
      "last": "마지막 페이지",
      "next": "다음",
      "previous": "이전"
    },
    "aria": {
      "sortAscending": " :  오름차순 정렬",
      "sortDescending": " :  내림차순 정렬"
    }
  };

  $('#noticeTable').DataTable({
    dom: '<"top"f<"dt_btn notice">>t<"bottom"ip>',
    lengthChange: false,
    language: lang_kor,
    order: [[1, 'desc']],
    ordering: [[1, false]],
    scrollX: 580,
    columnDefs: [
      {
        targets : 0,
        orderable: false,
        className: "select-checkbox",
        defaultContent: '',
        width: "50px !important"
      }
    ],
    select: {
      style: "multi",
      selector: "td:first-child"
    },
  });

  $("div.notice").append('<button id="btn_del_notice" class="btn btn-warning btn-table btn-del" data-toggle="modal" data-target="#NoticeDeleteModal" onclick="deleteList();">삭제</button>');
  $("div.notice").append('<a id="btn_add_notice" class="btn btn-primary btn-table" href="noticeAddForm.ma">추가</a>');

  var $checkAll = $('#checkAll');
  $checkAll.change(function () {
    var $this = $(this);
    var checked = $this.prop('checked'); 
    $('input[name="deleteCheck"]').prop('checked', checked);
  });

  var boxes = $('input[name="deleteCheck"]');
  boxes.change(function () {

    var boxLength = boxes.length;
    var checkedLength = $('input[name="deleteCheck"]:checked').length;
    var selectAll = (boxLength == checkedLength);

    $checkAll.prop('checked', selectAll);

  });

  $('#QnATable').DataTable({
    dom: '<"top"f<"dt_btn QnA">>t<"bottom"ip>',
    lengthChange: false,
    language: lang_kor,
    order: [[6, 'desc'],[5, 'desc']],
    columnDefs: [
      {
        targets : 0,
        orderable: false,
        className: "select-checkbox",
        defaultContent: '',
        width: "50px !important"
      },
      {
        targets : 8,
        orderable: false
      }
    ],
    scrollX: 580,
  });

  $("div.QnA").append('<button id="btn_del_QnA" class="btn btn-warning btn-table btn-del" data-toggle="modal" data-target="#qnaDeleteModal" onclick="deleteList();">삭제</button>');

  $("#btn_del_QnA").click(function(){
    $("#menuName").val("QnA");
  });

  $('#memberTable').DataTable({
    dom: '<"top"f<"dt_btn member">>t<"bottom"ip>',
    lengthChange: false,
    language: lang_kor,
    order: [[1, 'desc']],
    columnDefs: [
      {
        targets : 0,
        orderable: false,
        className: "select-checkbox",
        defaultContent: '',
        width: "50px !important"
      },
      {
        targets : 5,
        orderable: false,
      }
    ],
    scrollX: 580,
  });

  $("div.member").append('<button id="btn_del_mem" class="btn btn-warning btn-table btn-deact" data-toggle="modal" data-target="#memberDeactModal" onclick="deleteList();">탈퇴</button>');

  $('#productTable').DataTable({
    dom: '<"top"f<"dt_btn product">>t<"bottom"ip>',
    lengthChange: false,
    language: lang_kor,
    order: [[1, 'desc']],
    columnDefs: [
      {
        targets : 0,
        orderable: false,
        className: "select-checkbox",
        defaultContent: '',
        width: "50px !important"
      },
      {
        targets : 7,
        orderable: false,
      }
    ],
    scrollX: 580
  });

  $("div.product").append('<button id="btn_del_pro" class="btn btn-warning btn-table btn-del" data-toggle="modal" data-target="#productDeleteModal" onclick="deleteList();">삭제</button>');
  $("div.product").append('<a id="btn_add_pro" class="btn btn-primary btn-table" href="insertForm.pd">추가</a>');
  
  $("#btn_del_pro").click(function(){
    $("#menuName").val("pro");
  });

  $('#orderTable').DataTable({
    dom: '<"top"f<"dt_btn order">>t<"bottom"ip>',
    lengthChange: false,
    language: lang_kor,
    order: [[1, 'desc'],[4, 'asc']],
    columnDefs: [
      {
        targets : 0,
        orderable: false,
        className: "select-checkbox",
        defaultContent: '',
        width: "50px !important"
      },
      {
        targets : 5,
        orderable: false,
      }
    ],
    scrollX: 580
    
  });

  $("div.order").append('<select name="orderStatus" class="mr-2 custom-select">'
                        + '<option value="상품준비중">상품준비중</option>'
                        + '<option value="배송중">배송중</option>'
                        + '<option value="배송완료">배송완료</option>'
                        + '<option value="취소완료">취소완료</option>'
                        + '<option value="교환요청">교환요청</option>'
                        + '<option value="교환중">교환중</option>'
                        + '<option value="교환완료">교환완료</option>'
                        + '<option value="환불요청">환불요청</option>'
                        + '<option value="환불중">환불중</option>'
                        + '<option value="환불완료">환불완료</option>'
                        + '</select>');
  $("div.order").append('<button id="btn_send_order" class="btn btn-primary btn-table btn-send" data-toggle="modal" data-target="#orderStatusModal" onclick="deleteList();">변경</button>');

  // $('#w4tTable').DataTable({
  //   dom: '<"top"<"dt_btn w4t">>t<"bottom"ip>',
  //   lengthChange: false,
  //   language: lang_kor,
  //   order: false,
  //   scrollX: 580
  // });

  // $("div.w4t").append('<button id="btn_del_w4t" class="btn btn-warning btn-table btn-del" data-toggle="modal" data-target="#commonModal">삭제</button>');

});


