trophic-graph-server
====================

Server hosting trophic graph data.

You can easily interact with an instance of this server by going to http://tinyurl.com/trophicgraph or http://ec2-50-112-48-206.us-west-2.compute.amazonaws.com:7474/webadmin/ . 

In addition, you can query the graph database through a REST interface. Please see the examples below on how to use cURL to query the trophic data.

Examples of using REST / Cypher / cURL to query data:


Example 1. Total number of specimen collected across all studies

curl -X POST -H Accept:application/json -H Content-Type:application/json -d '{"query": "START study = node:studies(\"*:*\") MATCH study-[:COLLECTED]->specimen RETURN count(specimen)"}' -v http://ec2-50-112-48-206.us-west-2.compute.amazonaws.com:7474/db/data/ext/CypherPlugin/graphdb/execute_query 

Example 2. Total number of classifications made across all studies

curl -X POST -H Accept:application/json -H Content-Type:application/json -d '{"query": "START study = node:studies(\"*:*\") MATCH study-[:COLLECTED]->specimen-[predatorClassifications:CLASSIFIED_AS]->taxon RETURN count(predatorClassifications)"}' -v http://ec2-50-112-48-206.us-west-2.compute.amazonaws.com:7474/db/data/ext/CypherPlugin/graphdb/execute_query 

Example 3. Total number of predator specimens that were classified as taxon that was matched against external taxonomy (WoRMS or NCBI at time of writing).

curl -X POST -H Accept:application/json -H Content-Type:application/json -d '{"query": "START study = node:studies(\"*:*\") MATCH study-[:COLLECTED]->specimen-[:CLASSIFIED_AS]->taxon WHERE has(taxon.externalId) RETURN count(specimen)"}' -v http://ec2-50-112-48-206.us-west-2.compute.amazonaws.com:7474/db/data/ext/CypherPlugin/graphdb/execute_query

Example 4. List of predator taxon name, and their related study, that did not match against an external taxonomy.

curl -X POST -H Accept:application/json -H Content-Type:application/json -d '{"query": "START study = node:studies(\"*:*\") MATCH study-[:COLLECTED]->specimen-[:CLASSIFIED_AS]->taxon WHERE not(has(taxon.externalId)) RETURN distinct taxon.name, study.title"}' -v http://ec2-50-112-48-206.us-west-2.compute.amazonaws.com:7474/db/data/ext/CypherPlugin/graphdb/execute_query  
