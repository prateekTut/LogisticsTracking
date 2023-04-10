<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
 
    int updateVanTb = DatabaseConnection.insertUpdateFromSqlQuery("update teams set van_id='" + 0 + "' where team_id='" + id + "'");
    int updateTeamTb = DatabaseConnection.insertUpdateFromSqlQuery("update van set team_id='" + 0 + "' where team_id ='" + id + "'");
    if (updateVanTb > 0 && updateTeamTb > 0) {
        response.sendRedirect("admin-view-team.jsp");
    } else {
        response.sendRedirect("admin-view-team.jsp");
    }
    
%>