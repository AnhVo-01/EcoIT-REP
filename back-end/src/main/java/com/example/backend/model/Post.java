package com.example.backend.model;

import lombok.Data;

import javax.persistence.*;
import java.util.Set;

@Entity
@Data
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "post_id")
    private Long id;

    private String title;

    @Column(columnDefinition = "text")
    private String content;

    @Column(columnDefinition = "text")
    private String description;

    @Column(name = "created_date")
    private String date;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "post_image",
            joinColumns = {
                    @JoinColumn(name = "post_id")
            }, inverseJoinColumns = {
            @JoinColumn(name = "image_id")
    }
    )
    private Set<Image> postImage;

    @Column(columnDefinition = "text")
    private String url;

    private boolean active;

    public void deletePostImage(Image image){
        if(getPostImage().contains(image)){
            getPostImage().remove(image);
        }
    }
}
