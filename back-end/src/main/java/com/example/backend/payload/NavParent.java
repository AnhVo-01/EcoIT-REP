package com.example.backend.payload;

import com.example.backend.model.Navigation;
import lombok.Data;

import java.util.List;

@Data
public class NavParent {
    private Long id;
    private String name;
    private String url;
    private List<Navigation> navChild;
    private boolean active;

    public NavParent(Long id, String name, String url, List<Navigation> navChild, boolean active) {
        this.id = id;
        this.name = name;
        this.url = url;
        this.navChild = navChild;
        this.active = active;
    }
}
