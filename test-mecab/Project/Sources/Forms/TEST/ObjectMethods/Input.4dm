$event:=FORM Event:C1606

Case of 
	: ($event.code=On Data Change:K2:15) | ($event.code=On After Edit:K2:43)
		
		If (OBJECT Get name:C1087(Object with focus:K67:3)=OBJECT Get name:C1087)
			$q:=Get edited text:C655
		Else 
			$q:=Form:C1466.q
		End if 
		
		If (Match regex:C1019("\\s+"; $q))
			
			Form:C1466.controller.reset()
			
		Else 
			
			$words:=Form:C1466.controller.split($q)
			
			If ($words.length#0)
				
				$queryParams:=New object:C1471("attributes"; New object:C1471; "parameters"; New object:C1471)
				
				$criteria:=New collection:C1472
				
				$i:=1
				
				For each ($word; $words)
					$placeholder:="word"+String:C10($i)
					$queryParams.parameters[$placeholder]:=$word
					$criteria.push(New collection:C1472(":attribute % :"+$placeholder; ":attribute % :"+$placeholder; ":attribute % :"+$placeholder).join(" or "))
					$i:=$i+1
				End for each 
				
				$criterion:=$criteria.join(" and ")
				
				$attributes:=New collection:C1472("description"; "textSnippet"; "title")
				
				For each ($attribute; $attributes)
					$queryParams.attributes.attribute:=$attribute
					Form:C1466[$attribute]:=ds:C1482.Book.query($criterion; $queryParams)[$attribute]
				End for each 
				
			End if 
			
		End if 
		
End case 