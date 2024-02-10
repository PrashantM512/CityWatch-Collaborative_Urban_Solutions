package com.city.watch.dao;

import java.sql.Connection;
import java.util.List;

import com.city.watch.entity.Notification;

public interface NotificationDao {
      
	public boolean sendNotification(Notification noti);
	public List<Notification> getNotificationByTarget(String target);
	public List<Notification> getAllNotifications();
	public boolean deleteNotificationById(int id);
}
