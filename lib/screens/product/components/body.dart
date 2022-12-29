import 'package:flutter/material.dart';
import 'package:thue_do_cosplay/screens/home/components/home_header.dart';
import 'package:thue_do_cosplay/screens/home/components/section_title.dart';

import '../../../size_config.dart';
// import 'popular_product.dart';

class Body extends StatefulWidget {
  Body({required this.keyword});
  String keyword;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String title = 'Sản phẩm mới';
  bool search = false;
  // We will fetch data from this Rest api
  // final _baseUrl = 'https://wibuteam.phatdev.xyz/api/?action=get_products';
  // At the beginning, we fetch the first 20 posts
  int _page = 1;
  int _limit = 20;
  // There is next page or not
  bool _hasNextPage = true;
  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;
  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;
  // This holds the posts fetched from the server
  // List _posts = [];
  //List<Product> _products = [];
  // This function will be called when the app launches (see the initState function)
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    if (widget.keyword.length >= 3) {
      search = true;
      title = 'Tìm kiếm';
    }
    //chức năng search cần api
    // try {
    //   // final res =
    //   //     await http.get(Uri.parse("$_baseUrl?page=$_page&limit=$_limit"));
    //   final res;
    //   if (search)
    //     res = await getProductsBySearch(widget.keyword, _page, _limit);
    //   else
    //     res = await getProducts(_page, _limit);
    //   setState(() {
    //     // _posts = json.decode(res.body);
    //     _products = res!;
    //   });
    // } catch (err) {
    //   print('Something went wrong');
    // }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  // This function will be triggered whenver the user scroll
  // to near the bottom of the list view
  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1
      try {
        // final res =
        //     await http.get(Uri.parse("$_baseUrl?page=$_page&limit=$_limit"));
        //chỗ này cũng là chức năng tạm cmt lại nha
        // var res;
        // if (search)
        //   res = await getProductsBySearch(widget.keyword, _page, _limit);
        // else
        //   res = await getProducts(_page, _limit);

        // // final List fetchedPosts = json.decode(res.body);
        // final List<Product> fetchedProducts = res!;
        // if (fetchedProducts.length > 0) {
        //   setState(() {
        //     _products.addAll(fetchedProducts);
        //   });
        // } else {
        //   // This means there is no more data
        //   // and therefore, we will not send another GET request
        //   setState(() {
        //     _hasNextPage = false;
        //   });
        // }
      } catch (err) {
        print('Something went wrong!');
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  // The controller for the ListView
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = new ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          HomeHeader(),
          SizedBox(height: getProportionateScreenWidth(10)),
          // PopularProducts(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SectionTitle(
              title: title,
              press: () {},
              seeMore: false,
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          
          //có api thì show chỗ này ra nha
          // _isFirstLoadRunning
          //     ? Center(
          //         child: CircularProgressIndicator(),
          //       )
          //     : Expanded(
          //         child: GridView.count(
          //           // shrinkWrap: true,
          //           padding: EdgeInsets.all(18.0),
          //           childAspectRatio: 1 / 1.5,
          //           crossAxisCount: 2,
          //           children: [
          //             ...List.generate(
          //               _products.length,
          //               (index) {
          //                 return ProductCard(product: _products[index]);
          //               },
          //             ),
          //             SizedBox(width: getProportionateScreenWidth(20)),
          //           ],
          //         ),
          //       ),
          // SizedBox(width: getProportionateScreenWidth(20)),
          // when the _loadMore function is running
          if (_isLoadMoreRunning == true)
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 40),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          SizedBox(height: getProportionateScreenWidth(30)),
        ],
      ),
      // ),
    );
  }
}
