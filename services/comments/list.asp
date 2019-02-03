<%
If Not IsNumeric(Request.QueryString("idlastcomment")) Or CInt(Request.QueryString("idlastcomment")) >= 3 Then
	Response.Write("[]")
	Response.End()
End If
%>[{
	"id": 1,
	"comment": "Teste 1",
	"user": "user 1",
	"date": "2019-01-27T06:30:00"
},{
	"id": 2,
	"comment": "Teste 2",
	"user": "user 2",
	"date": "2019-01-27T06:30:00"
},{
	"id": 3,
	"comment": "Teste 3",
	"user": "user 3",
	"date": "2019-01-27T06:30:00"
}]