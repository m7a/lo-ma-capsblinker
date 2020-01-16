---
section: 11
x-masysma-name: ma_capsblinker
title: Capsblinker
date: 2020/01/16 22:31:25
lang: en-US
author: ["Linux-Fan, Ma_Sys.ma (Ma_Sys.ma@web.de)"]
keywords: ["programs", "ada", "capsblinker", "linux"]
x-masysma-version: 2.1.0
x-masysma-repository: https://www.github.com/m7a/lo-ma-capsblinker
x-masysma-owned: 1
x-masysma-copyright: |
  Copyright (c) 2020 Ma_Sys.ma.
  For further info send an e-mail to Ma_Sys.ma@web.de.
---
Name
====

ma_capsblinker and ma_capsblinker_shell -- make caps lock blink.

Synopsis
========

	ma_capsblinker LED
	ma_capsblinker_shell DEVICE

Description
===========

Ma_Sys.ma Capsblinker allows any of the keyboard's LEDs to be turned on and off
at a regular interval. This does not influence the actual state of the
associated key function and can thus serve as a general status indicator if the
regular function of the LED is not needed (e. g. today, few people use caps lock
and scoll lock LEDs).

The purpose of this proram is to serve as a GUI-independent indicator of the
computer running. For GUI usage, a displayed clock can be enough for the same
purpose or alternatively [progress(32)](../32/progress.xhtml) programs are
available.

Examples
========

Find out all possible LEDs (not all of them always work, the keyboards' seem to
work most often except for some timing issues):

	ls /sys/class/leds

Run the capsblinker for the first input device (one of the keyboards...)

	ma_capsblinker input0::capslock

Finally, to run the capsblinker as a service, set it up like this:

	systemctl enable masysma-capsblinker.service
	systemctl start masysma-capsblinker.service

Compilation
===========

To compile this program, an Ada compiler is needed e. g. as provided by Debian
package `gnat`. Additionally, the `ant` build tool is needed and can then be
invoked by running `ant`. To build a Debian package (with the necessary
dependencies installed), use `ant package`.
