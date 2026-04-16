package com.project.gajraavenu.repository.watchman;


import com.project.gajraavenu.model.watchman.Entry;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EntryRepository extends JpaRepository<Entry, Long> {

    List<Entry> findAllByOrderByEntryTimeDesc();

}