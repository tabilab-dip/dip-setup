setup_backend:
	docker run mongo
	cd backend-proxy ; \
	bash ./setup.sh ; \
	cd backend-proxy ; \
	docker build -t backend-proxy . ; \
	docker run --name backend-proxy -p 5000:5000 -d backend-proxy ; \

setup_frontend:
	cd demo-frontend ; \
	bash ./setup.sh ; \
	cd demo-frontend ; \
	docker build -t demo-frontend . ; \
	docker run --name demo-frontend -p 3000:3000 -d demo-frontend ;
	