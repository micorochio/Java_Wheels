GET index*/_search
{
  "size": 0,
  "query": {
    "bool": {
      "must": [
        {
          "match": {
            "companyId.keyword": "1031"
          }
        },
        {
          "match": {
            "productId.keyword": "46"
          }
        }
      ],
      "filter": {
        "range": {
          "createTime": {
            "gte": "2018-02-13T11:58:06.768Z",
            "lte": "2018-04-30T11:58:06.768Z"
          }
        }
      }
    }
  },
  "aggs": {
    "top_10_city": {
      "terms": {
        "field": "city.keyword",
        "size": 12,
        "order": {
          "_count": "asc"
        }
      }
    }
  }
}