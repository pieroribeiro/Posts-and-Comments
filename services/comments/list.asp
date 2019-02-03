<!--#include file="../../libs/connection.asp" -->
<%
IDPOST = Request.QueryString("idpost")
IDLASTCOMMENT = Request.QueryString("idlastcomment")
TIMESTAMP = Request.QueryString("timestamp")
Response.Charset = "iso-8859-1"
Server.ScriptTimeout = 900
Set conn = New Connection
conn.Open("DBPosts")
RS = conn.Exec("SELECT * FROM (SELECT TOP 3 [id], [id_post], [description], [id_user], [date] FROM [TBComments] (NOLOCK) WHERE [id_post] = '"& IDPOST &"' AND [id] > '"& IDLASTCOMMENT &"' AND [status] = 'A' ORDER BY [id] ASC) AS TMPTBL ORDER BY 5 DESC")
conn.Close()
Set conn = Nothing
conn = Empty

If IsArray(RS) Then
	Response.Write "["
	For a = 0 To UBound(RS, 2)
		Response.Write "{""id"": "& RS(0, a) &",""post"":"""& RS(1, a) &""",""comment"":"""& RS(2, a) &""",""user"":""user "& RS(3, a) &""",""date"":"""& RS(4, a) &"""}"
		If a < UBound(RS, 2) Then
			Response.Write ","
		End If
	Next
	Response.Write "]"
End If
%>