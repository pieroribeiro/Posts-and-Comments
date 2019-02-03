<!--#include file="../../libs/connection.asp" -->
<%
Response.Charset = "iso-8859-1"
Set conn = New Connection
conn.Open("DBPosts")
RS = conn.Exec("SELECT [id], [title], [date] FROM [TBPosts] (NOLOCK) WHERE [status] = 'A' ORDER BY [date] DESC")
conn.Close()
Set conn = Nothing
conn = Empty

Response.Write "["
If IsArray(RS) Then
	For a = 0 To UBound(RS, 2)
		Response.Write "{""id"": "& RS(0, a) &",""title"":"""& RS(1, a) &""",""date"":"""& RS(2, a) &"""}"
		If a < UBound(RS, 2) Then
			Response.Write ","
		End If
	Next
End If
Response.Write "]"
%>