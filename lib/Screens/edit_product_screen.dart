import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);
  static const String routeName = "edit-product";

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imgUrlFocusNode = FocusNode();
  final _imgUrlController = TextEditingController();

  @override
  void initState() {
    _imgUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imgUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imgUrlController.dispose();
    _imgUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imgUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(label: Text("Title")),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text("Price")),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              focusNode: _priceFocusNode,
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text("Description")),
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              focusNode: _descriptionFocusNode,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 8, right: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  child: _imgUrlController.text.isEmpty
                      ? const Text("Enter a URL")
                      : FittedBox(
                          fit: BoxFit.cover,
                          child: Image.network(_imgUrlController.text),
                        ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "Image URL"),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () => setState(() {}),
                    controller: _imgUrlController,
                    focusNode: _imgUrlFocusNode,
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
