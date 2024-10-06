import 'package:flutter/material.dart';
import '../models/promotion_item.dart';

class PromotionListWidget extends StatelessWidget {
  final List<PromotionItem> promotions;

  const PromotionListWidget({super.key, required this.promotions});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: promotions.length,
      itemBuilder: (context, index) {
        final promotion = promotions[index];
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(promotion.imageUrl, fit: BoxFit.cover, height: 120),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(promotion.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(promotion.brand, style: const TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        );
      },
    );
  }
}
