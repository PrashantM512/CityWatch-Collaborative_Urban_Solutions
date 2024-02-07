package com.city.watch.dao;
import java.util.List;

import com.city.watch.entity.Pins;

public interface PinsDao {
	
       public boolean addPin(Pins pin);
       public List<Pins> getPinByCategory(String category);
       public List<Pins> getSearchedPins(String key);
       
}
