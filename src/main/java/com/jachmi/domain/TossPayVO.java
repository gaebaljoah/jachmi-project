package com.jachmi.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TossPayVO {
		private String payType;
		private Long amount;
	    private String orderId, orderName, customerName, successUrl, failUrl, flowMode, easyPay;
	    private String paymentKey;
	    
}
