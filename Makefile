setup_mongo:
	docker pull mongo:4.4.4
	docker create --name mongodb mongo:4.4.4 

setup_mongo:
	pull_mongo
	cd backend-proxy ; \
		bash ./setup.sh ; \
		cd backend-proxy ; \
		docker build -t backend-proxy . ; \
		docker create --name backend-proxy \
			--network dip-bridge-network \
			backend-proxy

setup_frontend:
	cd demo-frontend ; \
		bash ./setup.sh ; \
		cd demo-frontend ; \
		docker build -t demo-frontend . ; \
		docker create --name demo-frontend \
			--network dip-bridge-network \
			demo-frontend

setup_nginx:
	#TODO

setup_clarin_tomcat:
	#TODO

setup_clarin_psql:
	#TODO

gen_bridge:
	docker network create -d bridge dip-bridge-network

run_frontend:
	docker start demo-frontend

run_backend:
	docker start mongodb
	docker start backend-proxy

