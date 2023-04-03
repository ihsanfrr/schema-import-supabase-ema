class ClusterModel {
  final int? id;
  final int? parent;
  final String name;
  final String address;
  final String type;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  ClusterModel({
    this.id,
    this.parent,
    required this.name,
    required this.address,
    required this.type,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory ClusterModel.fromMap(Map<String, dynamic> data) => ClusterModel(
        id: data['id'],
        parent: data['parent'],
        name: data['name'],
        address: data['address'],
        type: data['type'],
        status: data['status'],
        createdAt: data['createdAt'],
        updatedAt: data['updatedAt'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'parent': parent,
        'name': name,
        'address': address,
        'type': type,
        'status': status,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class ItemTypeModel {
  final int? id;
  final String name;
  final bool isDeleted;
  final String? createdAt;
  final String? updatedAt;

  ItemTypeModel({
    this.id,
    required this.name,
    required this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory ItemTypeModel.fromJson(Map<String, dynamic> json) => ItemTypeModel(
        id: json['id'],
        name: json['name'],
        isDeleted: json['isDeleted'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'isDeleted': isDeleted,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class ItemModel {
  final int id;
  final int typeId;
  final String name;
  final int basePrice;
  final int price;
  final bool isDeleted;
  final bool topable;
  final String? createdAt;
  final String? updatedAt;

  final ItemTypeModel? type;

  ItemModel({
    required this.id,
    required this.typeId,
    required this.name,
    required this.basePrice,
    required this.price,
    required this.isDeleted,
    required this.topable,
    this.createdAt,
    this.updatedAt,
    this.type,
  });

  factory ItemModel.fromMap(Map<String, dynamic> data) => ItemModel(
        id: data['id'],
        typeId: data['typeId'],
        name: data['name'],
        basePrice: data['basePrice'],
        price: data['price'],
        isDeleted: data['isDeleted'],
        topable: data['topable'],
        createdAt: data['createdAt'],
        updatedAt: data['updatedAt'],
        type: data['type'] != null
            ? ItemTypeModel.fromJson(
                data['type'],
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'typeId': typeId,
        'name': name,
        'basePrice': basePrice,
        'price': price,
        'isDeleted': isDeleted,
        'topable': topable,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'type': type?.toJson(),
      };
}

class ProgramModel {
  final int? id;
  final int? clusterId;
  final int? itemId;
  final String name;
  final num qty;
  final num priceItem;
  final num priceItemTotal;
  final num priceNGRS;
  final num priceNGRSTotal;
  final num priceProgram;
  final num priceProgramTotal;
  final num price;
  final num margin;
  final String type;
  final num priceTotal;
  final num? perdanaSubsidy;
  final num? perdanaSubsidyTotal;
  final num? telkomselCashback;
  final num? telkomselCashbackTotal;
  final num? digistarCashback;
  final num? digistarCashbackTotal;
  final num? endOfYearInsentive;
  final num? endOfYearInsentiveTotal;
  final num? commitmentBudget;
  final num? commitmentBudgetTotal;
  final num? otherSubsidy;
  final num? otherSubsidyTotal;
  final String? description;
  final bool topable;
  final String? createdAt;
  final String? updatedAt;

  final ClusterModel? cluster;
  final ItemModel? item;

  ProgramModel({
    this.id,
    this.clusterId,
    this.itemId,
    required this.name,
    required this.qty,
    required this.priceItem,
    required this.priceItemTotal,
    required this.priceNGRS,
    required this.priceNGRSTotal,
    required this.priceProgram,
    required this.priceProgramTotal,
    required this.price,
    required this.margin,
    required this.type,
    required this.priceTotal,
    this.perdanaSubsidy,
    this.perdanaSubsidyTotal,
    this.telkomselCashback,
    this.telkomselCashbackTotal,
    this.digistarCashback,
    this.digistarCashbackTotal,
    this.endOfYearInsentive,
    this.endOfYearInsentiveTotal,
    this.commitmentBudget,
    this.commitmentBudgetTotal,
    this.otherSubsidy,
    this.otherSubsidyTotal,
    this.description,
    required this.topable,
    this.createdAt,
    this.updatedAt,
    this.cluster,
    this.item,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) => ProgramModel(
        clusterId: json['clusterId'],
        itemId: json['itemId'],
        name: json['name'],
        qty: json['qty'],
        priceItem: json['priceItem'],
        priceItemTotal: json['priceItemTotal'],
        priceNGRS: json['priceNGRS'],
        priceNGRSTotal: (json['priceNGRSTotal']),
        priceProgram: json['priceProgram'],
        priceProgramTotal: json['priceProgramTotal'],
        price: json['price'],
        margin: json['margin'],
        type: json['type'],
        priceTotal: json['priceTotal'],
        perdanaSubsidy: json['perdanaSubsidy'],
        perdanaSubsidyTotal: json['perdanaSubsidyTotal'],
        telkomselCashback: json['telkomselCashback'],
        telkomselCashbackTotal: json['telkomselCashbackTotal'],
        digistarCashback: json['digistarCashback'],
        digistarCashbackTotal: json['digistarCashbackTotal'],
        endOfYearInsentive: json['endOfYearInsentive'],
        endOfYearInsentiveTotal: json['endOfYearInsentiveTotal'],
        commitmentBudget: json['commitmentBudget'],
        commitmentBudgetTotal: json['commitmentBudgetTotal'],
        otherSubsidy: json['otherSubsidy'],
        otherSubsidyTotal: json['otherSubsidyTotal'],
        description: json['description'],
        topable: json['topable'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        cluster: json['cluster'] != null
            ? ClusterModel.fromMap(
                json['cluster'],
              )
            : null,
        item: json['item'] != null
            ? ItemModel.fromMap(
                json['item'],
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'clusterId': clusterId,
        'itemId': itemId,
        'name': name,
        'qty': qty,
        'priceItem': priceItem,
        'priceItemTotal': priceItemTotal,
        'priceNGRS': priceNGRS,
        'priceNGRSTotal': priceNGRSTotal,
        'priceProgram': priceProgram,
        'priceProgramTotal': priceProgramTotal,
        'price': price,
        'margin': margin,
        'type': type,
        'priceTotal': priceTotal,
        'perdanaSubsidy': perdanaSubsidy,
        'perdanaSubsidyTotal': perdanaSubsidyTotal,
        'telkomselCashback': telkomselCashback,
        'telkomselCashbackTotal': telkomselCashbackTotal,
        'digistarCashback': digistarCashback,
        'digistarCashbackTotal': digistarCashbackTotal,
        'endOfYearInsentive': endOfYearInsentive,
        'endOfYearInsentiveTotal': endOfYearInsentiveTotal,
        'commitmentBudget': commitmentBudget,
        'commitmentBudgetTotal': commitmentBudgetTotal,
        'otherSubsidy': otherSubsidy,
        'otherSubsidyTotal': otherSubsidyTotal,
        'description': description,
        'topable': topable,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class UserModel {
  final String? uid;
  final int id;
  final String email;
  final String name;
  final String role;
  final String status;
  final String? createdAt;
  final String? updatedAt;

  UserModel({
    this.uid,
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  UserModel copyWith({
    String? uid,
    int? id,
    int? clusterID,
    String? email,
    String? name,
    String? role,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) =>
      UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        role: role ?? this.role,
        status: status ?? this.status,
      );

  factory UserModel.fromMap(Map<dynamic, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      id: json['id'],
      email: json['email'],
      name: json['name'],
      role: json['role'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'id': id,
        'email': email,
        'name': name,
        'role': role,
        'status': status,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class SalesModel {
  final String? uid;
  final int? id;
  final int clusterId;
  final int userId;
  final String email;
  final String name;
  final String division;
  final String position;
  final String status;
  final String? latitude;
  final String? longitude;
  final int? credits;
  final String? createdAt;
  final String? updatedAt;

  final ClusterModel? cluster;
  final UserModel? user;

  SalesModel({
    this.uid,
    this.id,
    required this.clusterId,
    required this.userId,
    required this.email,
    required this.name,
    required this.division,
    required this.position,
    required this.status,
    this.latitude,
    this.longitude,
    this.credits,
    this.createdAt,
    this.updatedAt,
    this.cluster,
    this.user,
  });

  SalesModel copyWith({
    int? clusterId,
    int? userId,
    String? email,
    String? name,
    String? division,
    String? position,
    String? status,
    int? credits,
    ClusterModel? cluster,
    UserModel? user,
  }) =>
      SalesModel(
        clusterId: clusterId ?? this.clusterId,
        userId: userId ?? this.userId,
        email: email ?? this.email,
        name: name ?? this.name,
        division: division ?? this.division,
        position: position ?? this.position,
        status: status ?? this.status,
        credits: credits ?? this.credits,
        cluster: cluster ?? this.cluster,
        user: user ?? this.user,
      );

  factory SalesModel.fromMap(Map<dynamic, dynamic> json) {
    return SalesModel(
      uid: json['uid'],
      id: json['id'],
      clusterId: json['clusterId'],
      userId: json['userId'],
      email: json['email'],
      name: json['name'],
      division: json['division'],
      position: json['position'],
      status: json['status'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      credits: json['credits'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      cluster: json['cluster'] != null
          ? ClusterModel.fromMap(
              json['cluster'],
            )
          : null,
      user: json['user'] != null
          ? UserModel.fromMap(
              json['user'],
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'id': id,
        'clusterId': clusterId,
        'userId': userId,
        'email': email,
        'name': name,
        'division': division,
        'position': position,
        'status': status,
        'latitude': latitude,
        'longitude': longitude,
        'credits': credits,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'cluster': cluster?.toJson(),
        'user': user?.toJson(),
      };

  static SalesModel get initialData {
    return SalesModel(
      uid: '',
      id: 0,
      clusterId: 0,
      userId: 0,
      email: '',
      name: '',
      division: '',
      position: '',
      status: '',
      latitude: '0.0',
      longitude: '0.0',
      credits: 0,
      cluster: null,
      createdAt: '',
      updatedAt: '',
    );
  }
}

class OutletModel {
  final int? id;
  final int clusterId;
  final int? salesId;
  final String? noChip;
  final String? noSd;
  final String name;
  final String active;
  final String type;
  final String address;
  final String? latitude;
  final String? longitude;
  final String? day;
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;

  double? distance;
  final ClusterModel? cluster;
  final SalesModel? sales;

  OutletModel({
    this.id,
    required this.clusterId,
    required this.salesId,
    this.noChip,
    this.noSd,
    required this.name,
    required this.active,
    required this.type,
    required this.address,
    this.latitude,
    this.longitude,
    required this.day,
    this.cluster,
    this.sales,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.distance,
  });

  OutletModel copyWith({
    int? id,
    int? clusterId,
    int? salesId,
    String? noChip,
    String? noSd,
    String? name,
    String? active,
    String? type,
    String? address,
    double? latitude,
    double? longitude,
    String? day,
    ClusterModel? cluster,
    SalesModel? sales,
    bool? isDeleted,
    String? createdAt,
    String? updatedAt,
    double? distance,
  }) =>
      OutletModel(
        id: id ?? this.id,
        clusterId: clusterId ?? this.clusterId,
        salesId: salesId ?? this.salesId,
        noChip: noChip ?? this.noChip,
        noSd: noSd ?? this.noSd,
        name: name ?? this.name,
        active: active ?? this.active,
        type: type ?? this.type,
        address: address ?? this.address,
        day: day ?? this.day,
        cluster: cluster ?? this.cluster,
        sales: sales ?? this.sales,
        distance: distance ?? this.distance,
      );

  factory OutletModel.fromJson(Map<String, dynamic> data) => OutletModel(
        id: data['id'],
        clusterId: data['clusterId'],
        salesId: data['salesId'],
        noChip: data['noChip'],
        noSd: data['noSd'],
        name: data['name'],
        active: data['active'],
        type: data['type'],
        address: data['address'],
        latitude: data['latitude'],
        longitude: data['longitude'],
        day: data['day'],
        cluster: data['cluster'] != null
            ? ClusterModel.fromMap(data['cluster'])
            : null,
        sales: data['sales'] != null ? SalesModel.fromMap(data['sales']) : null,
        isDeleted: data['isDeleted'],
        createdAt: data['createdAt'],
        updatedAt: data['updatedAt'] ?? '',
        distance: data['distance'] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        'clusterId': clusterId,
        'salesId': salesId,
        'noChip': noChip,
        'noSd': noSd,
        'name': name,
        'active': active,
        'type': type,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
        'day': day,
        'cluster': cluster?.toJson(),
        'sales': sales?.toJson(),
        'isDeleted': isDeleted,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'distance': distance,
      };
}

class WarehouseStockModel {
  final int? id;
  final int? clusterId;
  final int? itemId;
  final int? programId;
  final int? salesId;
  final int? outletId;
  final String? docNumber;
  final int serialNumber;
  final bool isDeleted;
  final String? expiredAt;
  final String? msisdn;
  final String? createdAt;
  final String? updatedAt;
  final String? uniqueId;

  final int? clusterDestination;
  final bool? verifiedByDestination;
  final String? outletAt;
  final String? salesAt;
  final String? clusterAt;
  final String? programAt;
  final String? programName;

  final ClusterModel? cluster;
  final ItemModel? item;
  final ProgramModel? program;
  final SalesModel? sales;
  final OutletModel? outlet;

  WarehouseStockModel({
    this.id,
    this.clusterId,
    this.itemId,
    this.programId,
    this.salesId,
    this.outletId,
    required this.isDeleted,
    this.docNumber,
    required this.serialNumber,
    this.expiredAt,
    this.msisdn,
    this.createdAt,
    this.updatedAt,
    this.uniqueId,
    this.clusterDestination,
    this.verifiedByDestination,
    this.outletAt,
    this.salesAt,
    this.clusterAt,
    this.programAt,
    this.programName,
    this.cluster,
    this.item,
    this.program,
    this.sales,
    this.outlet,
  });

  factory WarehouseStockModel.fromJson(Map<String, dynamic> json) =>
      WarehouseStockModel(
        id: json['id'],
        clusterId: json['clusterId'],
        itemId: json['itemId'],
        programId: json['programId'],
        salesId: json['salesId'],
        outletId: json['outletId'],
        docNumber: json['docNumber'],
        serialNumber: json['serialNumber'],
        isDeleted: json['isDeleted'],
        expiredAt: json['expiredAt'],
        msisdn: json['msisdn'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        uniqueId: json['uniqueId'],
        clusterDestination: json['clusterDestination'],
        verifiedByDestination: json['verifiedByDestination'],
        outletAt: json['outletAt'],
        salesAt: json['salesAt'],
        clusterAt: json['clusterAt'],
        programAt: json['programAt'],
        programName: json['programName'],
        cluster: json['cluster'] != null
            ? ClusterModel.fromMap(
                json['cluster'],
              )
            : null,
        item: json['item'] != null
            ? ItemModel.fromMap(
                json['item'],
              )
            : null,
        program: json['program'] != null
            ? ProgramModel.fromJson(
                json['program'],
              )
            : null,
        sales: json['sales'] != null
            ? SalesModel.fromMap(
                json['sales'],
              )
            : null,
        outlet: json['outlet'] != null
            ? OutletModel.fromJson(
                json['outlet'],
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        'clusterId': clusterId,
        'itemId': itemId,
        'programId': programId,
        'salesId': salesId,
        'outletId': outletId,
        'docNumber': docNumber,
        'serialNumber': serialNumber,
        'isDeleted': isDeleted,
        'expiredAt': expiredAt,
        'msisdn': msisdn,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'clusterDestination': clusterDestination,
        'verifiedByDestination': verifiedByDestination,
        'outletAt': outletAt,
        'salesAt': salesAt,
        'clusterAt': clusterAt,
        'cluster': cluster?.toJson(),
        'item': item?.toJson(),
        'program': program?.toJson(),
        'sales': sales?.toJson(),
        'outlet': outlet?.toJson(),
      };

  Map<String, dynamic> toJson2() => {
        'id': id,
        'clusterId': clusterId,
        'itemId': itemId,
        'programId': programId,
        'salesId': salesId,
        'outletId': outletId,
        'docNumber': docNumber,
        'serialNumber': serialNumber,
        'isDeleted': isDeleted,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };

  WarehouseStockModel copyWith({
    int? clusterId,
    int? itemId,
    int? programId,
    int? salesId,
    int? outletId,
    String? docNumber,
    int? serialNumber,
    bool? isDeleted,
    String? expiredAt,
    String? msisdn,
    String? createdAt,
    String? updatedAt,
    String? uniqueId,
    int? clusterDestination,
    bool? verifiedByDestination,
    String? outletAt,
    String? salesAt,
    String? clusterAt,
    String? programAt,
    String? programName,
  }) =>
      WarehouseStockModel(
        id: id,
        clusterId: clusterId ?? this.clusterId,
        itemId: itemId ?? this.itemId,
        programId: programId ?? this.programId,
        salesId: salesId ?? this.salesId,
        outletId: outletId ?? this.outletId,
        docNumber: docNumber ?? this.docNumber,
        serialNumber: serialNumber ?? this.serialNumber,
        isDeleted: isDeleted ?? this.isDeleted,
        expiredAt: expiredAt ?? this.expiredAt,
        msisdn: msisdn ?? this.msisdn,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        uniqueId: uniqueId ?? this.uniqueId,
        clusterDestination: clusterDestination ?? this.clusterDestination,
        verifiedByDestination:
            verifiedByDestination ?? this.verifiedByDestination,
        outletAt: outletAt ?? this.outletAt,
        salesAt: salesAt ?? this.salesAt,
        clusterAt: clusterAt ?? this.clusterAt,
        programAt: programAt ?? this.programAt,
        programName: programName ?? this.programName,
      );

  Map<String, dynamic> toJson3() => {
        'id': id,
        'itemId': itemId,
        'docNumber': docNumber,
        'serialNumber': serialNumber,
        'programName': programName,
        'isDeleted': isDeleted,
        'clusterId': clusterId,
        'programId': programId,
        'clusterDestination': clusterDestination,
        'verifiedByDestination': verifiedByDestination,
        'salesId': salesId,
        'outletId': outletId,
        'msisdn': msisdn,
        'outletAt': outletAt,
        'salesAt': salesAt,
        'clusterAt': clusterAt,
        'expiredAt': expiredAt,
        'uniqueId': uniqueId,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'programAt': programAt,
      };
}

class ReceiptDetailModel {
  final int? id;
  final int? itemId;
  final int? receiptId;
  final Map<String, dynamic>? item;
  final String? docNumber;
  final int? serialNumber;
  final bool? isDeleted;
  final int? clusterId;
  final Map<String, dynamic>? cluster;
  final int? programId;
  final Map<String, dynamic>? program;
  final int? clusterDestination;
  final bool? verifiedByDestination;
  final int? salesId;
  final Map<String, dynamic>? sales;
  final int? outletId;
  final Map<String, dynamic>? outlet;
  final String? msisdn;
  final String? outletAt;
  final String? salesAt;
  final String? clusterAt;
  final String? expiredAt;
  final String? createdAt;

  ReceiptDetailModel({
    this.id,
    this.receiptId,
    this.itemId,
    this.item,
    this.docNumber,
    this.serialNumber,
    this.isDeleted,
    this.clusterId,
    this.cluster,
    this.programId,
    this.program,
    this.clusterDestination,
    this.verifiedByDestination,
    this.salesId,
    this.sales,
    this.outletId,
    this.outlet,
    this.msisdn,
    this.outletAt,
    this.salesAt,
    this.clusterAt,
    this.expiredAt,
    this.createdAt,
  });

  ReceiptDetailModel copyWith({
    int? id,
    int? receiptId,
    int? itemId,
    Map<String, dynamic>? item,
    String? docNumber,
    int? serialNumber,
    bool? isDeleted,
    int? clusterId,
    Map<String, dynamic>? cluster,
    int? programId,
    Map<String, dynamic>? program,
    int? clusterDestination,
    bool? verifiedByDestination,
    int? salesId,
    Map<String, dynamic>? sales,
    int? outletId,
    Map<String, dynamic>? outlet,
    String? msisdn,
    String? outletAt,
    String? salesAt,
    String? clusterAt,
    String? expiredAt,
    String? createdAt,
  }) {
    return ReceiptDetailModel(
      id: id ?? this.id,
      receiptId: receiptId ?? this.receiptId,
      itemId: itemId ?? this.itemId,
      item: item ?? this.item,
      docNumber: docNumber ?? this.docNumber,
      serialNumber: serialNumber ?? this.serialNumber,
      isDeleted: isDeleted ?? this.isDeleted,
      clusterId: clusterId ?? this.clusterId,
      cluster: cluster ?? this.cluster,
      programId: programId ?? this.programId,
      program: program ?? this.program,
      clusterDestination: clusterDestination ?? this.clusterDestination,
      verifiedByDestination:
          verifiedByDestination ?? this.verifiedByDestination,
      salesId: salesId ?? this.salesId,
      sales: sales ?? this.sales,
      outletId: outletId ?? this.outletId,
      outlet: outlet ?? this.outlet,
      msisdn: msisdn ?? this.msisdn,
      outletAt: outletAt ?? this.outletAt,
      salesAt: salesAt ?? this.salesAt,
      clusterAt: clusterAt ?? this.clusterAt,
      expiredAt: expiredAt ?? this.expiredAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory ReceiptDetailModel.fromJson(Map<String, dynamic> json) =>
      ReceiptDetailModel(
        id: json['id'],
        receiptId: json['receiptId'],
        itemId: json['itemId'],
        item: json['item'],
        docNumber: json['docNumber'],
        serialNumber: json['serialNumber'],
        isDeleted: json['isDeleted'],
        clusterId: json['clusterId'],
        cluster: json['cluster'],
        programId: json['programId'],
        program: json['program'],
        clusterDestination: json['clusterDestination'],
        verifiedByDestination: json['verifiedByDestination'],
        salesId: json['salesId'],
        sales: json['sales'],
        outletId: json['outletId'],
        outlet: json['outlet'],
        msisdn: json['msisdn'],
        outletAt: json['outletAt'],
        salesAt: json['salesAt'],
        clusterAt: json['clusterAt'],
        expiredAt: json['expiredAt'],
        createdAt: json['createdAt'],
      );

  Map<String, dynamic> toJson() => {
        // 'id': id,
        'itemId': itemId,
        'docNumber': docNumber,
        'serialNumber': serialNumber,
        'createdAt': createdAt,
        'updatedAt': null,
        'isDeleted': isDeleted,
        'clusterId': clusterId,
        'programId': programId,
        'clusterDestination': clusterDestination,
        'verifiedByDestination': verifiedByDestination,
        'salesId': salesId,
        'outletId': outletId,
        'msisdn': msisdn,
        'outletAt': outletAt,
        'salesAt': salesAt,
        'clusterAt': clusterAt,
        'expiredAt': expiredAt,
        'receiptId': receiptId,
        'item': item,
        'cluster': cluster,
        'program': program,
        'sales': sales,
        'outlet': outlet,
      };
}

class ReceiptModel {
  final int? id;
  final int salesId;
  final int outletId;
  final int historyId;
  final String type;
  final Map<String, dynamic> data;
  final String paymentMethod;
  final int cash;
  final int bni;
  final int bri;
  final int bca;
  final int mandiri;
  final String? receiptLink;
  final String? termOfPayment;
  final bool paidOff;
  final String? createdAt;
  final String? updatedAt;
  final String? invoiceNumber;

  final SalesModel? sales;
  final OutletModel? outlet;
  final HistoryModel? history;
  final List<WarehouseStockModel>? stocks;

  ReceiptModel({
    this.id,
    required this.salesId,
    required this.outletId,
    required this.historyId,
    required this.type,
    required this.data,
    required this.paymentMethod,
    required this.cash,
    required this.bni,
    required this.bri,
    required this.bca,
    required this.mandiri,
    this.receiptLink,
    this.termOfPayment,
    required this.paidOff,
    this.createdAt,
    this.updatedAt,
    this.invoiceNumber,
    this.sales,
    this.outlet,
    this.history,
    this.stocks,
  });

  ReceiptModel copyWith({
    int? id,
    int? salesId,
    int? outletId,
    int? historyId,
    String? type,
    Map<String, dynamic>? data,
    String? paymentMethod,
    int? cash,
    int? bni,
    int? bri,
    int? bca,
    int? mandiri,
    String? receiptLink,
    String? termOfPayment,
    bool? paidOff,
    String? createdAt,
    String? updatedAt,
    String? invoiceNumber,
  }) {
    return ReceiptModel(
      id: id ?? this.id,
      salesId: salesId ?? this.salesId,
      outletId: outletId ?? this.outletId,
      historyId: historyId ?? this.historyId,
      type: type ?? this.type,
      data: data ?? this.data,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      cash: cash ?? this.cash,
      bni: bni ?? this.bni,
      bri: bri ?? this.bri,
      bca: bca ?? this.bca,
      mandiri: mandiri ?? this.mandiri,
      receiptLink: receiptLink ?? this.receiptLink,
      termOfPayment: termOfPayment ?? this.termOfPayment,
      paidOff: paidOff ?? this.paidOff,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
    );
  }

  factory ReceiptModel.fromJson(Map<String, dynamic> json) => ReceiptModel(
        id: json['id'],
        salesId: json['salesId'],
        outletId: json['outletId'],
        historyId: json['historyId'],
        type: json['type'],
        data: json['data'],
        paymentMethod: json['paymentMethod'],
        cash: json['cash'],
        bni: json['bni'],
        bri: json['bri'],
        bca: json['bca'],
        mandiri: json['mandiri'],
        receiptLink: json['receiptLink'],
        termOfPayment: json['termOfPayment'],
        paidOff: json['paidOff'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        invoiceNumber: json['invoiceNumber'],
        sales: json['sales'] != null
            ? SalesModel.fromMap(
                json['sales'],
              )
            : null,
        outlet: json['outlet'] != null
            ? OutletModel.fromJson(
                json['outlet'],
              )
            : null,
        history: json['history'] != null
            ? HistoryModel.fromJson(
                json['history'],
              )
            : null,
        stocks: json['stocks'] != null
            ? List.from(
                json['stocks'],
              ).map((e) => WarehouseStockModel.fromJson(e)).toList()
            : null,
      );

  Map<String, dynamic> toJson() => {
        'salesId': salesId,
        'outletId': outletId,
        'historyId': historyId,
        'type': type,
        'data': data,
        'paymentMethod': paymentMethod,
        'cash': cash,
        'bni': bni,
        'bri': bri,
        'bca': bca,
        'mandiri': mandiri,
        'receiptLink': receiptLink,
        'termOfPayment': termOfPayment,
        'paidOff': paidOff,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'invoiceNumber': invoiceNumber,
      };
}

class HistoryModel {
  final int? id;
  final int salesId;
  final int? outletId;
  final String type;
  final String status;
  final Map<String, dynamic> data;
  final String? createdAt;
  final String? updatedAt;

  final SalesModel? sales;
  final OutletModel? outlet;
  final ReceiptModel? receipt;

  HistoryModel({
    this.id,
    required this.salesId,
    this.outletId,
    required this.type,
    required this.status,
    required this.data,
    this.createdAt,
    this.updatedAt,
    this.sales,
    this.outlet,
    this.receipt,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        id: json['id'],
        salesId: json['salesId'],
        outletId: json['outletId'],
        type: json['type'],
        status: json['status'],
        data: json['data'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        sales: json['sales'] != null
            ? SalesModel.fromMap(
                json['sales'],
              )
            : null,
        outlet: json['outlet'] != null
            ? OutletModel.fromJson(
                json['outlet'],
              )
            : null,
        receipt: json['receipt'] != null
            ? ReceiptModel.fromJson(
                json['receipt'][0],
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        'salesId': salesId,
        'outletId': outletId,
        'type': type,
        'status': status,
        'data': data,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
