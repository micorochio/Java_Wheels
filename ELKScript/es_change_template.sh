PUT _template/xxxx_template/
{
  "order": 0,
  "template": "jzsy*",
  "settings": {},
  "mappings": {
    "_default_": {
      "properties": {
        "stages": {
          "type": "nested",
          "properties": {
            "createTime": {
              "type": "date",
              "format": "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis"
            },
            "updateTime": {
              "type": "date",
              "format": "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis"
            },
            "nodes": {
              "type": "nested",
              "properties": {
                "properties": {
                  "type": "nested"
                }
              }
            }
          }
        }
      }
    }
  },
  "aliases": {}
}


PUT /_template/XXXX2_template
{
  "order": 0,
  "template": "code_flow_*",
  "mappings": {
    "_default_": {
      "dynamic_templates": [
        {
          "all_string_to_keyword": {
            "match_mapping_type": "string",
            "unmatch": [
              "address",
              "*Ip"
            ],
            "mapping": {
              "type": "keyword"
            }
          }
        },
        {
          "object_to_nested": {
            "match_mapping_type": "object",
            "mapping": {
              "type": "nested"
            }
          }
        }
      ],
      "properties": {
        "location": {
          "type": "geo_point"
        },
        "createTime": {
          "type": "date",
          "format": "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis"
        }
      }
    },
    "log": {
      "properties": {
        "currentOperationIp": {
          "type": "ip"
        }
      }
    },
    "codes": {
      "_parent": {
        "type": "log"
      }
    }
  },
  "aliases": {}
}