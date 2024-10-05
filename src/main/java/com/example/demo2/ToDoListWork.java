package com.example.demo2;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import java.util.List;


public class ToDoListWork {

    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
    EntityManager entityManager = entityManagerFactory.createEntityManager();
    EntityTransaction transaction = entityManager.getTransaction();


    public void addItem(String description) {
        try {
            transaction.begin();


            todolist item1 = new todolist();
            item1.setDescription(description);
            item1.setDone(false);

            entityManager.persist(item1);

            transaction.commit();
        }finally {
            if(transaction.isActive()){
                transaction.rollback();}
        }


    }






    public void deleteItem(int id) {
        try {
            transaction.begin();


            todolist item = entityManager.find(todolist.class, id);
            entityManager.remove(item);
            entityManager.flush();
            entityManager.clear();

            transaction.commit();
        }finally {
            if(transaction.isActive()){
                transaction.rollback();}
        }
    }

    public List<todolist> getItems() {
        try {
            return entityManager.createQuery("SELECT t FROM todolist t", todolist.class).getResultList();
        } catch (Exception e) {
            return List.of();
        }

    }








}