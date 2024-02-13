package com.city.watch.dao;

import java.util.List;

import com.city.watch.entity.Recruitment;

public interface RecruitmentDao {
     public boolean addRecruitment(Recruitment recruitment);
     public List<Recruitment> getAllRecruitments();
     public boolean deleteRecruitmentById(int id);
}
