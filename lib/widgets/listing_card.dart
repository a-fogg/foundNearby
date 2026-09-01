import 'package:flutter/material.dart';
import '../models/listing.dart';
import '../app/theme.dart';

class ListingCard extends StatelessWidget {
  final Listing listing;
  final VoidCallback onTap;

  const ListingCard({
    Key? key,
    required this.listing,
    required this.onTap,
  }) : super(key: key);

  String _formatPrice() {
    if (listing.price == 0) {
      return 'FREE';
    }
    return '£${listing.price.toStringAsFixed(0)}';
  }

  String _getConditionLabel() {
    switch (listing.condition) {
      case ListingCondition.like_new:
        return 'Like new';
      case ListingCondition.good:
        return 'Good condition';
      case ListingCondition.fair:
        return 'Fair condition';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image placeholder
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: AppTheme.grey100,
                  borderRadius: BorderRadius.circular(AppTheme.radiusLg),
                  border: Border.all(color: AppTheme.black),
                ),
                child: Center(
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    size: 48,
                    color: AppTheme.grey400,
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Title
              Text(
                listing.title,
                style: Theme.of(context).textTheme.headlineMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),

              // Price and details
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _formatPrice(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppTheme.black,
                        ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    '· ${listing.distanceMiles} miles',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.grey400,
                        ),
                  ),
                ],
              ),
              SizedBox(height: 8),

              // Condition
              Text(
                _getConditionLabel(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.grey400,
                    ),
              ),

              // Category tag
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.grey100,
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                child: Text(
                  listing.category,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppTheme.black,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
