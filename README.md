# How to run and deploy this project 

### Testing environment (frontend)
Run this script to start elastic search container, Make sure you have docker install on your system. [install docker](https://docs.docker.com/get-started/get-docker/)
```
./dev_elasticsearch.sh
```
Navigate to the frontend directory to install vuejs depandancy Make sure you install vuejs. [install vuejs](https://cli.vuejs.org/guide/installation.html)
```
npm install
```
To start the frontend project, vuejs will run on http://localhost:8080.
```
npm run serve
```
### Testing environment (backend)

Setup python virtual environment and installig dependancies (on Windows). 
```
python -m venv .venv
```
To activate the virtual environment 
```
 cd .\.venv\Scripts\   
```
```
.\activate
```
Setup python virtual environment and installig libraries (on Linux). 
```
sudo apt update
sudo apt install -y python3 python3-pip
sudo apt install -y python3-venv
python3 -m venv .venv
```
To activate the virtual environment 
```
source .venv/bin/activate
```
Install python libraries inside virtual environment.
```
pip install -r requirements.txt (on Windows)
pip3 install -r requirements.txt (on Linux)
```
#### more about python virtual environment [python documentation](https://docs.python.org/3/library/venv.html).
To start the backend project.
```
fastapi dev main.py
```
### Deploy to docker container
To deploy to docker containers run docker compose.
```
docker compose up -d
```
To indexing the indices to elasticsearch.
```
docker exec -it <python container id>
cd backend
python index_data.py
python index_data_raw.py
python index_data_embedding.py
```
To access to container.
```
http://localhost:8080 <frontend container>
http://localhost:9200 <elasticsearch container>
http://localhost:5601 <kibana container>
```