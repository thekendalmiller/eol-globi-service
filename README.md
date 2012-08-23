trophic-graph-server
====================

server hosting trophic graph data

Examples of using REST / Cypher / cURL to query data:


Example 1. Total number of specimen collected across all studies

curl -X POST -H Accept:application/json -H Content-Type:application/json -d '{"query": "START study = node:studies(\"*:*\") MATCH study-[:COLLECTED]->specimen RETURN count(specimen)"}' -v http://ec2-50-112-48-206.us-west-2.compute.amazonaws.com:7474/db/data/ext/CypherPlugin/graphdb/execute_query 

Example 2. Total number of classifications made across all studies

curl -X POST -H Accept:application/json -H Content-Type:application/json -d '{"query": "START study = node:studies(\"*:*\") MATCH study-[:COLLECTED]->specimen-[predatorClassifications:CLASSIFIED_AS]->taxon RETURN count(predatorClassifications)"}' -v http://ec2-50-112-48-206.us-west-2.compute.amazonaws.com:7474/db/data/ext/CypherPlugin/graphdb/execute_query 
