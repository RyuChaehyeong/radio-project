package com.radio.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MiniVO {
	private Long num;
	private String content;
	private String writer;
	private Date regdate;
}
