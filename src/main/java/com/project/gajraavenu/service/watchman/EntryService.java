package com.project.gajraavenu.service.watchman;

import com.project.gajraavenu.model.watchman.Entry;
import com.project.gajraavenu.repository.watchman.EntryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class EntryService {

    @Autowired
    private EntryRepository entryRepository;


    public Entry saveEntry(Entry entry) {
        entry.setEntryTime(LocalDateTime.now());
        return entryRepository.save(entry);
    }
    public List<Entry> getAllEntries() {
        return entryRepository.findAll(Sort.by(Sort.Direction.DESC, "entryTime"));
    }

    public void markExit(Long id) {
        Entry entry = entryRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Entry not found"));

        entry.setExitTime(LocalDateTime.now()); // IMPORTANT
        entryRepository.save(entry);
    }
}