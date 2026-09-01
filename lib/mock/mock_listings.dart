import '../models/listing.dart';

final mockUsers = [
  User(
    id: 'user1',
    name: 'Alex',
    memberSince: DateTime(2026),
  ),
  User(
    id: 'user2',
    name: 'Jamie',
    memberSince: DateTime(2025),
  ),
  User(
    id: 'user3',
    name: 'Sam',
    memberSince: DateTime(2026),
  ),
  User(
    id: 'demo_user',
    name: 'You',
    memberSince: DateTime(2026),
  ),
];

final mockListings = [
  Listing(
    id: 'listing1',
    title: 'Oak dining table',
    description: 'Solid oak dining table in good condition. Some light marks from normal use. Collection only.',
    price: 75.0,
    category: 'Furniture',
    condition: ListingCondition.good,
    type: ListingType.forSale,
    status: ListingStatus.active,
    userId: 'user1',
    distanceMiles: 2.4,
    location: 'Stourbridge',
    createdAt: DateTime.now().subtract(Duration(days: 5)),
  ),
  Listing(
    id: 'listing2',
    title: 'Garden chairs',
    description: 'Set of 4 wooden garden chairs. Perfect for summer entertaining.',
    price: 20.0,
    category: 'Garden',
    condition: ListingCondition.good,
    type: ListingType.forSale,
    status: ListingStatus.active,
    userId: 'user2',
    distanceMiles: 1.8,
    location: 'Stourbridge',
    createdAt: DateTime.now().subtract(Duration(days: 3)),
  ),
  Listing(
    id: 'listing3',
    title: '20 paving slabs',
    description: 'Used paving slabs, reclaimed from garden project. Collection only.',
    price: 0.0,
    category: 'Garden',
    condition: ListingCondition.fair,
    type: ListingType.giveAway,
    status: ListingStatus.active,
    userId: 'user1',
    distanceMiles: 1.1,
    location: 'Stourbridge',
    createdAt: DateTime.now().subtract(Duration(days: 1)),
  ),
  Listing(
    id: 'listing4',
    title: 'Nintendo Switch games',
    description: 'Bundle of 5 games including Mario Kart, Zelda, and more. Very good condition.',
    price: 40.0,
    category: 'Electronics',
    condition: ListingCondition.like_new,
    type: ListingType.forSale,
    status: ListingStatus.active,
    userId: 'user3',
    distanceMiles: 3.2,
    location: 'Stourbridge',
    createdAt: DateTime.now().subtract(Duration(days: 2)),
  ),
  Listing(
    id: 'listing5',
    title: "Child's bicycle",
    description: "20-inch bike suitable for ages 7-10. Good working condition, minor cosmetic wear.",
    price: 30.0,
    category: 'Kids',
    condition: ListingCondition.good,
    type: ListingType.forSale,
    status: ListingStatus.active,
    userId: 'user2',
    distanceMiles: 4.1,
    location: 'Stourbridge',
    createdAt: DateTime.now().subtract(Duration(days: 4)),
  ),
  Listing(
    id: 'listing6',
    title: 'Moving boxes',
    description: 'Bundle of 12 sturdy cardboard boxes from recent house move. Free to collect.',
    price: 0.0,
    category: 'Other',
    condition: ListingCondition.good,
    type: ListingType.giveAway,
    status: ListingStatus.active,
    userId: 'user3',
    distanceMiles: 0.7,
    location: 'Stourbridge',
    createdAt: DateTime.now().subtract(Duration(hours: 12)),
  ),
  Listing(
    id: 'listing7',
    title: 'Wooden bookshelf',
    description: 'Tall wooden bookshelf with 5 shelves. Solid pine, very sturdy.',
    price: 35.0,
    category: 'Furniture',
    condition: ListingCondition.good,
    type: ListingType.forSale,
    status: ListingStatus.active,
    userId: 'user1',
    distanceMiles: 2.9,
    location: 'Stourbridge',
    createdAt: DateTime.now().subtract(Duration(days: 6)),
  ),
  Listing(
    id: 'listing8',
    title: 'DIY tool set',
    description: 'Complete set with hammer, screwdrivers, wrenches, and more. Everything in working order.',
    price: 25.0,
    category: 'DIY',
    condition: ListingCondition.good,
    type: ListingType.forSale,
    status: ListingStatus.active,
    userId: 'user2',
    distanceMiles: 2.2,
    location: 'Stourbridge',
    createdAt: DateTime.now().subtract(Duration(days: 7)),
  ),
];

final mockConversations = [
  Conversation(
    id: 'conv1',
    listingId: 'listing1',
    buyerId: 'demo_user',
    sellerId: 'user1',
    messages: [
      Message(
        id: 'msg1',
        senderId: 'demo_user',
        content: 'Hi, is this still available?',
        timestamp: DateTime.now().subtract(Duration(hours: 2)),
        listingId: 'listing1',
      ),
      Message(
        id: 'msg2',
        senderId: 'user1',
        content: 'Yes, it is.',
        timestamp: DateTime.now().subtract(Duration(hours: 1, minutes: 55)),
        listingId: 'listing1',
      ),
    ],
  ),
];

// Helper functions
User getUserById(String id) {
  return mockUsers.firstWhere(
    (user) => user.id == id,
    orElse: () => mockUsers.first,
  );
}

Listing? getListingById(String id) {
  try {
    return mockListings.firstWhere((listing) => listing.id == id);
  } catch (e) {
    return null;
  }
}

List<Listing> getListingsByCategory(String category) {
  if (category.isEmpty || category == 'All') {
    return mockListings;
  }
  return mockListings.where((listing) => listing.category == category).toList();
}

List<Listing> searchListings(String query) {
  if (query.isEmpty) return mockListings;
  final lowerQuery = query.toLowerCase();
  return mockListings
      .where((listing) =>
          listing.title.toLowerCase().contains(lowerQuery) ||
          listing.description.toLowerCase().contains(lowerQuery))
      .toList();
}
