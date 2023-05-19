package com.sns.handbook.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sns.handbook.dto.CommentDto;
import com.sns.handbook.dto.CommentlikeDto;
import com.sns.handbook.dto.FollowingDto;
import com.sns.handbook.dto.GuestbookDto;
import com.sns.handbook.dto.GuestbooklikeDto;
import com.sns.handbook.dto.PostDto;
import com.sns.handbook.dto.PostlikeDto;
import com.sns.handbook.dto.UserDto;
import com.sns.handbook.serivce.CommentService;
import com.sns.handbook.serivce.FollowingService;
import com.sns.handbook.serivce.GuestbooklikeService;
import com.sns.handbook.serivce.PostService;
import com.sns.handbook.serivce.PostlikeService;
import com.sns.handbook.serivce.UserService;

@Controller
public class UserController {

	@Autowired
	UserService uservice;
	
	@Autowired
	FollowingService fservice;
	
	@Autowired
	PostService pservice;
	
	@Autowired
	PostlikeService plservice;
	
	@Autowired
	GuestbooklikeService glservice;
	
	@Autowired
	CommentService cservice;
	
	//커버 사진 업데이트
	@PostMapping("/user/coverupdate")
	@ResponseBody
	public void coverupdate(String user_num, MultipartFile cover,
			HttpSession session,@ModelAttribute UserDto dto)
	{
			//업로드 경로
			String path=session.getServletContext().getRealPath("/cover");
			
			//파일명 구하기
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String coverName="f_"+sdf.format(new Date())+cover.getOriginalFilename();
			
			try {
				cover.transferTo(new File(path+"\\"+coverName));
				
				//db수정
				uservice.updateCover(user_num, coverName);
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
	}
	
	//프로필 사진 업데이트
	@PostMapping("/user/photoupdate")
	@ResponseBody
	public void photoupdate(String user_num,MultipartFile photo,
			HttpSession session,@ModelAttribute UserDto dto)
	{
		//업로드 경로
		String path=session.getServletContext().getRealPath("/photo");
		
			//파일명 구하기
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String photoName="f_"+sdf.format(new Date())+photo.getOriginalFilename();
			session.setAttribute("user_photo", photoName);
			
			try {
				photo.transferTo(new File(path+"\\"+photoName));
				
				uservice.updatePhoto(user_num, photoName);
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	//마이페이지 이동
	@GetMapping("/user/mypage")
	public ModelAndView mypage(@RequestParam(defaultValue = "0") int offset,String user_num,HttpSession session)
	{
		
		ModelAndView model=new ModelAndView();
		
		int followercount=fservice.getTotalFollower(user_num);
		int followcount=fservice.getTotalFollowing(user_num);
		String loginnum=uservice.getUserById((String)session.getAttribute("myid")).getUser_num();	
	
		UserDto udto=uservice.getUserByNum(user_num);
		List<GuestbookDto> guestlist=uservice.getGuestPost(user_num);
		List<PostDto> postlist=uservice.getPost(user_num);
		List<Map<String, Object>> alllist=new ArrayList<>();
		
		for(PostDto p:postlist) {
			Map<String, Object> map=new HashMap<>();
			
			map.put("post_num", p.getPost_num());
			map.put("user_num", p.getUser_num());
			map.put("owner_num", null);
			map.put("post_content", p.getPost_content());
			map.put("post_file", p.getPost_file());
			map.put("post_access", p.getPost_access());
			map.put("post_writeday", p.getPost_writeday());
			map.put("post_time", p.getPost_time());
			map.put("like_count", plservice.getTotalLike(p.getPost_num()));
			map.put("likecheck", plservice.checklike((String)session.getAttribute("user_num"),p.getPost_num()));
			map.put("type", "post");

			alllist.add(map);
		}
		
		for(GuestbookDto g:guestlist) {
			Map<String, Object> map=new HashMap<>();
			
			map.put("post_num", g.getGuest_num());
			map.put("user_num", g.getWrite_num());
			map.put("owner_num", g.getOwner_num());
			map.put("post_content", g.getGuest_content());
			map.put("post_file", g.getGuest_file());
			map.put("post_access", g.getGuest_access());
			map.put("post_writeday", g.getGuest_writeday());
			map.put("like_count", glservice.getTotalGuestLike(g.getGuest_num()));
			map.put("likecheck", glservice.checkGuestLike((String)session.getAttribute("user_num"), g.getGuest_num()));
			map.put("type", "guest");
			
			UserDto dto=uservice.getUserByNum(g.getWrite_num());
			map.put("dto", dto);
			
			alllist.add(map);
		}
		
		//최신 순 정렬
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		for (int i = 0; i < alllist.size() - 1; i++) {
		    for (int j = i + 1; j < alllist.size(); j++) {
		        try {
		            Date date1 = dateFormat.parse(alllist.get(i).get("post_writeday").toString());
		            Date date2 = dateFormat.parse(alllist.get(j).get("post_writeday").toString());

		            // 뒤에 데이터가 더 최신이면 앞으로 옮기기 (자리 바꾸기)
		            if (date2.compareTo(date1) > 0) {
		                Map<String, Object> temp = alllist.get(j);
		                alllist.set(j, alllist.get(i));
		                alllist.set(i, temp);
		            }
		        } catch (ParseException e) {
		            // 날짜 형식이 잘못되었을 경우 처리할 예외 처리 코드
		            e.printStackTrace();
		        }
		    }
		}
		
		for(int i = 0; i<alllist.size(); i++) {
			//대화 시간 오늘 날짜에서 빼기(몇 초전... 몇 분 전...)
	         Date today=new Date();
	         /* System.out.println(today); */
	         SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	         sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
	         Date writeday=new Date();
	         try {
	        	 writeday=sdf.parse(alllist.get(i).get("post_writeday").toString());
	            /* System.out.println(writeday); */
	         } catch (ParseException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }

	         long diffSec=(today.getTime()-writeday.getTime());
	         diffSec-=32400000L; //DB에 now()로 들어가는 시간이 9시간 차이 나서 빼줌
	         /* System.out.println(diffSec); */

	         //일시분초
	         long day=(diffSec/(60*60*24*1000L))%365;
	         long hour=(diffSec/(60*60*1000L))%24;
	         long minute=(diffSec/(60*1000L))%60;
	         long second=(diffSec/1000L)%60;

	         String preTime="";

	         if(day!=0) {
	            //하루 이상이 지났으면 일수만 표시
	            preTime=""+day+"일 전";
	         }else {
	            if(hour!=0) {
	               //1시간 이상이 지났으면 시(hour)만 표시
	               preTime=""+hour+"시간 전";
	            }else {
	               if(minute!=0) {
	                  //1분 이상이 지났으면 분만 표시
	                  preTime=""+minute+"분 전";
	               }else {
	                  //1분 미만 초만 표시
	                  preTime=""+second+"초 전";
	               }
	            }
	         }

	         alllist.get(i).put("post_time", preTime);
		}
		
		List<FollowingDto> tflist=uservice.getFollowList(user_num, offset);

		for(int i = 0; i<tflist.size(); i++) {
			UserDto dto = uservice.getUserByNum(tflist.get(i).getTo_user()); //여러가지 수많은 데이터에서 i번째 데이터만 가져오기, 여기서 필요한 상대방 num을 list에서 뽑아옴
			tflist.get(i).setUser_name(dto.getUser_name());// 위에서 dto에서 name photo를 뽑아내서 리스트에 set을 해줌
			tflist.get(i).setUser_photo(dto.getUser_photo());
			tflist.get(i).setTf_count(fservice.togetherFollow(dto.getUser_num(),(String)session.getAttribute("user_num")));
		}
		
		model.addObject("alllist", alllist);
		model.addObject("loginnum", loginnum);
		model.addObject("dto", udto);
		model.addObject("offset", offset);
		model.addObject("tflist", tflist);
		model.addObject("postlist",postlist);
		model.addObject("followercount", followercount);
		model.addObject("followcount", followcount);
		model.addObject("checkfollowing", fservice.checkFollowing((String)session.getAttribute("user_num"), user_num));
		model.addObject("tf_count", fservice.getTotalFollowing((String)session.getAttribute("user_num")));
	
		model.setViewName("/sub/user/mypage");

		return model;
	}
	
	//게시물 사진 여러장 올리기
	@PostMapping("/user/insertpost")
	@ResponseBody
	public void insertPost(@ModelAttribute PostDto dto, @RequestParam(required = false) List<MultipartFile> photo, HttpSession session) {
		
	    String path = session.getServletContext().getRealPath("/post_file");
	    
	    int idx = 1;
	    String uploadName = "";
	    
	    if (photo == null) {
	        dto.setPost_file("no");
	        pservice.insertPost(dto);
	        
	    } else {
	    	
	        for (MultipartFile f : photo) {
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
	            String fileName = idx++ + "_" + sdf.format(new Date()) + "_" + f.getOriginalFilename();
	            uploadName += fileName + ",";
	            
	            try {
	                f.transferTo(new File(path + "\\" + fileName));
	            } catch (IllegalStateException | IOException e) {
	                e.printStackTrace();
	            }
	        }
	        //콤마 제거
	        uploadName = uploadName.substring(0, uploadName.length() - 1);
	        
		    dto.setPost_file(uploadName);
		    pservice.insertPost(dto);
		    
	    }
	    
	}
	
	//프로필 업데이트
	@ResponseBody
	@PostMapping("/user/updateinfo")
	public void updateinfo(UserDto dto)
	{
		uservice.updateUserInfo(dto);
	}
	

	//게시물 수정 값 불러오기
	@ResponseBody
	@GetMapping("/user/updateform")
	public PostDto updateform(String post_num)
	{
		PostDto dto=pservice.getDataByNum(post_num);
		
		return dto;
	}
	
	//게시물 수정
	@ResponseBody
	@PostMapping("/user/updatepost")
	public void updatepost(@ModelAttribute PostDto dto,HttpSession session,@RequestParam(required = false) List<MultipartFile> photo)
	{
		
		String path = session.getServletContext().getRealPath("/post_file");
	    
	    int idx = 1;
	    String uploadName = "";
	    
	    
	    if (photo != null) {
	      
	        for (MultipartFile f : photo) {
	    	    
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
	            String fileName = idx++ + "_" + sdf.format(new Date()) + "_" + f.getOriginalFilename();
	            uploadName += fileName + ",";
	            
	            try {
	            	
	                f.transferTo(new File(path + "\\" + fileName));
	                
	            } catch (IllegalStateException | IOException e) {
	                e.printStackTrace();
	            }
	        }
	        //콤마 제거
	        uploadName = uploadName.substring(0, uploadName.length() - 1);
	        
		    dto.setPost_file(uploadName);
		    
		    pservice.updatePhoto(dto.getPost_num(), uploadName);
		    
	    }
	    
	    pservice.updatePost(dto);
	    
	    
	}


	
	//게시물 삭제
	@ResponseBody
	@GetMapping("/user/deletepost")
	public void deletepost(String post_num)
	{
		pservice.deletePost(post_num);
	}
	
	//좋아요
	@GetMapping("/user/likeinsert")
	@ResponseBody
	public void insertLike(@ModelAttribute PostlikeDto dto) {
		
		
		plservice.insertLike(dto);
	}
	
	//좋아요 취소
	@GetMapping("/user/likedelete")
	@ResponseBody
	public void deleteLike(String post_num,String user_num) {
		
		plservice.deleteLike(post_num,user_num);
	}
	
	//방명록 좋아요
	@GetMapping("/user/guestlikeinsert")
	@ResponseBody
	public void insertGuestLike(@ModelAttribute GuestbooklikeDto dto) {
		
		glservice.insertGuestLike(dto);
	}
	
	//방명록 좋아요 취소
	@GetMapping("/user/guestlikedelete")
	@ResponseBody
	public void deleteGuestLike(String guest_num,String user_num) {
		
		glservice.deleteGuestLike(guest_num, user_num);
	}
	
	//팔로우 하기
	@ResponseBody
	@GetMapping("/user/insertfollowing")
	public void insertfollowing(@ModelAttribute FollowingDto dto)
	{
		fservice.insertFollowing(dto);
	}
	
	//팔로우 취소
	@ResponseBody
	@GetMapping("/user/unfollowing")
	public void followingdelete(String to_user, HttpSession session) {

		fservice.deleteFollowing((String)session.getAttribute("user_num"),to_user);

	}
	
	//방명록 작성
	@ResponseBody
	@PostMapping("/user/insertguestbook")
	public void insertguestbook(@ModelAttribute GuestbookDto dto, @RequestParam(required = false) List<MultipartFile> photo, HttpSession session) {
			
		    String path = session.getServletContext().getRealPath("/guest_file");
		    
		    int idx = 1;
		    String uploadName = "";
		    
		    if (photo == null) {
		        dto.setGuest_file("no");
		        uservice.insertGuestBook(dto);
		        
		    } else {
		    	
		        for (MultipartFile f : photo) {
		            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		            String fileName = idx++ + "_" + sdf.format(new Date()) + "_" + f.getOriginalFilename();
		            uploadName += fileName + ",";
		            
		            try {
		                f.transferTo(new File(path + "\\" + fileName));
		            } catch (IllegalStateException | IOException e) {
		                e.printStackTrace();
		            }
		        }
		        //콤마 제거
		        uploadName = uploadName.substring(0, uploadName.length() - 1);
		        
			    dto.setGuest_file(uploadName);
			    uservice.insertGuestBook(dto);
			    
		    }
		    
		}
	
	//방명록 삭제
	@ResponseBody
	@GetMapping("/user/deleteguestbook")
	public void deleteGuestBook(String guest_num)
	{
		uservice.deleteGuestBook(guest_num);
	}
	
	
	 //방명록 수정
	 @ResponseBody
	 @PostMapping("/user/updateguestbook")
	 public void updateguestbook(@ModelAttribute GuestbookDto dto,HttpSession session,@RequestParam(required = false) List<MultipartFile> photo)
		{
			
			String path = session.getServletContext().getRealPath("/guest_file");
		    
		    int idx = 1;
		    String uploadName = "";
		    
		    if (photo != null) {
		      
		        for (MultipartFile f : photo) {
		    	    
		            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		            String fileName = idx++ + "_" + sdf.format(new Date()) + "_" + f.getOriginalFilename();
		            uploadName += fileName + ",";
		            
		            try {
		            	
		                f.transferTo(new File(path + "\\" + fileName));
		                
		            } catch (IllegalStateException | IOException e) {
		                e.printStackTrace();
		            }
		        }
		        //콤마 제거
		        uploadName = uploadName.substring(0, uploadName.length() - 1);
		        
			    dto.setGuest_file(uploadName);
		    }else {
		    	
		    	String prevFile=uservice.getDataByGuestNum(dto.getGuest_num()).getGuest_file();
		    	dto.setGuest_file(prevFile);
		    }
		    
		    uservice.updateGuestBook(dto);
		}
	 
	
	//방명록 수정 값 불러오기
	@ResponseBody
	@GetMapping("/user/updateguestform")
	public GuestbookDto getDataByGuestNum(String guest_num)
	{
		GuestbookDto dto=uservice.getDataByGuestNum(guest_num);

		return dto;
	}
	
	//댓글 입력
	@ResponseBody
	@PostMapping("/user/cinsert")
	public void insert(@ModelAttribute CommentDto dto,HttpSession session) {


		if(!dto.getComment_num().equals("0")) {
			CommentDto momDto= cservice.getData(dto.getComment_num());

			dto.setComment_group(momDto.getComment_group());
			dto.setComment_step(momDto.getComment_step());
			dto.setComment_level(momDto.getComment_level());
		}
		dto.setUser_num((String)session.getAttribute("user_num"));
		cservice.insert(dto);

	}
	
	//댓글 좋아요
	@GetMapping("/user/commentlikeinsert")
	@ResponseBody
	public void likeinsert(String comment_num,HttpSession session) {

		CommentlikeDto dto=new CommentlikeDto();

		dto.setComment_num(comment_num);
		dto.setUser_num((String)session.getAttribute("user_num"));

		cservice.insertLike(dto);
	}
	
	@GetMapping("/user/commentlikedelete")
	@ResponseBody
	public void likedelete(String comment_num,HttpSession session) {

		CommentlikeDto dto=new CommentlikeDto();

		dto.setComment_num(comment_num);
		dto.setUser_num((String)session.getAttribute("user_num"));

		cservice.deleteLike((String)session.getAttribute("user_num"), comment_num);
	}
	
	//정보 페이지 이동
	@GetMapping("/user/info")
	public String info()
	{
		return "/sub/user/info";
	}
	
	//친구 목록 이동
	@GetMapping("/user/friend")
	public String friend()
	{
		return "/sub/user/friend";
	}

	//회원 탈퇴
	@GetMapping("/user/userdelete")
	public String userdelete(String user_num, HttpSession session) {
		uservice.userDelete(user_num);
		session.removeAttribute("loginok");
		session.invalidate(); // 세션의 모든 속성을 삭제
		return "redirect:/";
	}
}
