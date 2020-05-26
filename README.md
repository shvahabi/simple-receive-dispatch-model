# Model for Simple Receive Dispatch

## Introduction
This repository is the Model module in an MVC architecture; a SQL representation of some ERD, prepared to work with two other repositories, naming:
- [Controller](https://github.com/shvahabi/simple-receive-dispatch-controller) module
- [View](https://github.com/shvahabi/simple-receive-dispatch-view) module

## Dependencies
[H2 RDBMS](https://www.h2database.com) is required to run this repository.

## Instructions
By following this step-by-step instructions, you will set up a working relational database which interacts with above Controller repository:
- $ `git clone https://github.com/shvahabi/simple-receive-dispatch-model.git`
- $ `cd simple-receive-dispatch-model/`
- $ `java -cp ~/path/to/h2RDBMS/bin/h2*.jar org.h2.tools.Server -ifNotExists`
- click on start browser if it does not open automatically
- in presented Html form provide a DB path, username and password to be used in Controller module repository mentioned above
- test connection, if succeeded then connect
- copy, past and run contents of sqlsnippets.sql in DBMS admin page

## Release Notes
Version 0.40.1 the stable successor, with only several bugfixes and 1 hotfix, to what showcased through Skype on April 21st 2020 to Inception team members.
