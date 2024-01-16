package com.example.docker.dto;

import lombok.Getter;

import java.time.LocalDate;

@Getter
public class ResponseDto {
    private String name;
    private Integer age;
    private LocalDate birth;
}
