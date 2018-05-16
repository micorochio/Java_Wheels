GET index*/_search
{
  "_source": [
    "productId",
    "companyId",
    "createTime",
    "location"
  ],
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
            "productId.keyword": "3"
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
  "sort": [
    {
      "createTime": {
        "order": "desc"
      }
    }
  ],
  "from": 0,
  "size": 5000
}

