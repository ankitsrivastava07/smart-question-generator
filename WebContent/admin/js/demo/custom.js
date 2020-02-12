function showOptions(obj){
	var questionType=$(obj).val();
	if(questionType=="mcq"){
		$(".options").show();
	}else{
		$(".options").hide();
	}
}