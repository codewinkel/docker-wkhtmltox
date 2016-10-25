#
# Makefile to test that every requirement is installed.
#
# Author: Mike Winkelmann <mikedotwinkelmann@gmail.com>
#

inliner.test:
	inliner -V

mustache.test:
	mustache -v

wkhtmltopdf.test:
	wkhtmltopdf -V
