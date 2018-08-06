installPython:
	sudo add-apt-repository -y ppa:deadsnakes/ppa
	sudo apt update
	sudo apt install python3.6 python3-pip -y
	sudo pip3 install -r ./requirements.txt
	
#Assumes that Python 3 64-bit is already installed, as well as PIP
setupPythonWindows:
	#installs dependency Windows takes issue with
	pip install ./lxml-4.2.3-cp37-cp37m-win_amd64.whl
	pip install ./requirements.txt

getAWSCred:
	python3 aws_saml_login.py --user $(AWS_USER) --password $(AWS_PASS) --token $(AWS_TOKEN) --idp iam.auckland.ac.nz

#python3 aws_saml_login.py --user $(AWS_USER) --idp iam.auckland.ac.nz
	
createHTML:
	python3 create_webpages.py --path www
	
syncChanges:
	aws --profile saml s3 sync www s3://r.docker.stat.auckland.ac.nz
