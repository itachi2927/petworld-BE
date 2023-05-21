package com.petworld.controller.controller_FE_SF;

import com.petworld.dto.cartDto.request.CartDetailDtoRequest;
import com.petworld.dto.cartDto.response.CartDtoResponse;
import com.petworld.service.SecurityService;
import com.petworld.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
@CrossOrigin("*")
@RestController
@RequestMapping("/api/cart")
@RequiredArgsConstructor
public class CartController {


    private final SecurityService securityService;
    private final CartService cartService;

    @GetMapping("")
    public ResponseEntity<?> getAllCarts(@RequestHeader("Authorization") final String authToken,
                                         @PageableDefault(size = 9) Pageable pageable) {
        if (!securityService.isAuthenticated() && !securityService.isValidToken(authToken)) {
            return new ResponseEntity<String>("Responding with unauthorized error. Message - {}", HttpStatus.UNAUTHORIZED);
        }
        Page<CartDtoResponse> cartDtoResponses = cartService.getAllCarts(pageable);
        return new ResponseEntity<>(cartDtoResponses, HttpStatus.OK);
    }

    @GetMapping("/{email}")
    public ResponseEntity<?> getCartByEmail(@PathVariable("email") String email) {
        CartDtoResponse cartDtoResponses = cartService.getCartByEmail(email);
        return new ResponseEntity<>(cartDtoResponses, HttpStatus.OK);
    }

    @PostMapping("/{email}")
    public ResponseEntity<?> addToCart(@RequestBody CartDetailDtoRequest cartDetailDtoRequest,
                                       @PathVariable("email") String email){
        cartService.addToCart(email,cartDetailDtoRequest);
        return new ResponseEntity<>("Product added to cart successfully.", HttpStatus.CREATED);
    }

    @DeleteMapping("/{productId}/{email}")
    public ResponseEntity<?> deleteProductInCart(@PathVariable("productId") Long productId,
                                                 @PathVariable("email") String email){

        cartService.removeToCart(email,productId);
        return new ResponseEntity<>("Product is removed successfully.", HttpStatus.NO_CONTENT);
    }
}
