Class constructor
	
Function reset()
	
	Form:C1466.books.col:=Form:C1466.all.copy()
	
	This:C1470.clear()
	
Function clear()
	
	Form:C1466.description:=Null:C1517
	Form:C1466.textSnippet:=Null:C1517
	Form:C1466.title:=Null:C1517
	
Function update()
	
	Form:C1466.description:=Form:C1466.books.sel.distinct("description")
	Form:C1466.textSnippet:=Form:C1466.books.sel.distinct("textSnippet")
	Form:C1466.title:=Form:C1466.books.sel.distinct("title")
	
Function split($q : Text)->$words : Collection
	
	$words:=New collection:C1472
	
	var $i : Integer
	
	$i:=1
	
	ARRAY LONGINT:C221($pos; 0)
	ARRAY LONGINT:C221($len; 0)
	
	While (Match regex:C1019("(\\S+)"; $q; $i; $pos; $len))
		$word:=Substring:C12($q; $pos{1}; $len{1})
		$word:=Replace string:C233($word; "@"; ""; *)
		$words.push($word+"@")
		$i:=$pos{1}+$len{1}
	End while 