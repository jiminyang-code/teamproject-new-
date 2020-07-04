package Reply;

public class Page {
	int totalRecord = 0; //전체 댓글 개수
	int numPerPage = 5; //한 페이지당 보여질 글 개수
	int pagePerBlock = 3; //한 블럭당 묶여질 페이지 수
	int totalPage = 0; //전체 페이지 수
	int totalBlcok = 0; //전체 블럭 수
	int nowPage = 0; //현재 보여질 페이지
	int nowBlock = 0; //현재 보여질 블럭
	int beginPerPage; //각 페이지의 시작 글번호
}
