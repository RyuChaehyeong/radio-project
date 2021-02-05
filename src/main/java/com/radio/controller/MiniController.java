package com.radio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.radio.domain.Criteria;
import com.radio.domain.MiniVO;
import com.radio.domain.PageDTO;
import com.radio.service.MiniService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mini/*")
@AllArgsConstructor
public class MiniController {
	
	private MiniService service;
	
	@GetMapping("/list")
	public void list (@ModelAttribute("cri") Criteria cri, Model model) {
		int total = service.getTotal();
		PageDTO dto = new PageDTO(cri, total);
		
		model.addAttribute("list", service.getListWithPaging(cri));
		model.addAttribute("pageMaker", dto);
		log.info("list");
	}
	
	@PostMapping("/register")
	public String register(MiniVO mini, RedirectAttributes rttr) {
		service.register(mini);
		return "redirect:/todo/list";
	}
	
	
}
