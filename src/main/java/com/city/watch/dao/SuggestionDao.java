package com.city.watch.dao;

import java.util.List;

import com.city.watch.entity.Suggestion;

public interface SuggestionDao {
         
	public boolean addSuggestion(Suggestion sug); 
	public List<Suggestion> getSuggestionsById(int uid);
	public boolean deleteSuggestionByIdandUid(int id, int uid);
}
