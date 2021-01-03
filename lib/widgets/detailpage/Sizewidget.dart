import 'package:flutter/material.dart';
import 'package:groceryapp/model/selectedSizeSpecification.dart';
import 'package:provider/provider.dart';

class ProductSize extends StatefulWidget {
  final List productSizes;

  ProductSize(this.productSizes);

  @override
  _ProductSizeState createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Size",
          ), //heading text
          SizedBox(
            height: 10,
          ),
          Container(
            height: 30,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.productSizes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Consumer<SelectedSizeSpecifications>(
                        builder: (_, model, child) => Container(
                          color:
                              model.selectedSize == widget.productSizes[index]
                                  ? Colors.pink
                                  : Colors.red,
                          child: FlatButton(
                            onPressed: () {
                              model.setSelectedSize(widget.productSizes[index]);
                            },
                            child: Text(widget.productSizes[index]),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
