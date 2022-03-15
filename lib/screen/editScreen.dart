import 'package:flutter/material.dart';
import 'package:thirdapp/provider/product.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocus = FocusNode();

  final _descriptionFocus = FocusNode();

  final urlController = TextEditingController();

  final _urlFocus = FocusNode();
  final _globalKey = GlobalKey<FormState>();
  var newProduct = Product(id: '', title: '', description: '', price: 0, imageUrl: '');

  void dispose() {
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _urlFocus.dispose();
    urlController.dispose();
    // super.dispose();
  }

  void initState() {
    _urlFocus.addListener(uPDate);
  }

  void uPDate() {
    if (!_urlFocus.hasFocus) {
      if(urlController.text.isEmpty|| !urlController.text.startsWith('http') && !urlController.text.startsWith('https')||!urlController.text.endsWith('png')&& !urlController.text.endsWith('jpn')&&!urlController.text.endsWith('jpg')){
        return;
                        
                      }
      setState(() {});
    }
  }
  void saveForm(){
   final validateValue=_globalKey.currentState!.validate();
   if(!validateValue){
     return;
   }
    _globalKey.currentState!.save();
    print(newProduct.title);
    print(newProduct.description);
    print(newProduct.price);
    print(newProduct.imageUrl);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon:Icon(Icons.save),onPressed: (){
           saveForm();
          },),
        ],
        title: Text('edit product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _globalKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocus);
                },
                onSaved: (value){
                  newProduct = Product(id:'' , title:value??'', description: newProduct.description, price: newProduct.price, imageUrl: newProduct.imageUrl);
                },
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please provide a value';
                }
                else return null;
                }
                ,
              ),
              TextFormField(
                  decoration: InputDecoration(labelText: 'price'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _priceFocus,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocus);
                  },
                  onSaved: (value){
                    newProduct = Product(id:'', title: newProduct.title, description:newProduct.description, price: double.parse(value??''), imageUrl: newProduct.imageUrl);
                  },
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'please provide a value.';
                    }
                    if(double.tryParse(value)==null){
                      return 'please enter a valid number';
                    }
                    if(double.parse(value)<=0){
                      return 'please enter a number greater than zero';
                    }
                    else return null;
                  },
                  ),
              TextFormField(
                decoration: InputDecoration(labelText: 'description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocus,
              onSaved: (value){
                newProduct =Product(id: '', title:newProduct. title, description: value??'', price:newProduct.price, imageUrl:newProduct.imageUrl);
              },
              validator:(value){
                if (value!.isEmpty){
  return 'please provide a description';
                }
                if(value.length<=10){
                  return 'please enter description with more than 10 words';
                }
                else return null;
              } ,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 4, right: 10),
                      decoration: (BoxDecoration(
                          border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ))),
                      child: urlController.text.isEmpty
                          ? Text('ENTER A URL')
                          : FittedBox(
                              child: Image.network(
                                urlController.text,
                                fit: BoxFit.cover,
                              ),
                            )),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image URL'),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.url,
                      controller: urlController,
                      focusNode: _urlFocus,
                      onFieldSubmitted :(_){
                           saveForm();
                      },
                      onSaved: (value){
                        newProduct = Product(id: '', title:newProduct. title, description: newProduct.description, price:newProduct.price, imageUrl: value??'');
                         
                      
                  
                      },

                      validator:(value){
                      
                     if(value!.isEmpty){
                        return 'please provide a url';

                      }
                      if(!value.startsWith('http')|| !value.startsWith('https')){
                      return 'please enter valid url by starting with http or https';
                      }
                      if(!value.endsWith('png')&& !value.endsWith('jpn')&&!value.endsWith('jpg')){
                        return'please enter valid picture fomart like jpg';
                      } else return null;
                      }
                      
                      ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
