gen_bridge:
	docker network create -d bridge dip-bridge-network

setup_mongo:
	docker pull mongo:4.4.4
	docker create --name mongodb --network dip-bridge-network mongo:4.4.4 

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
	docker pull jonasal/nginx-certbot:2.0.0
	cd nginx ; \
		bash ./setup.sh ; \
		docker create -p 80:80 -p 443:443 \
           --env CERTBOT_EMAIL=tabilab.dip@gmail.com \
           -v $(pwd)/nginx_secrets:/etc/letsencrypt \
           -v $(pwd)/user_conf.d:/etc/nginx/user_conf.d:ro \
           --network dip-bridge-network \
           --name nginx jonasal/nginx-certbot:2.0.0

setup_clarin_tomcat:
	#TODO

setup_clarin_psql:
	#TODO

run_frontend:
	docker start demo-frontend

run_backend:
	docker start mongodb
	docker start backend-proxy

run_nginx:
	#TODO

run_clarin_tomcat:
	#TODO

run_clarin_psql:
	#TODO


