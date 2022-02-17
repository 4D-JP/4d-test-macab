$event:=FORM Event:C1606

Case of 
	: ($event.code=On Selection Change:K2:29)
		
		var $book : Object
		
		$book:=Form:C1466.books.item
		
		If ($book#Null:C1517)
			
			Form:C1466.controller.update()
			
		Else 
			
			Form:C1466.controller.clear()
			
		End if 
		
End case 