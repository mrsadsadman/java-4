package com.poly.lab5.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import com.poly.lab5.entity.User;

public class UserDAO {
    // Lưu ý: Tên persistence-unit phải khớp với trong file persistence.xml của bạn
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE"); 

    public User findById(String id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(User.class, id);
        } finally {
            em.close();
        }
    }
}