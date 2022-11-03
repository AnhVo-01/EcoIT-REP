package com.example.backend.service;

import com.example.backend.model.History;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class HistoryLogger implements HandlerInterceptor {

    @Autowired
    private HistoryService historyService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){

        final String page = HttpRequestResponseUtils.getRequestUri();
        final String queryString = HttpRequestResponseUtils.getPageQueryString();
        final String requestMethod = HttpRequestResponseUtils.getRequestMethod();

        Date date = new Date();
        SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss z");

        History history = new History();

        history.setExecutor(HttpRequestResponseUtils.getLoggedInUser());
        history.setMethod(requestMethod);
        history.setPage(page);
        history.setQueryString(queryString);
        history.setDate(fm.format(date));

        if (page.contains("/delete")){
            history.setType("DELETE");
            historyService.saveVisitorInfo(history);
        } else if (requestMethod.equals("POST") && Character.isDigit(page.charAt(page.length() - 1))) {
            history.setType("UPDATE");
            historyService.saveVisitorInfo(history);
        } else if (requestMethod.equals("POST")) {
            history.setType("CREATE");
            historyService.saveVisitorInfo(history);
        }

        return true;
    }

}