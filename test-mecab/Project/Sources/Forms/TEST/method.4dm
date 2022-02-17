$event:=FORM Event:C1606

Case of 
	: ($event.code=On Load:K2:1)
		
		Form:C1466.controller:=cs:C1710.TEST.new()
		
		Form:C1466.environment:=cs:C1710.Environment.new()
		
End case 