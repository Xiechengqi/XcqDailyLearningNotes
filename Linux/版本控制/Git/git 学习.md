

# Git 学习笔记



## 【参考】

> * [常用 Git 命令清单](https://www.hi-linux.com/posts/60426.html)
>
> * [Git 简明指南](https://www.hi-linux.com/posts/3337.html)
>
> * [图解Git](http://marklodato.github.io/visual-git-guide/index-zh-cn.html)
> * [Github 帮助](https://help.github.com/cn)
> * [Git 官方文档](https://book.git-scm.com/)

## 常用命令

> * Workspace：工作区
> * Index / Stage：暂存区
> * Repository：仓库区（或本地仓库）
> * Remote：远程仓库

![](/home/xcq/桌面/codeLearn/git/github/XcqDailyLearningNotes/Linux/images/git_command.png)



* <kbd>**git init**</kbd> - 初始化当前目录没 git 仓库
* <kbd>**git init [RepName]**</kbd> - 新建一个目录 RepName，并将其初始化为 git 本地仓库
* <kbd>**git clone [url]**</kbd> - 下载一个项目和它的整个代码历史

* <kbd>**git config**</kbd>- 修改 `./.git/config` 配置文件，当前仓库配置，相同配置会覆盖用户和系统配置
* <kbd>**./.git/config**</kbd> - 在 git 仓库目录下执行该命令，同 `git config`
* <kbd>**git config --global**</kbd> - 修改 `~/.gitconfig` 配置文件，当前用户配置，会覆盖系统配置
* <kbd>**git config --system**</kbd> - 修改 `/etc/gitconfig` 配置文件，系统配置

* <kbd>**git config -l[--list]**</kbd> - 显示 system、global、local 配置
* <kbd>**git config --local --list**</kbd> - 显示当前仓库配置
* <kbd>**git config --global --list**</kbd> - 显示用户配置
* <kbd>**git config --system --list**</kbd> - 显示系统配置
* <kbd>**git config [--global] user.name "[name]"**</kbd> - 设置提交代码时的用户名
* <kbd>**git config [--global] user.email "[email]"**</kbd> - 设置提交代码时的用户邮箱
* <kbd>**git config [--global] http.https://github.com.proxy socks5://127.0.0.1:1080**</kbd> - 配置 git github socks5 代理，执行 git 命令时只对 github 代理
* <kbd>**git config [--global] https.https://github.com.proxy socks5://127.0.0.1:1080**</kbd> - 配置 git github socks5 代理 
* <kbd>**git config --unset http.https://github.com.proxy**</kbd> - 取消 github git 代理
* <kbd>**git add \<file\>**</kbd> - 工作区把 file 添加到暂存区
* <kbd>**git add -u**</kbd> - 可以暂存 ( stage ) 工作区 modified、deleted 文件，但不能暂存 untracked 文件
 * <kbd>**git add --ignore-removal .**</kbd> - 可以暂存工作区 modified、untracked 文件，但不能暂存 deleted 文件
* <kbd>**git add .**</kbd> - git 2.0+ 版本中，和 `git add -A` 功能一样，可以暂存工作区 modified、deleted、untracked 文件
* <kbd>**git add -A**</kbd> - 暂存工作区所有文件变化 ( modified、deleted、untracked  )
* <kbd>**git rm \<file\>**</kbd> - 同时删除工作区和暂存区 file
* <kbd>**git mv \<file1\> \<file2\>**</kbd> - 在工作区和暂存区同时重命名 file1 为 file2
* <kbd>**git commit -m \<message\>**</kbd> - 提交 ( commit ) 暂存区到本地仓库，message 是本次提交说明
* <kbd>**git commit -a -m \<message\>**</kbd> - 会自动暂存 modified、deleted，但不会暂存 untracked 文件，然后 commit
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


* <kbd>**git diff file**</kbd> - 查看 file **工作区**和**暂存区**里的区别
* <kbd>**git diff HEAD**</kbd> - 查看工作区与当前分支最新commit之间的差异
* <kbd>**git diff HEAD -- file**</kbd> - 查看文件 file **工作区**和**当前本地仓库**之间的差异
* <kbd>**git diff --cached**</kbd> - 查看已暂存未提交的内容，及查看**暂存区**和**本地仓库**里的区别
* <kbd>**git remote add origin git@github.com:username/reponame.git**</kbd> - 本地 git 仓库关联 github 上的仓库
* <kbd>**git remote -v**</kbd> - 查看当前远程仓库版本
* <kbd>**git push -u origin master**</kbd> - 第一次推送 master 分支
* <kbd>**git push origin master**</kbd> - 后续本地推送到远程仓库
* <kbd>**git fetch origin master:temp**</kbd> - 从远程的 origin 仓库的 master 分支下载到本地，并新建一个 temp 分支
* <kbd>**git pull**</kbd> - 合并远程仓库到当前本地仓库分支
* <kbd>**git pull origin master**</kbd> - 拉取远程仓库 origin/master 分支合并到本地仓库当前分支
* <kbd>**git pull origin dev**</kbd> - 拉取远程仓库 origin/dev 分支合并到本地仓库当前分支
* <kbd>**git branch**</kbd> - 显示所有分支和用 `*` 标记当前所在分支
* <kbd>**git branch -r**</kbd> - 列出所有远程分支
* <kbd>**git branch -a**</kbd> - 列出所有本地分支和远程分支
* <kbd>**git branch**</kbd>
* <kbd>**git branch -d \<branch\>**</kbd> - 删除 branch 分支 ( 在 branch 分支上是删除不了本分支的，需要先切换到其他分支 )
* <kbd>**git checkout \<branch\>**</kbd> - 切换到 branch 分支，并更新工作区
* <kbd>**git checkout -**</kbd> - 切换到上一分支
* <kbd>**git branch \<newbrach\>**</kbd> - 新建一个 newbranch 分支，但依旧停在当前分支
* <kbd>**git checkout -b \<newbranch\>**</kbd> - 创建并切换到 newbranch 分支 
* <kbd>**git merge \<branch\>**</kbd> - 合并 branch 分支到当前分支
* <kbd>**git cherry-pick \<commit_ID\>**</kbd> - 选择一个commit，合并进当前分支
* <kbd>**git switch -c \<branch\>**</kbd> - 切换到 branch 分支，最新版切换分支方式
* <kbd>**git switch master**</kbd> - 切换到本地仓库的 master 主分支
* <kbd>****</kbd> - 
* <kbd>****</kbd> - 
* <kbd>****</kbd> - 
* <kbd>****</kbd> - 
* <kbd>****</kbd> - 
* <kbd>****</kbd> - 





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



### 2. 更新本地仓库至最新改动

方法一、`git merge`

* 如果远程仓库分支和本地仓库当前分支都修改了同一文件的同一位置（都修改了同一文件是可以的），这就会导致 merge 失败，需要手动修改远

  程或本地其一

``` shell
$ git fetch origin master:temp
来自 github.com:Xiechengqi/wiki
 * [新分支]          master     -> temp
$ git diff temp    # 查看当前分支 master 和 temp 分支的不同
diff --git a/index.md b/index.md
deleted file mode 100644
index c0cd5ef..0000000
--- a/index.md
+++ /dev/null
@@ -1,3 +0,0 @@
-# 目录
-
-* [hello world](./hello.md)
diff --git a/index.rst b/index.rst
new file mode 100644
index 0000000..42cee67
--- /dev/null
+++ b/index.rst
@@ -0,0 +1,20 @@

$ git merge temp       # 合并 temp 到当前分支 master
更新 7df7451..36ce930
Fast-forward
 index.md  |  3 +++
 index.rst | 20 --------------------
 2 files changed, 3 insertions(+), 20 deletions(-)
 create mode 100644 index.md
 delete mode 100644 index.rst

$ git brach -d temp       # 删除 temp 分支
```

方法二、`git pull`

``` shell
# 在本地仓库执行 git pull，便自动更新你的本地仓库至最新改动
$ git pull
```



## 工作区、暂存区、本地仓库和远程仓库

* <kbd>**工作区**</kbd> -> <kbd>**git add**</kbd> - > <kbd>**暂存区**</kbd>  -> <kbd>**git commit**</kbd> -> <kbd>**本地仓库**</kbd> -> <kbd>**git push**</kbd> -> <kbd>**远程仓库**</kbd>
* `git init` 时默认创建了一个 master 分支，后续 `git commit`就是往 master 上提交



