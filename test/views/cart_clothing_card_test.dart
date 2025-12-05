import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/views/cart_clothing_card.dart';
import 'package:union_shop/models/cart_item_clothing_model.dart';
import 'package:union_shop/models/product_model.dart';
import 'package:union_shop/enums/clothing_size.dart';
import 'package:union_shop/enums/clothing_colour.dart';
import 'package:union_shop/enums/product_category.dart';
import 'package:union_shop/view_models/cart_view_model.dart';
import 'package:union_shop/utils/firebase_get_user.dart' as user_utils;

class MockCartViewModel extends CartViewModel {
  bool removed = false;
  bool added = false;
  CartItemClothing? lastRemovedItem;
  CartItemClothing? lastAddedItem;
  String? lastUid;

  @override
  void removeClothingItem(CartItemClothing item, String uid) {
    removed = true;
    lastRemovedItem = item;
    lastUid = uid;
  }

  @override
  void addClothingItem(CartItemClothing item, String uid) {
    added = true;
    lastAddedItem = item;
    lastUid = uid;
  }
}

class FakeUser {
  final String uid;
  FakeUser(this.uid);
}

void main() {
  final testItem = CartItemClothing(
    product: Product(
      id: '1',
      title: 'Test Tee',
      description: '',
      price: 20.0,
      imageUrls: [
        'assets/images/classic_tee/black.webp'
      ], // Use a real image from your images folder
      category: ProductCategory.clothing,
      collections: [],
    ),
    quantity: 2,
    size: ClothingSize.medium,
    colour: ClothingColour.black,
  );

  testWidgets('CartClothingCard displays product info and image',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<CartViewModel>.value(
          value: MockCartViewModel(),
          child: CartClothingCard(item: testItem),
        ),
      ),
    );

    expect(find.text('TEST TEE'), findsOneWidget);
    expect(find.text('SIZE: MEDIUM'), findsOneWidget);
    expect(find.text('COLOR: BLACK'), findsOneWidget);
    expect(find.text('QTY: 2'), findsOneWidget);
    expect(find.text('40.00'), findsOneWidget); // price * quantity
    // expect(find.byType(Image), findsOneWidget);
    expect(find.text('REMOVE'), findsOneWidget);
    expect(find.text('EDIT'), findsOneWidget);
  });

  // testWidgets('Tapping REMOVE calls removeClothingItem',
  //     (WidgetTester tester) async {
  //   final mockViewModel = MockCartViewModel();
  //   user_utils.getCurrentUser = () => FakeUser('testuid');

  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: ChangeNotifierProvider<CartViewModel>.value(
  //         value: mockViewModel,
  //         child: CartClothingCard(item: testItem),
  //       ),
  //     ),
  //   );

  //   await tester.tap(find.text('REMOVE'));
  //   await tester.pump();
  //   expect(mockViewModel.removed, isTrue);
  //   expect(mockViewModel.lastRemovedItem, testItem);
  //   expect(mockViewModel.lastUid, 'testuid');
  // });

  // testWidgets('Tapping EDIT shows CartCardEditOverlay',
  //     (WidgetTester tester) async {
  //   user_utils.getCurrentUser = () => FakeUser('testuid');
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: ChangeNotifierProvider<CartViewModel>.value(
  //         value: MockCartViewModel(),
  //         child: CartClothingCard(item: testItem),
  //       ),
  //     ),
  //   );

  //   await tester.tap(find.text('EDIT'));
  //   await tester.pumpAndSettle();
  //   expect(find.text('Edit Quantity'), findsOneWidget);
  //   expect(find.text('Save'), findsOneWidget);
  // });
}
