+++
title = "{{ .Name | replaceRE "^[0-9]{8}-" "" | replaceRE "-" " " | title }}"
date = {{ .Date }}
draft = true
categories = []
tags = []
+++

