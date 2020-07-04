package Reply;

import java.util.ArrayList;

import Movie.UserDTO;

public interface PrototypeReply {

	//댓글 개수
	public int replyCount() throws Exception;
	//댓글 작성
	public String replyInsert(ReplyDTO dto) throws Exception;
	//댓글 수정
	public boolean replyUpdate(ReplyDTO dto) throws Exception;
	//댓글 삭제
	public String replyDelete(ReplyDTO dto) throws Exception;
	
	public String replyInsert(ReplyDTO dto, String sessionID) throws Exception;
	
	ArrayList<ReplyDTO> replyList(int replyID) throws Exception;
	
	
}
