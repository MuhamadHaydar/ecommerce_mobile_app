import 'package:flutter/material.dart';
import 'package:restaurant_menu_app/constants/color_constatns.dart';
import 'package:restaurant_menu_app/constants/font_constants.dart';

class QuantityItemWidget extends StatefulWidget {

  final Function<Void> (int quantity) onPressed;
  final int quantity;

  const QuantityItemWidget({Key? key, required this.onPressed, required this.quantity}) : super(key: key);

  @override
  _QuantityItemWidgetState createState() => _QuantityItemWidgetState();
}

class _QuantityItemWidgetState extends State<QuantityItemWidget> {

  int quantity = 1;

  @override
  void initState() {
    quantity = widget.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              height: 40,
              width: 40,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    quantity += 1;
                  });
                  // pass quantity to outside.
                  widget.onPressed(quantity);
                },
                child: Icon(Icons.add, size: 10),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(ColorConstants.pinkBold)),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            flex: 3,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  '$quantity',
                  style: FontConstants.k24KurdishBold(20, Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            flex: 2,
            child: Container(
              height: 40,
              width: 40,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if(quantity > 1){
                      quantity -= 1;
                    }else{
                      // Do nothing to make it minus
                    }
                  });
                  widget.onPressed(quantity);

                },
                child: Center(child: Icon(Icons.remove, size: 12)),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(ColorConstants.pinkBold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
