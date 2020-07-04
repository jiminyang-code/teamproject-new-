	var replyPW = document.getElementsByClassName('cmt_delpw');
	 var replyID = document.getElementsByClassName('cmt_ID');
	 
	 
	 /*겪었던 함수실행문제 - id값을 담아서 함수를 실행했더니 자꾸 맨위의 댓글만 함수실행이 되어서 아래 댓글들은 함수실행이 안되는 문제를 겪음*/
	 
	 //댓글삭제창 띄우기
    var dis = function (i) {
    	if($('.cmt_delpw_box').eq(i).css('display') == 'none') {
    		$('.cmt_delpw_box').eq(i).show();
    	}
    }
    
    //댓글삭제창 닫기
    var appear = function(i) {
    		$('.cmt_delpw_box').eq(i).hide();
    	}
    $(function(){
    	$("#Form").on("submit",function(){
    		var d=$("#Form").serialize();
    		
    		$.ajax({
    			url:"replyAction.jsp",
    			type:"post",
    			data:d,
    			success: function() {
    				location.reload(true);
    			}
    		});
    		return false;
    	});
    });

	/*$(window).scroll(function(){
	    	if ($(this).scrollTop() > 300){
	    		$('.btn_gotop').show();
	    	} else{
	    		$('.btn_gotop').hide();
	    	}
	    });
	    $('.btn_gotop').click(function(){
	    	$('html, body').animate({scrollTop:0},400);
	    	return false;
	    });*/

	/*댓글작성 클릭, 맨아래에서 위로 스크롤  이동*/
	$(document).ready(function(){
	        $('#like a').click(function(e){
	            $.scrollTo(this.hash||0, 280);
	            e.preventDefault();
	        });
	        $('#btn_gotop').click(function(e){
	            $.scrollTo(this.hash||0, 280);
	            e.preventDefault();
	        });
	    });

	