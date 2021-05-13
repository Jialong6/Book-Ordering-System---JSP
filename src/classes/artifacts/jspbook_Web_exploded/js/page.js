

function PageTop(){
   var jumpurl=formpage.jumpurl.value;
   var page=parseInt(formpage.page.value);
 if(page<=1){
    alert("Get the first page");
  }else{
   	formpage.action=jumpurl+"page=1";
    formpage.submit();
  }
}
function PageLast(){
   var jumpurl=formpage.jumpurl.value;
   var page=parseInt(formpage.page.value);
  var pageCount=parseInt(formpage.pageCount.value);
  if(page>=pageCount){
    alert("Util the last page");
  }else{
   if(formpage.pageCount.value==0){//if 0 pages in total, then the last page is 1 instead of zero
    formpage.action=jumpurl+"page=1";
    formpage.submit();
	}else{
	formpage.action=jumpurl+"page="+formpage.pageCount.value;
    	formpage.submit();
	}
  }
}

//last page
function PagePre(){
   var jumpurl=formpage.jumpurl.value;
  var page=parseInt(formpage.page.value);
  if(page<=1){
    alert("In first page");
  }else{
    formpage.action=jumpurl+"page="+(page-1);
    formpage.submit();
  }
}

function PageNext(){
   var jumpurl=formpage.jumpurl.value;
  var page=parseInt(formpage.page.value);
  var pageCount=parseInt(formpage.pageCount.value);
  if(page>=pageCount){
    alert("In last page");
  }else{
    formpage.action=jumpurl+"page="+(page+1);
    formpage.submit();
  }
}
function bjump(){
   var jumpurl=formpage.jumpurl.value;
  	var pageCount=parseInt(formpage.pageCount.value);
  	if( fIsNumber(formpage.busjump.value,"1234567890")!=1 ){
		alert("Only accept numbers in jump text!");
		formpage.busjump.select();
		formpage.busjump.focus();
		return false;
	}
	
	if(formpage.busjump.value>pageCount){//if the jump input exceeds the last page, then jump to the last page
		  if(pageCount==0){	
			  formpage.action=jumpurl+"page=1";
			  formpage.submit();
		  }else{
			formpage.action=jumpurl+"?page="+pageCount;
			formpage.submit();
		  }
    }else if(formpage.busjump.value<=pageCount){
			var page=parseInt(formpage.busjump.value);
			   if(page==0){
				  page=1;// if user input 0, then set it to 1
				  formpage.action=jumpurl+"page="+page;
				  formpage.submit();
			   }else{
				  formpage.action=jumpurl+"page="+page;
				  formpage.submit();
			   }

	  }

}


//**** determine whether a number or not.
function fIsNumber (sV,sR){
var sTmp;
if(sV.length==0){ return (false);}
for (var i=0; i < sV.length; i++){
sTmp= sV.substring (i, i+1);
if (sR.indexOf (sTmp, 0)==-1) {return (false);}
}
return (true);
}