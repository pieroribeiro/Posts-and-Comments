<%
Class Connection
	Private tmp_conn

	Private Sub Class_Initialize()
		If Not IsObject(tmp_conn) Then
			Set tmp_conn = Server.CreateObject("ADODB.Connection")
		End If
	End Sub
	Private Sub Class_Terminate()
		If IsObject(tmp_conn) Then
			Set tmp_conn = Nothing
			tmp_conn = Empty
		End If
	End Sub
	'---------- PUBLIC METHODS -------------------
	Public Function Open(database)
		If (tmp_conn.State <> 1) Then
			tmp_conn.Open "Provider=SQLNCLI11;Server=NOTEBOOK-PIERO\SQLEXPRESS;Database=DBPosts;User ID=user;PWD=user"
		End If
	End Function
	Public Function Close()
		If (tmp_conn.State = 1) Then
			tmp_conn.Close()
		End If
	End Function
	Public Function Exec(SQL)
		If (tmp_conn.State = 1) Then
			Set tmp_rs = tmp_conn.Execute(SQL)
			If tmp_rs.state = 1 Then
				If Not tmp_rs.Eof Then
					Exec = tmp_rs.getRows()
				Else
					Exec = Null
				End If
			Else
				Exec = Null
			End If
			Set tmp_rs = Nothing
			tmp_rs = Empty
		Else
			Exec = Null
		End If
	End Function
End Class
%>