#!/bin/bash
#自己写一个推送代码的脚本，利用刚学的知识
echo "push start!"
#推送工作流 
#一共由三个阶段：工作目录——暂存区（Index，保存临时改动）——HEAD（最后一次提交的结果） 
#->git add <filename>或者git add *自动判断添加哪些文件，添加文件至暂存区。可以多次反复使用，添加多个文件。 
#->git commit -m "代码提交信息（更新日志等）"提交文件至HEAD。 
#->git push origin master提交文件至远端仓库master分支（可改）。

#那么首先运行脚本的情况是在仓库目录，那么就不用判断是否有目录了，但是要判断下当前目录是否创建了仓库
isRepo=$(ls -a | grep .git)
git=".git"

#if[ $isRepo != $git ]
if test $isRepo != ".git";
then
	echo "This dir is not git repositories!"
 	exit 1
fi

#要先检查，pull一下，和远程仓库对比是否相同，不然如果远程修改了就推不上去了。
echo "check the remote repo "
git pull

echo "begin add file to cache!"
git add *
echo "Enter your message for this commit:"
read message_commit
git commit -m $message_commit
#提交到主分支
git push origin master
exit 0
