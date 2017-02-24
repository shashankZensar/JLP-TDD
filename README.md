# JLP-TDD
JLP Assignment for TDD

Project aritecture

<b>Model Layer : </b>

<b>Product Grid Page</b>

Price - Model for Price of Product
ProductInfo - Model for Product information
ProductInfoManager - Parse The data get from Server map in product Info Object

<b>Product Detail Page</b>

ProductDetailInfo - Model for Product Detail Info
ProductDetailInfoManager - Parse The data get from Server map in product Info Object

<b>ViewController Layer :</b>

<b>Product Grid Page</b>
PageGridViewController - Controller communicate to ProductInfoManager for data gathering from server. Handle task to manage data for the display of dish washer list.   

<b>Product Detail Page</b>
ProductPageController - Controller communicate to ProductDetailInfoManager for data gathering from server. Handle task to manage the display of product detail.

<b>Network Layer</b>
NetWorkManager - Network manager handle server request and response.



