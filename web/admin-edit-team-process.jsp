<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
    //Getting all the inputs from the admin
    int id = Integer.parseInt(request.getParameter("id"));
    String van_name = request.getParameter("van_name");
 
    System.out.println("van name " + van_name);
    //Querying to the database
    int updateVanTb = DatabaseConnection.insertUpdateFromSqlQuery("update teams set van_id='" + van_name + "' where team_id='" + id + "'");
    int updateTeamTb = DatabaseConnection.insertUpdateFromSqlQuery("update van set team_id='" + id + "' where van_id='" + van_name + "'");
    if (updateVanTb > 0 && updateTeamTb > 0) {
        response.sendRedirect("admin-view-team.jsp");
    } else {
        response.sendRedirect("admin-view-team.jsp");
    }
%>