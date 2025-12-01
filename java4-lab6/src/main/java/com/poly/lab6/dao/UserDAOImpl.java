package com.poly.lab6.dao;


import javax.persistence.EntityManager;

import com.poly.lab6.entity.User;
import com.poly.lab6.util.JpaUtils;

public class UserDAOImpl {
    public User findById(String id) {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            return em.find(User.class, id);
        } finally {
            em.close();
        }
    }
}