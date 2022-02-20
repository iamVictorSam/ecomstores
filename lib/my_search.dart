// import 'package:dio/dio.dart';
// import 'package:ecomstore/controllers/cateProdController.dart';
// import 'package:ecomstore/data_layer/models/all_products.dart';
// import 'package:ecomstore/data_layer/models/all_products.dart';
// import 'package:ecomstore/screens/details/details_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;



// class ExamplePage extends StatefulWidget {
//   // ExamplePage({ Key key }) : super(key: key);
//   @override
//   _ExamplePageState createState() => new _ExamplePageState();
// }

// class _ExamplePageState extends State<ExamplePage> {
//   // final formKey = new GlobalKey<FormState>();
//   // final key = new GlobalKey<ScaffoldState>();
//   // final productController = Get.put(ProductController(), permanent: true);
//   // final productController = Get.lazyPut(() => ProductController());

//   final productController = Get.find<GetAllCatProductsController>(tag: 'product');

//   final TextEditingController _filter = new TextEditingController();
//   final dio = new Dio();
//   String _searchText = "";
//   List names = RxList<AllProducts>();
//   List filteredNames = new RxList<AllProducts>();
//   Icon _searchIcon = new Icon(Icons.search);
//   Widget _appBarTitle = new Text('Search Example');
//   static var client = http.Client();

//   _ExamplePageState() {
//     _filter.addListener(() {
//       if (_filter.text.isEmpty) {
//         setState(() {
//           _searchText = "";
//           filteredNames = names;
//         });
//       } else {
//         setState(() {
//           _searchText = _filter.text;
//         });
//       }
//     });
//   }

//   @override
//   void initState() {
//     // this._getNames();

//     setState(() {
//       final productController = Get.put((GetAllCatProductsController));
//       names = productController.;

//       names.shuffle();
//       filteredNames = names;
//     });
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: _buildBar(context),
//       appBar: AppBar(
//         title: TextField(
//           controller: _filter,
//           decoration: new InputDecoration(
//               focusColor: kPrimaryColor,
//               prefixIcon: new Icon(Icons.search),
//               hintText: 'Search...'),
//         ),
//         elevation: 1.0,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(
//                 icon: Icon(Icons.close),
//                 onPressed: () {
//                   filteredNames = names;
//                   _filter.clear();
//                 }),
//           ),
//         ],
//       ),
//       body: Container(
//         child: _buildList(),
//       ),
//       // resizeToAvoidBottomPadding: false,
//     );
//   }

//   Widget _buildBar(BuildContext context) {
//     return new AppBar(
//       centerTitle: true,
//       title: _appBarTitle,
//       leading: new IconButton(
//         icon: _searchIcon,
//         onPressed: _searchPressed,
//       ),
//     );
//   }

//   Widget _buildList() {
//     if ((_searchText.isNotEmpty)) {
//       List tempList = new RxList<Products>();
//       for (int i = 0; i < filteredNames.length; i++) {
//         if (filteredNames[i]
//             .name
//             .toLowerCase()
//             .contains(_searchText.toLowerCase())) {
//           tempList.add(productController.products[i]);
//         }
//       }
//       filteredNames = tempList;
//     }
//     return ListView.builder(
//       itemCount: names == null ? 0 : filteredNames.length,
//       itemBuilder: (BuildContext context, int index) {
//         return new ListTile(
//           leading: Container(
//             height: 60,
//             width: 50,
//             child: Image.network(
//               filteredNames[index].thumbnail,
//             ),
//           ),
//           title: Text(filteredNames[index].name),
//           onTap: () {
//             Navigator.pushNamed(
//               context,
//               DetailsScreen.routeName,
//               arguments: ProductDetailsArguments(product: filteredNames[index]),
//             );
//           },
//         );
//       },
//     );
//   }

//   void _searchPressed() {
//     setState(() {
//       if (this._searchIcon.icon == Icons.search) {
//         this._searchIcon = new Icon(Icons.close);
//         this._appBarTitle = new TextField(
//           controller: _filter,
//           decoration: new InputDecoration(
//               prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
//         );
//       } else {
//         this._searchIcon = new Icon(Icons.search);
//         this._appBarTitle = new Text('Search Example');
//         filteredNames = names;
//         _filter.clear();
//       }
//     });
//   }

// //

//   // static var client = http.Client();

//   static Future<List<Products>> fetchData() async {
//     var response = await client
//         .get(Uri.parse('https://uandu.com.ng/web-products.php?per_page=5'));
//     if (response.statusCode == 200) {
//       var jsonString = response.body;
//       return productsFromJson(jsonString);
//     } else {
//       return null;
//     }
//   }

//   // void _getNames() async {
//   //   final response =
//   //       await dio.get('https://uandu.com.ng/web-products.php?per_page=5');
//   //   List tempList = new List();
//   //   for (int i = 0; i < response.data['results'].length; i++) {
//   //     tempList.add(response.data['results'][i]);
//   //   }
//   //   setState(() {
//   //     names = tempList;
//   //     names.shuffle();
//   //     filteredNames = names;
//   //   });
//   // }
// }
