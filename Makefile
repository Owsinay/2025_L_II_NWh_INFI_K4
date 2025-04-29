docker_build:
	docker build -t hello-world-printer .
USERNAME=Owsinay
TAG=$(USERNAME)/hello-world-printer

docker_push: docker_build
	@docker login --username $(USERNAME) --password-stdin $${DOCKER_PASSWORD}; \
	docker tag hello-world-printer $(TAG); \
	docker push $(TAG); \
	docker logout;
deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt   
lint:
	flake8 hello_world test 
run:
	python main.py
test1:
	PYTHONPATH=. py.test --verbose -s
