package com.example.backend.repository;

import com.example.backend.model.Blog;
import com.example.backend.model.History;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface HistoryRepository extends JpaRepository<History, Long> {
    List<History> getAllByExecutor(String id);

    @Query("SELECT h FROM History h WHERE (:method = '' OR h.method=:method) AND " +
            "(:executor = '' OR h.executor=:executor) AND (:action = '' OR h.type=:action) AND h.page LIKE %:page%")
    Page<History> historyFilter(Pageable pageable, @Param("method") String method,
                                @Param("executor") String executor,
                                @Param("action") String action, @Param("page") String page);
}
