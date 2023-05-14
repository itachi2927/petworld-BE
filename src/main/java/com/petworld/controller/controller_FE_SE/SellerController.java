package com.petworld.controller.controller_FE_SE;

import com.petworld.dto.sellerDto.request.SellerDtoRequest;
import com.petworld.dto.sellerDto.response.SellerDtoResponse;
import com.petworld.service.SellerService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.Optional;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/sellers")
@RequiredArgsConstructor
public class SellerController {
    private final SellerService sellerService;
    @GetMapping("")
    public ResponseEntity<?> getAllSellers(@PageableDefault(size = 9) Pageable pageable) {
        Optional<Page<SellerDtoResponse>> sellerDtoResponses = sellerService.findAll(pageable);
        if (sellerDtoResponses.isEmpty()) return ResponseEntity.notFound().build();
        return ResponseEntity.ok().body(sellerDtoResponses);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getSellerById(@PathVariable(name = "id")Long id){
        Optional<SellerDtoResponse> sellerDtoResponse = sellerService.getById(id);
        if (sellerDtoResponse.isEmpty()) return ResponseEntity.notFound().build();
        return ResponseEntity.ok().body(sellerDtoResponse);
    }

    @GetMapping("/center/{name}")
    public ResponseEntity<?> getSellerByCenterName(@PathVariable(name ="name")String name){
        Optional<SellerDtoResponse> seller = sellerService.getByNameCenter(name);
        if (seller.isEmpty()) return ResponseEntity.notFound().build();
        return ResponseEntity.ok().body(seller);
    }

    @PostMapping("")
    public ResponseEntity<?> saveSeller(@RequestBody SellerDtoRequest sellerDtoRequest){
        Optional<SellerDtoRequest> newSeller = Optional.ofNullable(sellerDtoRequest);
        if (newSeller.isEmpty()) return ResponseEntity.badRequest().build();
        URI uri = URI.create(ServletUriComponentsBuilder.fromCurrentContextPath().
                path("api/sellers").toUriString());
        return ResponseEntity.created(uri).body(sellerService.save(newSeller.get()));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateSeller(@RequestBody SellerDtoRequest sellerDtoRequest){
        Optional<SellerDtoResponse> editedSeller = sellerService.getById(sellerDtoRequest.getId());
        if (editedSeller.isEmpty()) return ResponseEntity.notFound().build();
        return ResponseEntity.ok().body(sellerService.save(sellerDtoRequest));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteSeller(@PathVariable(name = "id") Long id){
        Optional<SellerDtoResponse> seller = sellerService.getById(id);
        if(seller.isEmpty()) return ResponseEntity.notFound().build();
        sellerService.deleteByIdByStatus(id);
        return ResponseEntity.ok().body(seller);
    }
}
