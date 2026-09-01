enum ListingType { forSale, giveAway, wanted }
enum ListingCondition { like_new, good, fair }
enum ListingStatus { active, sold, completed }

class Listing {
  final String id;
  final String title;
  final String description;
  final double price;
  final String category;
  final ListingCondition condition;
  final ListingType type;
  final ListingStatus status;
  final String userId;
  final double distanceMiles;
  final String location;
  final DateTime createdAt;

  Listing({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.condition,
    required this.type,
    required this.status,
    required this.userId,
    required this.distanceMiles,
    required this.location,
    required this.createdAt,
  });

  Listing copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    String? category,
    ListingCondition? condition,
    ListingType? type,
    ListingStatus? status,
    String? userId,
    double? distanceMiles,
    String? location,
    DateTime? createdAt,
  }) {
    return Listing(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      condition: condition ?? this.condition,
      type: type ?? this.type,
      status: status ?? this.status,
      userId: userId ?? this.userId,
      distanceMiles: distanceMiles ?? this.distanceMiles,
      location: location ?? this.location,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class User {
  final String id;
  final String name;
  final DateTime memberSince;
  final String? imageUrl;

  User({
    required this.id,
    required this.name,
    required this.memberSince,
    this.imageUrl,
  });
}

class Message {
  final String id;
  final String senderId;
  final String content;
  final DateTime timestamp;
  final String listingId;

  Message({
    required this.id,
    required this.senderId,
    required this.content,
    required this.timestamp,
    required this.listingId,
  });
}

class Conversation {
  final String id;
  final String listingId;
  final String buyerId;
  final String sellerId;
  final List<Message> messages;

  Conversation({
    required this.id,
    required this.listingId,
    required this.buyerId,
    required this.sellerId,
    required this.messages,
  });
}
