import 'package:flutter/material.dart';

import 'widgets/barber_shop_card.dart';

// Simple local data holder for displaying sample barber shops in the UI
class BarberShopItem {
  final String id;
  final String name;
  final String area;
  final String distance;
  final double rating;
  final int reviewCount;
  final String startingPrice;
  final String nextSlot;
  final String statusLabel;
  final List<String> services;

  const BarberShopItem({
    required this.id,
    required this.name,
    required this.area,
    required this.distance,
    required this.rating,
    required this.reviewCount,
    required this.startingPrice,
    required this.nextSlot,
    required this.statusLabel,
    required this.services,
  });
}

class SearchBarberShopsScreen extends StatefulWidget {
  const SearchBarberShopsScreen({super.key});

  @override
  State<SearchBarberShopsScreen> createState() =>
      _SearchBarberShopsScreenState();
}

class _SearchBarberShopsScreenState extends State<SearchBarberShopsScreen> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  String selectedFilter = 'All';
  final Set<String> favoriteShopIds = {};

  final List<String> quickFilters = const [
    'All',
    'Camden',
    'Soho',
    'Skin Fade',
    'Beard Trim',
    'Quiet',
  ];

  final List<String> emptySuggestions = const [
    'Camden',
    'North & Co.',
    'Skin Fade',
  ];

  // Sample barber shops for the UI-only sprint
  final List<BarberShopItem> allShops = const [
    BarberShopItem(
      id: '1',
      name: 'North & Co.',
      area: 'Camden High Street',
      distance: '0.4 km',
      rating: 4.9,
      reviewCount: 128,
      startingPrice: 'From £18',
      nextSlot: '10:30 next',
      statusLabel: 'Quiet',
      services: ['Skin Fade', 'Scissor Cut', 'Beard Trim'],
    ),
    BarberShopItem(
      id: '2',
      name: 'The Good Chair',
      area: 'Kentish Town',
      distance: '1.1 km',
      rating: 4.8,
      reviewCount: 94,
      startingPrice: 'From £16',
      nextSlot: '11:15 next',
      statusLabel: 'Quiet',
      services: ['Classic Cut', 'Beard Trim', 'Hot Towel'],
    ),
    BarberShopItem(
      id: '3',
      name: 'Crown & Blade',
      area: 'Soho Square',
      distance: '2.3 km',
      rating: 4.9,
      reviewCount: 210,
      startingPrice: 'From £24',
      nextSlot: '12:00 next',
      statusLabel: 'Open now',
      services: ['Skin Fade', 'Buzz Cut', 'Line Up'],
    ),
    BarberShopItem(
      id: '4',
      name: 'Fade House Studio',
      area: 'Camden Lock',
      distance: '0.7 km',
      rating: 4.7,
      reviewCount: 76,
      startingPrice: 'From £20',
      nextSlot: '11:45 next',
      statusLabel: 'Popular',
      services: ['Skin Fade', 'Taper Fade', 'Beard Trim'],
    ),
    BarberShopItem(
      id: '5',
      name: 'Oakwood Barbers',
      area: 'Primrose Hill',
      distance: '1.5 km',
      rating: 4.8,
      reviewCount: 63,
      startingPrice: 'From £19',
      nextSlot: '13:10 next',
      statusLabel: 'Quiet',
      services: ['Scissor Cut', 'Beard Trim', 'Restyle'],
    ),
    BarberShopItem(
      id: '6',
      name: 'Soho Trim Club',
      area: 'Soho',
      distance: '2.6 km',
      rating: 4.6,
      reviewCount: 112,
      startingPrice: 'From £22',
      nextSlot: '14:00 next',
      statusLabel: 'Open now',
      services: ['Classic Cut', 'Skin Fade', 'Shave'],
    ),
  ];

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  // Filter shops by typed search text and selected quick filter
  List<BarberShopItem> get filteredShops {
    final String query = searchController.text.trim().toLowerCase();

    return allShops.where((shop) {
      final bool matchesFilter = selectedFilter == 'All' ||
          shop.area.toLowerCase().contains(selectedFilter.toLowerCase()) ||
          shop.statusLabel.toLowerCase() == selectedFilter.toLowerCase() ||
          shop.services.any(
            (service) =>
                service.toLowerCase().contains(selectedFilter.toLowerCase()),
          );

      if (!matchesFilter) {
        return false;
      }

      if (query.isEmpty) {
        return true;
      }

      final bool matchesName = shop.name.toLowerCase().contains(query);
      final bool matchesArea = shop.area.toLowerCase().contains(query);
      final bool matchesService = shop.services.any(
        (service) => service.toLowerCase().contains(query),
      );

      return matchesName || matchesArea || matchesService;
    }).toList();
  }

  // Reset search text and filter selection
  void clearSearch() {
    setState(() {
      searchController.clear();
      selectedFilter = 'All';
    });
  }

  // Fill the search bar when tapping a suggestion chip
  void applySuggestion(String text) {
    setState(() {
      searchController.text = text;
      searchController.selection = TextSelection.fromPosition(
        TextPosition(offset: text.length),
      );
      selectedFilter = 'All';
    });
  }

  // Toggle favorite state locally for UI feedback
  void toggleFavorite(String shopId) {
    setState(() {
      if (favoriteShopIds.contains(shopId)) {
        favoriteShopIds.remove(shopId);
      } else {
        favoriteShopIds.add(shopId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<BarberShopItem> results = filteredShops;
    final bool hasActiveSearch =
        searchController.text.trim().isNotEmpty || selectedFilter != 'All';

    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // Top navigation and heading
              Row(
                children: [
                  if (Navigator.canPop(context)) ...[
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFFE8EAE6),
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 18,
                          color: Color(0xFF151A18),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SEARCH',
                        style: TextStyle(
                          color: Color(0xFF1F5C46),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Search barber shops',
                        style: TextStyle(
                          color: Color(0xFF151A18),
                          fontSize: 26,
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Search bar for finding shops by name, area, or service
              TextField(
                controller: searchController,
                focusNode: searchFocusNode,
                textInputAction: TextInputAction.search,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Search shop name, area, or service',
                  hintStyle: const TextStyle(
                    color: Color(0xFF9AA09D),
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Color(0xFF6B7370),
                  ),
                  suffixIcon: searchController.text.isNotEmpty
                      ? IconButton(
                          tooltip: 'Clear search',
                          onPressed: () {
                            setState(() {
                              searchController.clear();
                            });
                          },
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Color(0xFF6B7370),
                          ),
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFFE8EAE6),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFF1F5C46),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Quick filter chips
              SizedBox(
                height: 36,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: quickFilters.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final String filter = quickFilters[index];
                    final bool isSelected = selectedFilter == filter;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF1F5C46)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF1F5C46)
                                : const Color(0xFFE8EAE6),
                          ),
                        ),
                        child: Text(
                          filter,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF5F6663),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Results count and reset action
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    results.length == 1
                        ? '1 barber shop found'
                        : '${results.length} barber shops found',
                    style: const TextStyle(
                      color: Color(0xFF5F6663),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (hasActiveSearch)
                    GestureDetector(
                      onTap: clearSearch,
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          color: Color(0xFF1F5C46),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),

              // Search results list or empty-results message
              Expanded(
                child: results.isEmpty
                    ? _buildEmptyState()
                    : ListView.separated(
                        padding: const EdgeInsets.only(bottom: 24),
                        itemCount: results.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final BarberShopItem shop = results[index];
                          return BarberShopCard(
                            name: shop.name,
                            area: shop.area,
                            distance: shop.distance,
                            rating: shop.rating,
                            reviewCount: shop.reviewCount,
                            startingPrice: shop.startingPrice,
                            nextSlot: shop.nextSlot,
                            statusLabel: shop.statusLabel,
                            services: shop.services,
                            isFavorite: favoriteShopIds.contains(shop.id),
                            onFavoriteTap: () => toggleFavorite(shop.id),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Selected ${shop.name} (${shop.area})',
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Empty state shown when no shops match the search or filter
  Widget _buildEmptyState() {
    final String query = searchController.text.trim();
    final String message = query.isNotEmpty
        ? 'We couldn\'t find any barber shops matching "$query". Try another shop name, area, or service.'
        : 'No barber shops match the "$selectedFilter" filter right now.';

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 76,
              width: 76,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F6F3),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: const Color(0xFFE8EAE6),
                ),
              ),
              child: const Icon(
                Icons.search_off_rounded,
                size: 36,
                color: Color(0xFF1F5C46),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'No barber shops found',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF151A18),
                fontSize: 22,
                fontFamily: 'Times New Roman',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF6B7370),
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),

            // Quick suggestions to help users recover from an empty search
            const Text(
              'Try searching for',
              style: TextStyle(
                color: Color(0xFF5F6663),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: emptySuggestions.map((suggestion) {
                return GestureDetector(
                  onTap: () => applySuggestion(suggestion),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFE8EAE6),
                      ),
                    ),
                    child: Text(
                      suggestion,
                      style: const TextStyle(
                        color: Color(0xFF1F5C46),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),

            // Clear search button
            SizedBox(
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1F5C46),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: clearSearch,
                child: const Text(
                  'Clear search',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
