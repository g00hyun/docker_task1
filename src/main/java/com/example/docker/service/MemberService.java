package com.example.docker.service;

import com.example.docker.dto.ResponseDto;
import com.example.docker.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberRepository memberRepository;

//    public ResponseDto getMember() {
//        return
//    }
}
