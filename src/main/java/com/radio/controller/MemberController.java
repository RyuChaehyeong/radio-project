package com.radio.controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.radio.domain.AuthVO;
import com.radio.domain.MemberVO;
import com.radio.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	private MemberService service;
	private PasswordEncoder pwencoder;

	@GetMapping("/register")
	public void register() {

	}

	@PostMapping("/register")
	public String register(MemberVO vo, AuthVO authVo) {
		String bfPw = vo.getPassword();
		vo.setPassword(pwencoder.encode(bfPw));
		service.register(vo);
		service.registerAuth(authVo);

		return "redirect:/mini/list";

	}

	@GetMapping("/findid")
	public void findId() {

	}

	@PostMapping("/findid")
	public String findId(String email, Model model) {

		String id = service.get(email);
		model.addAttribute("id", id);

		if (id != null) {
			sendEmail(email, model);

		}

		return "/member/authnum";
	}


	@PostMapping("/yourid")
	public void yourid(String serverKey, String userKey, String id, Model model) {
		model.addAttribute("id", id);
		
		if (!serverKey.equals(userKey)) {
			model.addAttribute("AuthenticationKey", serverKey);
			model.addAttribute("failMsg", "인증번호가 일치하지 않습니다.");
		} 
		
	}

	@GetMapping("/findpw")
	public void findpw() {

	}

	@PostMapping("/findpw")
	public String findpw(String id, String email, Model model) {
		String realid = service.get(email);

		if (realid == null) {
			model.addAttribute("noExistMsg", "없는 이메일 정보입니다.");
		}

		if (realid != null && !realid.equals(id)) {
			model.addAttribute("noMatchMsg", "아이디가 일치하지 않습니다.");
		}

		if (realid != null && realid.equals(id)) {
			sendEmail(email, model);
		}

		return "/member/authnum_pw";
	}

	@PostMapping("/authnum_pw")
	public String authnu_pw(String serverKey, String userKey, Model model) {
		if (serverKey.equals(userKey)) {
			
			return "/member/resetpw";

		} else {
			model.addAttribute("failMsg", "인증번호가 일치하지 않습니다.");
			model.addAttribute("AuthenticationKey", serverKey);
			return "/member/authnum_pw";
		}

	}

	@PostMapping("/resetpw")
	public String resetpw(String id, String password, String ch_password, Model model) {
		
		
		if (ch_password.equals(password)) {

			String encodepw = pwencoder.encode(password);
			int cnt = service.updatePw(id, encodepw);

			if (cnt == 1) {
				model.addAttribute("success", "비밀번호 변경 성공!!");
				return "/member/resetpw_success";
			} else {
				// 유라언니가 한 유효성검사 추가
				return "/member/resetpw";
			}

		} else if (!ch_password.equals(password)){
			model.addAttribute("unEqual", "확인 비밀번호가 일치하지 않습니다.");
			return "/member/resetpw";

		//수정수정
		} else if (id == null) {
			model.addAttribute("noExist", "아이디를 확인해주세요.");
			return "/member/resetpw";
			
		} else {
			return null;
		}

	}

	public void sendEmail(String email, Model model) {

		String host = "smtp.naver.com";
		String user = "doodoo89@naver.com";
		String password = "0124chae^^&";

		String to_email = email;

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");

		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}

		String AuthenticationKey = temp.toString();
		model.addAttribute("AuthenticationKey", temp);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// email 전송
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user, "진수성찬 DJ진수입니다!"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

			// 메일 제목
			msg.setSubject("[이메일인증] 진수성찬 DJ진수입니다! 라디오 인증메일입니다.");
			// 메일 내용
			msg.setText("안녕하세요. 진수성찬  DJ진수입니다! \n\n홈페이지에서 다음 인증번호를 입력하세요.\n\n*************************************\n                "
			+ temp +"\n*************************************");

					
			Transport.send(msg);
			System.out.println("이메일 전송");

		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
	}
}
