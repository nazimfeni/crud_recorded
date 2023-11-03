import 'package:crud_recorded/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RestAPI/RestClient.dart';

class ProductCreateScreen extends StatefulWidget {
  // const ProductCreateScreen({Key? key}) : super(key: key);

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  Map<String, String> FormValue = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": " ",
    "TotalPrice": "",
    "UnitPrice": ""
  };
  bool loading = false;



  InputOnchange(MapKey, Textvalue){
    setState(() {
      FormValue.update(MapKey, (value) => Textvalue);
    });

  }

  FormOnSubmit() async{
    if(FormValue['Img']!.length == 0){
      ErrorToast('Image Link required');
    }
    else if(FormValue['ProductCode']!.length == 0){
      ErrorToast('ProductCode required');
    }
    else if(FormValue['ProductName']!.length == 0){
      ErrorToast('Product Name required');
    }
    else if(FormValue['Qty']!.length == 0){
      ErrorToast('Product Qty required');
    }
    else if(FormValue['TotalPrice']!.length == 0){
      ErrorToast('Total Price required');
    }
    else if(FormValue['UnitPrice']!.length == 0){
      ErrorToast('Unit Price required');
    }

    else{
      setState(() {
        loading = true;
      });
      await ProductCreateRequest(FormValue);
      setState(() {
        loading = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Product'),
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: loading?Center(child: CircularProgressIndicator(),):(SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnchange("ProductName", Textvalue);
                    },
                    decoration: AppInputDecoration('Product Name'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnchange("ProductCode", Textvalue);
                    },
                    decoration: AppInputDecoration('Product Code'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnchange("Img", Textvalue);
                    },
                    decoration: AppInputDecoration('Product Image'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnchange("UnitPrice", Textvalue);
                    },
                    decoration: AppInputDecoration('Unit Price'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnchange("TotalPrice", Textvalue);
                    },
                    decoration: AppInputDecoration('Total Price'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppDropDownStyle(
                    DropdownButton(
                        value: FormValue['Qty'],
                        items: [
                          DropdownMenuItem(
                            child: Text('Select Qty'),
                            value: " ",
                          ),
                          DropdownMenuItem(
                            child: Text('1 pcs'),
                            value: "1",
                          ),
                          DropdownMenuItem(
                            child: Text('2 pcs'),
                            value: "2",
                          ),
                          DropdownMenuItem(
                            child: Text('3 pcs'),
                            value: "3",
                          ),
                          DropdownMenuItem(
                            child: Text('4 pcs'),
                            value: "4",
                          ),
                        ],
                        onChanged: (Textvalue) {
                          InputOnchange("Qty", Textvalue);
                        },
                        underline: Container(),
                        isExpanded: true),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: ElevatedButton(
                        style: AppButtonStyle(),
                        onPressed: () {
                          FormOnSubmit();
                        },
                        child: SuccessButtonChild('Submit'),
                      ))
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
