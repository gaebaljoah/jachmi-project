package com.jachmi.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MailTO {
    private String address;
    private String title;
    //private String message;
    private String reportTitle;
    private String reportContent;
}
