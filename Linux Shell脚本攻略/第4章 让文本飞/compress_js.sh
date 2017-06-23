#/bin/bash -xv

: '
cat sample.js
function sign_out() {
    /*这是一个注释*/
    $("#loading").show(  );

    $.get("log_in",{logout:"True"},

    function(   ){

        window.location="";

    }  );
}
任务目标:
移除换行符和制表符
压缩空格
替换注释/*内容*/
移除多余空格，如：将"{ "替换为"{"
需要执行的任务
用";\n" 替换 ";"
用"{\n" 替换 "{",  "\n}"替换"}"
'
# tr -d '\n\t' 移除\n\t
# tr -s ' ' 移除多余空格
# sed 's:/\*.*\*/::g' 移除注释，使用:作为定界符这样就不用对/进行转义了
# sed 's/ \?\([{}{};,:]\) \?/\1/g' 移除[{}{};,:]之前和之后的所有空格
cat sample.js | \
tr -d '\n\t' | tr -s ' ' \
| sed 's:/\*.*\*/::g' \
| sed 's/ \?\([{}{};,:]\) \?/\1/g'