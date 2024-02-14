import 'dart:convert';

void main() {
  // Your JSON data as a string
  String jsonString = '''
  {
    "status": "success",
    "message": "Successfully",
    "paginate": null,
    "const": null,
    "loginType": "main-system",
    "data": {
        "carInsurance": "",
        "act": [
            {
                "docType": "พรบภาษี",
                "company": "บริษัทประกันภัยไทยรุ่งเรือง",
                "docNumber": null,
                "contact": "-",
                "creditLimit": 763360
            },
            {
                "docType": "พรบคดีความ",
                "company": "บริษัทประกันภัยเจนเนอรัล",
                "docNumber": null,
                "contact": "-",
                "creditLimit": 1
            },
            {
                "docType": "พรบ รถยนต์",
                "company": "บริษัทประกันภัยไทยอมรินทร์",
                "docNumber": null,
                "contact": "-",
                "creditLimit": 5114
            }
        ],
        "productInsurance": [
            {
                "docType": "กรมธรรม์ประกันภัยขนส่งสินค้าทางบก",
                "company": "-",
                "docNumber": "autem",
                "contact": "-",
                "creditLimit": 74.86
            }
        ],
        "wetProductInsurance": [
            {
                "docType": "กรมธรรม์ประกันภัยขนส่งสินค้าทางบก",
                "company": "-",
                "docNumber": "autem",
                "contact": "-",
                "creditLimit": 1139.36
            }
        ],
        "permission": [
            {
                "docType": "ใบอนุญาตขับรถประเภทรถยนต์ประจำทาง",
                "company": "-",
                "docNumber": "12345",
                "contact": "-",
                "creditLimit": "-"
            },
            {
                "docType": "ใบอนุญาตขับรถประเภทรถยนต์ส่วนบุคคล",
                "company": "-",
                "docNumber": "123123",
                "contact": "-",
                "creditLimit": "-"
            },
            {
                "docType": "ใบอนุญาตขับรถประเภทรถขนส่งสากล",
                "company": "-",
                "docNumber": "123123",
                "contact": "-",
                "creditLimit": "-"
            }
        ],
        "passport": "",
        "tax": [
            {
                "docType": "ผู้ชำระภาษีบุคคลธรรมดา",
                "company": "-",
                "docNumber": "978",
                "contact": "-",
                "creditLimit": "-"
            },
            {
                "docType": "ผู้ชำระภาษีบุคคลธรรมดา",
                "company": "-",
                "docNumber": "6700",
                "contact": "-",
                "creditLimit": "-"
            },
            {
                "docType": "ผู้ชำระภาษีบุคคลธรรมดา",
                "company": "-",
                "docNumber": "61212107",
                "contact": "-",
                "creditLimit": "-"
            }
        ],
        "certificate": [
            {
                "docType": "ใบประกอบการขนส่งสินค้าทางบก",
                "company": "-",
                "docNumber": "consequatur",
                "contact": "-",
                "creditLimit": "-"
            }
        ]
    }
}
  ''';

  Map<String, dynamic> jsonData = json.decode(jsonString);
  Map<String, dynamic> data = jsonData['data'];
  
  List<String> companies = [];

  data.forEach((key, value) {
    if (value is List) {
      for (var item in value) {
        companies.add(item['docNumber'] != null ? item['docNumber'] : 'xxx');
      }
    }
  });

  print("$companies");
}
