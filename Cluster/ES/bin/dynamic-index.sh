#!/bin/bash
## 动态信息库person 表的映射
##curl -XDELETE 's100:9200/dynamic?pretty'  -H 'Content-Type: application/json'
curl -XPUT 's100:9200/dynamic?pretty' -H 'Content-Type: application/json' -d'
{
    "settings": {
	    "number_of_shards":5,
        "number_of_replicas":1,
        "analysis": {
            "filter": {
                "trigrams_filter": {
                    "type":     "ngram",
                    "min_gram": 2,
                    "max_gram": 20
                }
            },
            "analyzer": {
                "trigrams": {
                    "type":      "custom",
                    "tokenizer": "standard",
                    "filter":   [
                        "lowercase",
                        "trigrams_filter"
                    ]
                },
                "ik": {
                    "tokenizer" : "ik_max_word"
                }
            }
        }
    },
    "mappings": {
         "person": {
         		"properties": {
         			"ftpurl": {
         				"type": "text"
         			},
         			"eyeglasses": {
         				"type": "long"
         			},
         			"gender": {
         				"type": "long"
         			},
         			"haircolor": {
         				"type": "long"
         			},
         			"hairstyle": {
         				"type": "long"
         			},
         			"hat": {
         				"type": "long"
         			},
         			"huzi": {
         				"type": "long"
         			},
         			"tie": {
         				"type": "long"
         			},
         			"ipcid": {
         				"type": "text",
         				"fields": {
         					"keyword": {
         						"type": "keyword"
         					}
         				}
         			},
         			"timeslot": {
         				"type": "long"
         			},
         			"date": {
         				"type": "text"
         			},
         			"exacttime": {
         				"type": "date",
         				"format": "yyyy-MM-dd HH:mm:ss"
         			},
         			"searchtype": {
         				"type": "text"
         			},
         			"clusterid": {
         				"type": "text"
         			},
         			"alarmid": {
         				"type": "long"
         			},
         			"alarmtime": {
                    	"type": "text",
                    	"fields": {
                    		"keyword": {
                    			"type": "keyword"
                    		}
                    	}
                    }
         		}
         	}
        }
    }'

curl -XPUT 's100:9200/dynamic/_settings' -d '{
    "index": {
        "max_result_window": 1000000000
    }
}'
