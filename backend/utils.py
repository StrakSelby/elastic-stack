from pprint import pprint
from elasticsearch import Elasticsearch
import time

"""
-> Elasticsearch: This is a type hint indicating that 
the function will return an object of type Elasticsearch.
"""
def get_es_client(max_entries: int = 1, sleep_time: int = 0) -> Elasticsearch:
    i = 0
    while i < max_entries:
        try:
            es = Elasticsearch('http://localhost:9200')
            # es = Elasticsearch('http://es01:9200')
            pprint('Connected to Elasticsearch cluster')
            return es
        except Exception as e:
            pprint(f'Error connecting to cluster {e}')
            time.sleep(sleep_time)
    raise ConnectionError('Could not connect to cluster after multiple retries')

