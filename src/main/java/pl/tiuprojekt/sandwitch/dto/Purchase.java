package pl.tiuprojekt.sandwitch.dto;

import lombok.Data;
import pl.tiuprojekt.sandwitch.entity.Address;
import pl.tiuprojekt.sandwitch.entity.Order;
import pl.tiuprojekt.sandwitch.entity.OrderItem;
import pl.tiuprojekt.sandwitch.entity.User;

import java.util.Set;

@Data
public class Purchase {
    private User customer;
    private Address orderAddress;
    private Order order;
    private Set<OrderItem> orderItems;
    public Order getOrder() {
        return this.order;
    }
    public Set<OrderItem> getOrderItems() {
        return this.orderItems;
    }
    public Address getOrderAddress() {
        return this.orderAddress;
    }
    public User getCustomer() {
        return this.customer;
    }
}
