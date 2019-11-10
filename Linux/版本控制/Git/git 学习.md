> 之前二面被 git 问题卡住了，主要还是自己太菜，再回头学习一边，不做笔记回答时只记得：git commit、git pull、git push，场面一度尴尬！

# 分布式、集中式版本控制

git：本地有与"中央仓库"一样的代码及历史记录的信息，一旦服务器有问题，那么找一个最新的本地代码同步上去后，之前所有的提交历史记录还可以看到；

svn：所有人都将代码提交至“中央仓库”，一旦服务器有问题，就算找到一个最新的代码上去，也是只能以当前时间为节点作为新的项目去使用，之前所有的提交历史记录无法看到，对于处理历史遗留问题并不友好

Git本地仓库包含代码库还有历史库，在本地的环境开发就可以记录历史 而SVN的历史库存在于中央仓库，每次对比与提交代码都必须连接到中央仓库才能进行

这样的好处在于： 1、自己可以在脱机环境查看开发的版本历史 2、多人开发时如果充当中央仓库的Git仓库挂了，任何一个开发者的仓库都可以作为中央仓库进行服务


所有的版本控制系统，其实只能跟踪文本文件的改动，比如TXT文件，网页，所有的程序代码等等，Git也不例外。版本控制系统可以告诉你每次的改动，比如在第5行加了一个单词“Linux”，在第8行删了一个单词“Windows”。而图片、视频这些二进制文件，虽然也能由版本控制系统管理，但没法跟踪文件的变化，只能把二进制文件每次改动串起来，也就是只知道图片从100KB改成了120KB，但到底改了啥，版本控制系统不知道，也没法知道

Microsoft的Word格式是二进制格式，因此，版本控制系统是没法跟踪Word文件的改动的，前面我们举的例子只是为了演示，如果要真正使用版本控制系统，就要以纯文本方式编写文件

* <kbd>**git config**</kbd>
* <kbd>**git config -l**</kbd> - `git config --list` ，显示 system、global、local 配置
* <kbd>**git config --local --list**</kbd> - 显示当前仓库配置
* <kbd>**git config --global --list**</kbd> - 显示用户配置
* <kbd>**git config --system --list**</kbd> - 显示系统配置
* <kbd>**git config**</kbd> - 当前仓库配置
* <kbd>**git config --global**</kbd> - 修改 `~/.gitconfig` 配置文件，当前用户配置
* <kbd>**git config --system**</kbd> - 修改 `/etc/gitconfig` 配置文件，系统配置
* <kbd>**git config http.https://github.com.proxy socks5://127.0.0.1:1080**</kbd> - 配置 git github socks5 代理，执行 git 命令时只对 github 代理
* <kbd>**git config https.https://github.com.proxy socks5://127.0.0.1:1080**</kbd> - 配置 git github socks5 代理 
* <kbd>**git config --unset http.https://github.com.proxy**</kbd> - 取消 github git 代理
* <kbd>**git init**</kbd> - 初始化一个 git 仓库
* <kbd>**git init**</kbd> - 初始化一个 git 仓库
* <kbd>**git add \<file\>**</kbd> - 工作区把 file 添加到暂存区
* <kbd>**git add -u**</kbd> - 可以暂存 ( stage ) 工作区 modified、deleted 文件，但不能暂存 untracked 文件
 * <kbd>**git add --ignore-removal .**</kbd> - 可以暂存工作区 modified、untracked 文件，但不能暂存 deleted 文件
* <kbd>**git add .**</kbd> - git 2.0+ 版本中，和 `git add -A` 功能一样，可以暂存工作区 modified、deleted、untracked 文件
* <kbd>**git add -A**</kbd> - 暂存工作区所有文件变化 ( modified、deleted、untracked  )
* <kbd>**git commit -m \<message\>**</kbd> - 提交 ( commit ) 暂存区到本地仓库，message 是本次提交说明
* <kbd>**git status**</kbd> - 查看工作区和暂存区文件修改状态
* <kbd>**git status -s**</kbd> - `git status` 输出精简版
* <kbd>**git log**</kbd>  - 查看本地仓库 commit 记录
* <kbd>**git log --pretty=oneline**</kbd>  - 查看本地仓库 commit 记录及对应 commit ID，以单行形式展示
* <kbd>**git reflog**</kbd> - 可以查看所有分支对当前仓库的操作记录 ( commit / reset / checkout / merge / etc ) 以及操作的 commit ID ( 方便回退到某个操作时版本状态 )
* <kbd>**git ls-files**</kbd> - 查看暂存区文件
* <kbd>**git checkout -- \<file\>**</kbd> - **工作区撤销 file 修改**，工作区的 file 回退到最近一次 `git commit` 或 `git add` 时的状态
* <kbd>**git reset HEAD \<file\>**</kbd> -  **暂存区撤销 file 修改**，把暂存区内关于 file 的修改回退到工作区
* <kbd>**git reset --hard HEAD^**</kbd> - 本地仓库回退到上一次 commit 版本
* <kbd>**git reset --hard HEAD~5**</kbd> - 本地仓库回退到 5 次 commit 前版本
* <kbd>**git reset --hard \<commit_ID\>**</kbd> - 本地仓库跳到 commit_ID 对应的 commit 版本


* <kbd>**git add \<file\>**</kbd> - 工作区把 file 添加到暂存区
* <kbd>**git add -u**</kbd> - 可以暂存 ( stage ) 工作区 modified、deleted 文件，但不能暂存 untracked 文件
 * <kbd>**git add --ignore-removal .**</kbd> - 可以暂存工作区 modified、untracked 文件，但不能暂存 deleted 文件
* <kbd>**git add .**</kbd> - git 2.0+ 版本中，和 `git add -A` 功能一样，可以暂存工作区 modified、deleted、untracked 文件
* <kbd>**git add -A**</kbd> - 暂存工作区所有文件变化 ( modified、deleted、untracked )

* <kbd>**git diff file**</kbd> - 查看 file **工作区**和**暂存区**里的区别
* <kbd>**git diff HEAD -- file**</kbd> - 查看 file **工作区**和**本地仓库**里的区别
* <kbd>**git diff --cached**</kbd> - 查看已暂存未提交的内容，及查看**暂存区**和**本地仓库**里的区别

* <kbd>**git remote add origin git@github.com:username/reponame.git**</kbd> - 本地 reponame git 仓库关联远程 github 上的 reponame 仓库
* <kbd>**git push -u origin master**</kbd> - 第一次推送 master 分支
* <kbd>**git push origin master**</kbd> - 后续本地推送到远程仓库
* <kbd>**git branch**</kbd> - 显示所有分支和标记当前所在分支
* <kbd>**git branch -d \<branch\>**</kbd> - 删除 branch 分支 ( 在 branch 分支上是删除不了本分支的，需要先切换到其他分支 )
* <kbd>**git checkout <branch>**</kbd> - 切换到 branch 分支
* <kbd>**git checkout -b <branch>**</kbd> - 创建并切换到 branch 分支 
* <kbd>**git merge \<branch\>**</kbd> - 合并 branch 分支到当前分支
* <kbd>**git switch -c \<branch\>**</kbd> - 切换到 branch 分支，最新版切换分支方式
* <kbd>**git switch master**</kbd> - 切换到本地仓库的 master 主分支
* <kbd>****</kbd> - 
* <kbd>****</kbd> - 
* <kbd>****</kbd> - 
* <kbd>****</kbd> - 
* <kbd>****</kbd> - 
* <kbd>****</kbd> - 



Git跟踪并管理的是修改，而非文件

## 查看变更内容 - <kbd>**git diff**</kbd>

* <kbd>**git diff file**</kbd> - 查看 file **工作区**和**暂存区**里的区别
* <kbd>**git diff HEAD -- file**</kbd> - 查看 file **工作区**和**本地仓库**里的区别
* <kbd>**git diff --cached**</kbd> - 查看已暂存未提交的内容，及查看**暂存区**和**本地仓库**里的区别

``` shell
git diff t
diff --git a/t b/t
index f007ede..d09b7e1 100644
--- a/t
+++ b/t
@@ -1,4 +1,4 @@
 吃了吗
 吃了
 你吃了吗
-没吃
+我也吃了
```
* <kbd>diff --git a/t b/t</kbd> - 对比两个文件，其中 a 改动前，b 是改动后
* <kbd>iindex f007ede..d09b7e1 10064</kbd> - 两个版本的 git 哈希值，index 区域（ add 之后）的 f007ede 对象和工作区域的 d09b7e1 对象， `100` 表示普通文件，`644` 表示控制权限
* <kbd>--- a/t </kbd> - `---` 代表源文件  
* <kbd>+++ b/t </kbd> - `+++` 代表目标文件  
* <kbd>@@ -1,2 +1,5 @</kbd> - `@@` 表示文件变动描述合并显示的开始和结束，一般在变动前后多显示3行，其中-+表示变动前后，逗号前是起始行位置，逗号后为从起始行往后几行。合起来就是变动前后都是从第4行开始，变动前文件往后数8行对应变动后文件往后数9行
变动内容 ——+表示增加了这一行，-表示删除了这一行，没符号表示此行没有变动。

当git status告诉你有文件被修改过，用git diff可以查看修改内容

## 回退

* `HEAD` 指向当前版本，`HEAD^` 上一个版本，`HEAD~100` 之前 100 个的版本

### 版本回退 - <kbd>**git reset**</kbd>

``` shell
# 使用 git log --pretty=oneline 或 git log 可以查看 commit 日志及 commit ID
$ git log --pretty=oneline
14ab3268f5bda2287d04cd713e9df978b65bf381 create README
b61f11035eff9ca39acd7a8d98356b3060c5997d delete again README.md;
0e41957b5b5be1be7cabcffd09de3bf8ae297e60 modify README.md
6ed84a9599334f9e9632479860b2dfd038f6e2aa create test
9d0e11c192851639ccfba51436af852e6fd5a029 create README.md

# 使用 HEAD 回滚一次
$ git reset --hard HEAD^
$ git log --pretty=oneline
b61f11035eff9ca39acd7a8d98356b3060c5997d delete again README.md;
0e41957b5b5be1be7cabcffd09de3bf8ae297e60 modify README.md
6ed84a9599334f9e9632479860b2dfd038f6e2aa create test
9d0e11c192851639ccfba51436af852e6fd5a029 create README.md

# 使用 HEAD 回滚两次
git reset --hard HEAD~2
重置后撤出暂存区的变更：
D	README.md
$ git log --pretty=oneline
6ed84a9599334f9e9632479860b2dfd038f6e2aa create test
9d0e11c192851639ccfba51436af852e6fd5a029 create README.md

# 使用 commid ID 回到“未来”版本
$ git reset --hard 14ab
$ git log --pretty=oneline
14ab3268f5bda2287d04cd713e9df978b65bf381 create README
b61f11035eff9ca39acd7a8d98356b3060c5997d delete again README.md;
0e41957b5b5be1be7cabcffd09de3bf8ae297e60 modify README.md
6ed84a9599334f9e9632479860b2dfd038f6e2aa create test
9d0e11c192851639ccfba51436af852e6fd5a029 create README.md

# 使用 git reflog 查看各个版本的 commit ID 前 7 位，以供返回对应版本（ git reset commitID ）
 $ git reflog
14ab326 HEAD@{0}: reset: moving to 14ab
6ed84a9 HEAD@{1}: reset: moving to HEAD~2
b61f110 HEAD@{2}: reset: moving to HEAD^
14ab326 HEAD@{3}: reset: moving to 14ab3
0e41957 HEAD@{4}: reset: moving to HEAD^
b61f110 HEAD@{5}: reset: moving to HEAD^
14ab326 HEAD@{6}: commit: create README
b61f110 HEAD@{7}: commit: delete again README.md;
0e41957 HEAD@{8}: commit: modify README.md
6ed84a9 HEAD@{9}: commit: create test
9d0e11c HEAD@{10}: commit (initial): create README.md
```

### 修改回退- <kbd>**git checkout**</kbd> <kbd>**git reset**</kbd>

1. 工作区 file 修改的回退

* <kbd>**git checkout -- \<file\>**</kbd> 
* 工作区 file 修改撤销，**工作区的 file 回退到最近一次 `git commit` 或 `git add` 时的状态**
  * <kbd>上次 commit</kbd> -> <kbd>修改 file</kbd> -> <kbd>git checkout -- file</kbd> -> <kbd>file 回退到上次 commit</kbd>
  * <kbd>上次 commit</kbd> -> <kbd>修改 file</kbd> -> <kbd>git add file</kbd> -> <kbd>git checkout -- file</kbd> -> <kbd>file 回退到上一次 add 后状态</kbd>

2. 暂存区 file 修改的回退

* <kbd>**git reset HEAD \<file\>**</kbd>
* 暂存区 file 修改撤销，**把暂存区内关于 file 的修改全部回退到工作区**

###  删除回退

<kbd>**git rm file**</kbd> - 同时删除工作区和暂存区 file - <kbd>**还原：git reset HEAD file + git checkout file**</kbd>

<kbd>**rm file**</kbd> - 只删除工作区里的 file - <kbd>**还原：git checkout file**</kbd>

### 重命名回退

<kbd>**mv file file1**</kbd> - 只在工作区里重命名 file 为 file1 - <kbd>**还原：git checkout file + rm file1 -rf**</kbd>

<kbd>**git mv file file1**</kbd> - 同时重命名工作区和暂存区 file 为 file1 - <kbd>**还原：git reset HEAD file + git checkout file + rm file1 -rf**</kbd>

> * note: 重命名 file file1 = 删除 file + 新建 file1（ 和 file 内容相同 ）

## 案例实操

### 1. file 在工作区修改并 add 一次，之后又在工作区修改了，此时可以回退到上一次 add 状态，也可以回退到上一次 commit 状态

**工作区内操作文件 file 只要没 commit 都能回退到上次 commit 时的版本**

1. 没有 `git add` 时，用 `git checkout -- file`
2. 已经 `git add` 时，先 `git reset HEAD <file>` 回退到 1，再按 1 操作

``` shell
$ git status -s
$ cat test
你好
你也好
他也好
$ echo 'hello' > test
$ git add test
$ echo 'hello world!' > test
$ git status -s
MM test

# 此时工作区、暂存区和仓库内的 file 都不相同
# 工作区和暂存区比较
$ git diff test
diff --git a/test b/test
index ce01362..a042389 100644
--- a/test
+++ b/test
@@ -1 +1 @@
-hello
+hello world!
# 工作区和仓库比较
git diff HEAD -- test
diff --git a/test b/test
index f9132cb..a042389 100644
--- a/test
+++ b/test
@@ -1,3 +1 @@
-你好
-你也好
-他也好
+hello world!

### 回退还原
# 先回退暂存区与否无所谓，先退回暂存区比先退回工作区少一步操作而已
git reset HEAD test           # 回退暂存区
重置后取消暂存的变更：
M	test
$ git status -s
 M test
$ git checkout test              # 回退工作区
$ git status -s
$ cat test
你好
你也好
他也好
```

## 工作区、暂存区、本地仓库和远程仓库

* <kbd>**工作区**</kbd> -> <kbd>**git add**</kbd> - > <kbd>**暂存区**</kbd>  -> <kbd>**git commit**</kbd> -> <kbd>**本地仓库**</kbd> -> <kbd>**git push**</kbd> -> <kbd>**远程仓库**</kbd>
* `git init` 时默认创建了一个 master 分支，后续 `git commit`就是往 master 上提交



