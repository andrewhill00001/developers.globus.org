.PHONY: all upload

all: upload

upload:
	aws s3 cp --recursive content/ s3://developers.globus.org/
