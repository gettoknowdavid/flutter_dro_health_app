import '../utils/uuid.dart';
import '../../features/pharmacy/data/models/product_model.dart';

import 'dispensation_type_enum.dart';
import 'drug_type_enum.dart';
import 'pack_size_enum.dart';
import 'images.dart';
import '../../features/pharmacy/domain/entities/product.dart';

class Products {
  static List<Product> values = <Product>[
    Product(
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
    ),
    Product(
      id: AppUuid.v4(),
      name: 'Folic Acid',
      constituents: 'Folic Acid',
      description: '',
      dispenseType: DispenseType.container,
      packSize: PackSize.none,
      drugType: DrugType.tablet,
      producer: 'Emzor Pharmaceuticals',
      producerLogoUrl: PharmacyImage.emzorLogo.assetName,
      price: 350.0,
      imageUrl: PharmacyImage.folicAcid.assetName,
      weight: 5,
    ),
    Product(
      id: AppUuid.v4(),
      name: 'Paracetamol',
      constituents: 'Paracetamol Caplets',
      description: '',
      dispenseType: DispenseType.container,
      packSize: PackSize.none,
      drugType: DrugType.tablet,
      producer: 'Emzor Pharmaceuticals',
      producerLogoUrl: PharmacyImage.emzorLogo.assetName,
      price: 850.0,
      imageUrl: PharmacyImage.paracetamolCaplets.assetName,
      weight: 500,
    ),
    Product(
      id: AppUuid.v4(),
      name: 'Folic Acid',
      constituents: 'Folic Acid',
      description: '',
      dispenseType: DispenseType.pack,
      packSize: PackSize.s10x10,
      drugType: DrugType.tablet,
      producer: 'Emzor Pharmaceuticals',
      producerLogoUrl: PharmacyImage.emzorLogo.assetName,
      price: 170.0,
      imageUrl: PharmacyImage.folicAcidPack.assetName,
      weight: 5,
    ),
    Product(
      id: AppUuid.v4(),
      name: 'Garlic Oil',
      constituents: 'Garlic Oil',
      description: '',
      dispenseType: DispenseType.pack,
      packSize: PackSize.s3x10,
      drugType: DrugType.softGel,
      producer: 'Emzor Pharmaceuticals',
      producerLogoUrl: PharmacyImage.emzorLogo.assetName,
      price: 385.0,
      imageUrl: PharmacyImage.garlicPack.assetName,
      weight: 650,
    ),
    Product(
      id: AppUuid.v4(),
      name: 'Kezitil',
      constituents: 'Cefuroxime Axetil',
      description: '',
      dispenseType: DispenseType.pack,
      packSize: PackSize.s1x10,
      drugType: DrugType.tablet,
      producer: 'Emzor Pharmaceuticals',
      producerLogoUrl: PharmacyImage.emzorLogo.assetName,
      price: 1140.0,
      imageUrl: PharmacyImage.kezitil250.assetName,
      weight: 250,
    ),
    Product(
      id: AppUuid.v4(),
      name: 'Kezitil',
      constituents: 'Cefuroxime Axetil',
      description: '',
      dispenseType: DispenseType.pack,
      packSize: PackSize.s1x10,
      drugType: DrugType.tablet,
      producer: 'Emzor Pharmaceuticals',
      producerLogoUrl: PharmacyImage.emzorLogo.assetName,
      price: 1795.0,
      imageUrl: PharmacyImage.kezitil500.assetName,
      weight: 500,
    ),
    Product(
      id: AppUuid.v4(),
      name: 'Kezitil',
      constituents: 'Cefuroxime Axetil',
      description: '',
      dispenseType: DispenseType.bottle,
      packSize: PackSize.none,
      drugType: DrugType.oralSuspension,
      producer: 'Emzor Pharmaceuticals',
      producerLogoUrl: PharmacyImage.emzorLogo.assetName,
      price: 1820.0,
      imageUrl: PharmacyImage.kezitilSuspension.assetName,
      weight: 125,
    ),
    Product(
      id: AppUuid.v4(),
      name: 'Vitamin E',
      constituents: 'Vitamin E',
      description: '',
      dispenseType: DispenseType.container,
      packSize: PackSize.none,
      drugType: DrugType.tablet,
      producer: 'Emzor Pharmaceuticals',
      producerLogoUrl: PharmacyImage.emzorLogo.assetName,
      price: 750.0,
      imageUrl: PharmacyImage.vitaminE.assetName,
      weight: 400,
    ),
  ];
}

class ProductModels {
  static List<ProductModel> values = <ProductModel>[
    ProductModel(
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
    ),
    ProductModel(
      id: AppUuid.v4(),
      name: 'Folic Acid',
      constituents: 'Folic Acid',
      description: '',
      dispenseType: DispenseType.container,
      packSize: PackSize.none,
      drugType: DrugType.tablet,
      producer: 'Emzor Pharmaceuticals',
      producerLogoUrl: PharmacyImage.emzorLogo.assetName,
      price: 350.0,
      imageUrl: PharmacyImage.folicAcid.assetName,
      weight: 5,
    ),
    ProductModel(
      id: AppUuid.v4(),
      name: 'Paracetamol',
      constituents: 'Paracetamol Caplets',
      description: '',
      dispenseType: DispenseType.container,
      packSize: PackSize.none,
      drugType: DrugType.tablet,
      producer: 'Emzor Pharmaceuticals',
      producerLogoUrl: PharmacyImage.emzorLogo.assetName,
      price: 850.0,
      imageUrl: PharmacyImage.paracetamolCaplets.assetName,
      weight: 500,
    ),
    ProductModel(
      id: AppUuid.v4(),
      name: 'Folic Acid',
      constituents: 'Folic Acid',
      description: '',
      dispenseType: DispenseType.pack,
      packSize: PackSize.s10x10,
      drugType: DrugType.tablet,
      producer: 'Emzor Pharmaceuticals',
      producerLogoUrl: PharmacyImage.emzorLogo.assetName,
      price: 170.0,
      imageUrl: PharmacyImage.folicAcidPack.assetName,
      weight: 5,
    ),
    ProductModel(
      id: AppUuid.v4(),
      name: 'Garlic Oil',
      constituents: 'Garlic Oil',
      description: '',
      dispenseType: DispenseType.pack,
      packSize: PackSize.s3x10,
      drugType: DrugType.softGel,
      producer: 'Emzor Pharmaceuticals',
      producerLogoUrl: PharmacyImage.emzorLogo.assetName,
      price: 385.0,
      imageUrl: PharmacyImage.garlicPack.assetName,
      weight: 650,
    ),
    ProductModel(
      id: AppUuid.v4(),
      name: 'Kezitil',
      constituents: 'Cefuroxime Axetil',
      description: '',
      dispenseType: DispenseType.pack,
      packSize: PackSize.s1x10,
      drugType: DrugType.tablet,
      producer: 'Emzor Pharmaceuticals',
      producerLogoUrl: PharmacyImage.emzorLogo.assetName,
      price: 1140.0,
      imageUrl: PharmacyImage.kezitil250.assetName,
      weight: 250,
    ),
    ProductModel(
      id: AppUuid.v4(),
      name: 'Kezitil',
      constituents: 'Cefuroxime Axetil',
      description: '',
      dispenseType: DispenseType.pack,
      packSize: PackSize.s1x10,
      drugType: DrugType.tablet,
      producer: 'Emzor Pharmaceuticals',
      producerLogoUrl: PharmacyImage.emzorLogo.assetName,
      price: 1795.0,
      imageUrl: PharmacyImage.kezitil500.assetName,
      weight: 500,
    ),
    ProductModel(
      id: AppUuid.v4(),
      name: 'Kezitil',
      constituents: 'Cefuroxime Axetil',
      description: '',
      dispenseType: DispenseType.bottle,
      packSize: PackSize.none,
      drugType: DrugType.oralSuspension,
      producer: 'Emzor Pharmaceuticals',
      producerLogoUrl: PharmacyImage.emzorLogo.assetName,
      price: 1820.0,
      imageUrl: PharmacyImage.kezitilSuspension.assetName,
      weight: 125,
    ),
    ProductModel(
      id: AppUuid.v4(),
      name: 'Vitamin E',
      constituents: 'Vitamin E',
      description: '',
      dispenseType: DispenseType.container,
      packSize: PackSize.none,
      drugType: DrugType.tablet,
      producer: 'Emzor Pharmaceuticals',
      producerLogoUrl: PharmacyImage.emzorLogo.assetName,
      price: 750.0,
      imageUrl: PharmacyImage.vitaminE.assetName,
      weight: 400,
    ),
  ];
}