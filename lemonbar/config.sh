#!/bin/sh

WORKSPACE="%{A:wmctrl -s \1:} %{A}"
WORKSPACE_CURRENT=" "

POWER="%{A:oblogout:}    %{A}"
