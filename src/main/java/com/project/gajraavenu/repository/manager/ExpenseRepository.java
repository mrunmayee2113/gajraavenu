package com.project.gajraavenu.repository.manager;

import com.project.gajraavenu.model.manager.Expense;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExpenseRepository extends JpaRepository<Expense, Long> {
}