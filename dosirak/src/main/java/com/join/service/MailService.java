package com.join.service;

public interface MailService {

	public boolean send(String subject, String text, String form, String to, String filePath);
}
