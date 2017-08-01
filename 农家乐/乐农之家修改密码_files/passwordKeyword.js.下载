
function isCheckPassword(password){ 
	var passwordKeyword = "'| and |or |exec |execute |insert |select |delete |update |count |chr |mid |master |truncate |" +
    "char |declare |sitename |net user|xp_cmdshell|+|like'|insert |create |drop |" +
    "table |from |grant |use |group_concat|column_name|" +
    "information_schema.columns|table_schema|union |where |order |by |count |" +
    "--|like |../|(|[";
	
	 var badStrs = passwordKeyword.split("|");
     for (var i = 0; i < badStrs.length; i++) {
    	 //alert(password+"--"+badStrs[i])
         if (password.indexOf(badStrs[i].trim()) >= 0) {
             return true;
         }
     }
     return false;

} 
