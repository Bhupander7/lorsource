<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.Connection,ru.org.linux.site.LorDataSource"  %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="lor" %>

<%--
  ~ Copyright 1998-2010 Linux.org.ru
  ~    Licensed under the Apache License, Version 2.0 (the "License");
  ~    you may not use this file except in compliance with the License.
  ~    You may obtain a copy of the License at
  ~
  ~        http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~    Unless required by applicable law or agreed to in writing, software
  ~    distributed under the License is distributed on an "AS IS" BASIS,
  ~    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~    See the License for the specific language governing permissions and
  ~    limitations under the License.
  --%>

<%--@elvariable id="message" type="ru.org.linux.site.Message"--%>
<jsp:include page="/WEB-INF/jsp/head.jsp"/>

<title>Восстановление сообщения</title>
<jsp:include page="/WEB-INF/jsp/header.jsp"/>

<%
Connection db = null;
try {
  db = LorDataSource.getConnection();
%>
<h1>Восстановление сообщения</h1>
Вы можете восстановить удалённое сообщение.
<form method=POST action="undelete.jsp">
<input type=hidden name=msgid value="<%= request.getParameter("msgid") %>">
<div class=messages>
  <lor:message db="<%= db %>" message="${message}" showMenu="false"/>
</div>
<input type=submit name=undel value="Undelete/Восстановить">
</form>
<%
} finally {
  if (db != null) {
    db.close();
  }
}
%>
<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
