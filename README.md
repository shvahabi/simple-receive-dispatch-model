# Model for Simple Receive Dispatch

## Introduction
This repository is the Model module in an MVC architecture; a SQL representation of some ERD, prepared to work with two other repositories, naming:
- Controller module: https://github.com/shvahabi/simple-receive-dispatch-controller
- View module: https://github.com/shvahabi/simple-receive-dispatch-view

## Dependencies
H2 RDBMS is required to run this repository.

## Instructions
By following this step by step instructions, you will set up a working relational database which accepts transctions from above Controller repository:

- $ `git clone https://github.com/shvahabi/simple-receive-dispatch-model.git`
- $ `cd simple-receive-dispatch-model/`
- $ `java -cp ~/path/to/h2RDBMS/bin/h2*.jar org.h2.tools.Server -ifNotExists`
- click on start browser if it does not open automatically
- provide a path, username and password to be used in Controller module repository mentioned above
- test connection, if succeeded then connect
- copy, past and run contents of sqlsnippets.sql

## Release Notes
Version 0.40.0 the stable successor, with only several bugfixes, to what showcased by Skype on April 21st 2020 to Inception team members.
