//%attributes = {"invisible":true}
If (False:C215)
	
	TRUNCATE TABLE:C1051([Book:1])
	SET DATABASE PARAMETER:C642([Book:1]; Table sequence number:K37:31; 0)
	
	var $response : Object
	
	$words:=Split string:C1554(Folder:C1567(fk resources folder:K87:11).file("words.txt").getText("utf-8"; Document with CR:K24:21); "\r"; sk ignore empty strings:K86:1 | sk trim spaces:K86:2)
	
	For each ($word; $words)
		
		$URL:="https://www.googleapis.com/books/v1/volumes?q="+encode_uri($word; WWW FORM)
		
		$status:=HTTP Get:C1157($URL; $response)
		
		If ($status=200)
			
			For each ($item; $response.items)
				$book:=ds:C1482.Book.new()
				$book.description:=$item.volumeInfo.description
				$book.textSnippet:=$item.searchInfo.textSnippet
				$book.title:=$item.volumeInfo.title
				$book.save()
			End for each 
			
		End if 
	End for each 
	
End if 