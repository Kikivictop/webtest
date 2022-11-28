package com.it.dao;

import com.it.entity.About;

import java.util.HashMap;
import java.util.List;

public interface AboutDAO {
	About findById(Integer id);
	void update(About about);
}
