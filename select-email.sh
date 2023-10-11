#!/bin/bash
awk -F ',' '{print $1}' students-list_0923.txt
awk -F ',' '{print $1}' students-list_0923.txt >> student-emails.txt
