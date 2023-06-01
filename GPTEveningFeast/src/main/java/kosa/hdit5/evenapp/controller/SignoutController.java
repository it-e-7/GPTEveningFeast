package kosa.hdit5.evenapp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class SignoutController {

    @PostMapping(value="/signout")
    public ResponseEntity<String> signoutHandler(HttpSession session){
        try {
            session.invalidate();
            return ResponseEntity.status(HttpStatus.OK).body("success");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("failed");
        }
    }
}
