Class constructor
	
Function isInternalLocalizationJapanese()->$isInternalLocalizationJapanese : Boolean
	
	$isInternalLocalizationJapanese:=("ja"=Get database localization:C1009(Internal 4D localization:K5:24))
	
Function isKeywordBuildingHashMecab()->$isKeywordBuildingHashMecab : Boolean
	
	var $catalog
	
	EXPORT STRUCTURE:C1311($catalog)
	
	$dom:=DOM Parse XML variable:C720($catalog)
	
	$find:=DOM Find XML element:C864($dom; "/base/base_extra[@__keywordBuildingHash=\"mecab:0.996;sys.dic:102;\"]")
	
	$isKeywordBuildingHashMecab:=(OK=1)
	
	DOM CLOSE XML:C722($dom)