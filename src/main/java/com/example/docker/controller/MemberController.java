package com.example.docker.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MemberController {
    @GetMapping("/test")
    public String test() {
        return "docker test!";
    }

    @GetMapping("/test2")
    public String test2() {
        return "docker test2";
    }
}
