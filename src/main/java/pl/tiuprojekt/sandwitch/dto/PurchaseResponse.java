package pl.tiuprojekt.sandwitch.dto;

import lombok.Data;

@Data
public class PurchaseResponse {

    private final String orderTrackingNumber;

    public PurchaseResponse (){
        this.orderTrackingNumber = "";

    }
    public PurchaseResponse (String orderTrackingNumber){
        this.orderTrackingNumber = orderTrackingNumber;
    }

}

//Previous code above//

