$event:=FORM Event:C1606

Case of 
	: ($event.code=On Load:K2:1)
		
		Form:C1466.controller:=cs:C1710.TEST.new()
		
		Form:C1466.environment:=cs:C1710.Environment.new()
		
		Form:C1466.data:=New object:C1471("col"; Null:C1517; "sel"; Null:C1517; "pos"; Null:C1517; "item"; Null:C1517)
		
		Form:C1466.books:=OB Copy:C1225(Form:C1466.data)
		
		Form:C1466.all:=ds:C1482.Book.all()
		
		Form:C1466.books.col:=Form:C1466.all.copy()
		
		Form:C1466.words:=OB Copy:C1225(Form:C1466.data)
		
End case 