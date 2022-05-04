import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeDetailState createState() {
    return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _slider_val = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(image: AssetImage(widget.recipe.imageUrl)),
            ),
            const SizedBox(height: 4),
            Text(
              widget.recipe.label,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(7.0),
                  itemCount: widget.recipe.ingredients.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ingredient = widget.recipe.ingredients[index];
                    return Text(
                      '${ingredient.quantity * _slider_val} ${ingredient.measure} ${ingredient.name}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    );
                  }),
            ),
            Slider(
              min: 1,
              max: 10,
              divisions: 10,
              label: '${_slider_val * widget.recipe.servings} servings',
              value: _slider_val.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  _slider_val = newValue.round();
                });
              },
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
