import 'product_list.dart';
import '../utils/uuid.dart';
import '../../features/cart/data/models/cart_product_model.dart';

import 'dispensation_type_enum.dart';
import 'drug_type_enum.dart';
import 'pack_size_enum.dart';
import '../../features/cart/domain/entities/cart_product.dart';
import '../../features/pharmacy/data/models/product_model.dart';
import '../../features/pharmacy/domain/entities/product.dart';

import 'images.dart';

final tProduct = Product(
  id: AppUuid.v4(),
  name: 'Azythromycin',
  constituents: 'Dry Syrup',
  description: '',
  dispenseType: DispenseType.bottle,
  packSize: PackSize.none,
  drugType: DrugType.oralSuspension,
  producer: 'Emzor Pharmaceuticals',
  producerLogoUrl: PharmacyImage.emzorLogo.assetName,
  price: 1950.0,
  imageUrl: PharmacyImage.azithromycinSyrup.assetName,
  weight: 200,
);

final tProductModel = ProductModel(
  id: AppUuid.v4(),
  name: 'Azythromycin',
  constituents: 'Dry Syrup',
  description: '',
  dispenseType: DispenseType.bottle,
  packSize: PackSize.none,
  drugType: DrugType.oralSuspension,
  producer: 'Emzor Pharmaceuticals',
  producerLogoUrl: PharmacyImage.emzorLogo.assetName,
  price: 1950.0,
  imageUrl: PharmacyImage.azithromycinSyrup.assetName,
  weight: 200,
);

final tCartProduct = CartProduct(
  products: Products.values,
  productsMap: {tProduct.id: 2},
);

final tCartProductModel = CartProductModel(
  products: ProductModels.values,
  productsMap: {tProduct.id: 2},
);

final tCartProducts = <CartProduct>[
  CartProduct(
    products: Products.values,
    productsMap: {tProduct.id: 2},
  ),
];

final tCartProductModels = <CartProductModel>[
  CartProductModel(
    products: ProductModels.values,
    productsMap: {tProduct.id: 2},
  ),
];
