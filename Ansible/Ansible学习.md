# Ansible 学习笔记

* Tasks：任务，由模板定义的操作列表
* Variables：变量
* Templates：模板，即使用模板语法的文件
* Handlers：处理器 ，当某条件满足时，触发执行的操作
* Roles：角色

> * Playbooks contain plays
> * Plays contain tasks
> * Tasks call modules, tasks run sequentially
> * Handlers are triggered by tasks

## [Control node](https://docs.ansible.com/ansible/latest/user_guide/basic_concepts.html#id1)

Any machine with Ansible installed

## [Managed nodes](https://docs.ansible.com/ansible/latest/user_guide/basic_concepts.html#id2)

The network devices (and/or servers) you manage with Ansible. 

## [Inventory](https://docs.ansible.com/ansible/latest/user_guide/basic_concepts.html#id3)

* A list of managed nodes. An inventory file is also sometimes called a “hostfile”. 

* default location: `/etc/ansible/hosts`

* specify a different inventory file at the command line using the `-i <path> ` option
* you can also use multiple inventory files at the same time, and/or pull inventory from dynamic or cloud sources or different formats (YAML, ini, etc)
* The most common formats are **INI** and **YAML**

## [Modules](https://docs.ansible.com/ansible/latest/user_guide/basic_concepts.html#id4)

* The units of code Ansible executes.

* Ansible 自带的模块都是用 Python 编写的，但实际上可以使用任何语言编写模块

## [Tasks](https://docs.ansible.com/ansible/latest/user_guide/basic_concepts.html#id5)

The units of action in Ansible.

## [Playbooks](https://docs.ansible.com/ansible/latest/user_guide/basic_concepts.html#id6)

Ordered lists of tasks, saved so you can run those tasks in that order repeatedly. 

<kbd>**ANSIBLE_CONFIG**</kbd> > <kbd>**./ansible.cfg**</kbd> > <kbd>**~/.ansible.cfg**</kbd> > <kbd>**/etc/ansible/ansible.cfg**</kbd> 

Ansible will read ANSIBLE_CONFIG, ansible.cfg in the current working directory, .ansible.cfg in the home directory or /etc/ansible/ansible.cfg, whichever it finds first



<kbd>**ansible \<操作目标\>  -m \<模块名\> -a \<模块参数\>**</kbd>

