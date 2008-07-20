#!/bin/bash          
nohup rake db:migrate ENV=production &
